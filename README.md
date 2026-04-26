# LifeOS (Flutter Edition)

[![Build & Release](https://github.com/TheFadGhost/lifeos-ios/actions/workflows/build.yml/badge.svg)](https://github.com/TheFadGhost/lifeos-ios/actions/workflows/build.yml)

**LifeOS** is a comprehensive, offline-first productivity and life-management application. Originally developed for Android in native Kotlin, this Flutter edition brings the full LifeOS experience to **iOS** and **Android** with a unified codebase, adaptive UI, and identical data integrity.

> **AI Agent Metadata:**
> - **Package Name:** `app.lifeos`
> - **Framework:** Flutter (Dart) 3.x
> - **State Management:** Riverpod (manual providers)
> - **Database:** Drift (SQLite) - Schema Version 1
> - **Local Notifications:** `flutter_local_notifications`
> - **Platform Support:** iOS 13+, Android 13+ (API 33+)
> - **Local-Only Policy:** No `INTERNET` permission. No cloud sync. No accounts.

---

## 🚀 2026 Testing Guide: Testing on Windows PC

As of 2026, Flutter provides robust tools to test and preview **iOS** behaviors directly on Windows without owning a Mac. Follow this in-depth guide to get LifeOS running on your machine.

### 1. Prerequisites
- **Flutter SDK:** Ensure Flutter is installed and added to your PATH. Run `flutter doctor` to verify.
- **Java JDK 17+:** Required for the Android build toolchain.
- **Android Studio:** For the Android Emulator and SDK management.

### 2. Testing the Android Variant (APK)
The easiest way to test on Windows is using the Android Emulator.
1. **Open Android Studio > Virtual Device Manager.**
2. Create a device with **Android 13.0 (API 33)** or higher.
3. Open a terminal in the project root and run:
   ```powershell
   flutter run
   ```
4. To build a standalone APK for your phone:
   ```powershell
   flutter build apk --debug
   ```
   The APK will be generated at `build/app/outputs/flutter-apk/app-debug.apk`.

### 3. Testing the iOS Variant on Windows
While you cannot compile a `.ipa` file on Windows, you can **perfectly preview the iOS UI, animations, and haptics** using Flutter's platform override features.

#### Method A: The Platform Override (Recommended)
You can force the app to run as if it were on an iPhone using the Android Emulator or Chrome.
1. Launch your Android Emulator.
2. Run the following command to force the iOS design system (Cupertino):
   ```powershell
   flutter run --target-platform ios
   ```
   *The app will now use iOS-style switches, checkboxes, navigation transitions, and the sliding bubble bottom nav.*

#### Method B: Web Preview (High Resolution)
For a pixel-perfect UI review without an emulator:
1. Ensure Chrome is installed.
2. Run:
   ```powershell
   flutter run -d chrome --web-renderer canvaskit
   ```
3. Once the app opens in Chrome, press `F12` to open DevTools, click the **Device Toolbar** icon, and select **iPhone 14/15 Pro**.

---

## 🛠 Features (Parity with Native)
- **Command Center Dashboard:** Real-time clock, greeting, and progress metrics.
- **Daily Habits:** Streak tracking, animated completion, and local-only persistence.
- **Task Management:** Folders, tags, priority levels, and due dates.
- **App-Only Calendar:** Local event tracking with monthly activity indicators.
- **Expense Tracker:** Category-based spending with monthly pie charts.
- **Fitness Hub:** Workout session logging, exercise set tracking, and local images.
- **Level Up (Journal):** Mood tracking, daily reflection, and reading/watch list.
- **Local Reminders:** Offline notifications scheduled via `flutter_local_notifications`.

---

## 📦 Releases & Artifacts
The GitHub repository automatically builds and publishes artifacts for every release:
- **`app-debug.apk`**: Installable Android application.
- **`Runner.app`**: iOS Simulator build (can be dragged into a Mac Simulator).
- **`manifest.json`**: Data schema metadata for CSV compatibility.

---

## 🤝 Contribution for Agents
When modifying this codebase, follow these mandates:
1. **No Internet:** Never add the `INTERNET` permission to `AndroidManifest.xml` or `Info.plist`.
2. **Drift Schema:** If modifying `lib/core/data/tables.dart`, you **must** run:
   ```powershell
   dart run build_runner build --delete-conflicting-outputs
   ```
3. **Adaptive UI:** Use `.adaptive()` constructors for Material widgets to maintain iOS look and feel.
4. **Manual Riverpod:** Do not use `riverpod_generator`. Write providers manually in `lib/core/data/database.dart` or feature provider files.

---
*© 2026 LifeOS Open Source Project. Developed for privacy and performance.*
