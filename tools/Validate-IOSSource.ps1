$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$required = @(
    "README.md",
    "LifeOS/project.yml",
    "LifeOS/LifeOS/App/LifeOSApp.swift",
    "LifeOS/LifeOS/Core/LifeOSModels.swift",
    "LifeOS/LifeOS/Core/LifeOSLogic.swift",
    "LifeOS/LifeOS/Core/LifeOSStore.swift",
    "LifeOS/LifeOS/Core/LifeOSTheme.swift",
    "LifeOS/LifeOS/Core/ReminderScheduler.swift",
    "LifeOS/LifeOS/Core/LifeOSExport.swift",
    "LifeOS/LifeOS/UI/LifeOSComponents.swift",
    "LifeOS/LifeOS/Features/DashboardScreen.swift",
    "LifeOS/LifeOS/Features/HabitsScreen.swift",
    "LifeOS/LifeOS/Features/TasksScreen.swift",
    "LifeOS/LifeOS/Features/CalendarScreen.swift",
    "LifeOS/LifeOS/Features/ExpensesScreen.swift",
    "LifeOS/LifeOS/Features/FitnessScreen.swift",
    "LifeOS/LifeOS/Features/JournalScreen.swift",
    "LifeOS/LifeOS/Features/NotesScreen.swift",
    "LifeOS/LifeOS/Features/SettingsScreen.swift",
    "LifeOS/LifeOSTests/LifeOSLogicTests.swift",
    "LifeOS/LifeOSTests/LifeOSStoreTests.swift",
    "release/INSTALL_ADHOC_IPA.md",
    "release/ExportOptions-AdHoc.plist",
    "release/ota-manifest-template.plist",
    "scripts/build-adhoc-ipa.sh"
)

foreach ($path in $required) {
    $full = Join-Path $root $path
    if (-not (Test-Path $full)) {
        throw "Missing required file: $path"
    }
}

$sourceFiles = Get-ChildItem -Path (Join-Path $root "LifeOS/LifeOS") -Filter *.swift -Recurse
$sourceText = ($sourceFiles | ForEach-Object { Get-Content -Raw $_.FullName }) -join "`n"

if ($sourceText -match "URLSession|WKWebView|http://|https://") {
    throw "Offline source check failed: network/web reference found in Swift source."
}

foreach ($route in @("dashboard", "habits", "tasks", "calendar", "expenses", "fitness", "journal", "notes", "settings")) {
    if ($sourceText -notmatch $route) {
        throw "Route missing from Swift source: $route"
    }
}

foreach ($theme in @("LIGHT", "DARK", "MIDNIGHT", "FOREST", "SUNRISE", "SAMURAI", "PIXEL", "SAKURA", "GLASS", "NEUMORPHIC", "GLASSMORPHISM", "RAINY", "LOFI", "ANIME")) {
    if ($sourceText -notmatch $theme) {
        throw "Theme missing from Swift source: $theme"
    }
}

$testText = (Get-ChildItem -Path (Join-Path $root "LifeOS/LifeOSTests") -Filter *.swift -Recurse | ForEach-Object { Get-Content -Raw $_.FullName }) -join "`n"
foreach ($testName in @("testQuickCaptureDailyTaskExpandsSevenOccurrences", "testCommandSearchRanksTitleMatchesFirst", "testStoreQuickCaptureAddsRecurringTasks")) {
    if ($testText -notmatch $testName) {
        throw "Expected test missing: $testName"
    }
}

Write-Host "iOS source validation passed."
