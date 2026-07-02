# LifeOS iOS

LifeOS iOS is a native SwiftUI port of the offline Android LifeOS app. It keeps the same local-first promise: no accounts, no cloud sync, no analytics, no remote config, no downloadable assets, and no network calls.

## What Is Included

- Dashboard command center with command search, quick capture, smart plan, reviews, trends, focus timer, and reminders.
- Habits, Tasks, Calendar, Money, Fitness, Level Up, Notes, and Settings modules.
- Local JSON persistence in Application Support.
- Local notification scheduling for reminders.
- Local JSON/CSV export.
- Theme presets matching the Android LifeOS theme names.
- Free Xcode/iPhone install instructions for testers.
- Optional ad hoc `.ipa` signing/export scripts for paid Apple Developer accounts.

## Free Install On Your Friend's iPhone

See [release/FREE_XCODE_IPHONE_INSTALL.md](release/FREE_XCODE_IPHONE_INSTALL.md).

This path uses free tools only: Xcode, a free Apple Account, Homebrew, and XcodeGen. Apple free provisioning profiles expire after 7 days, so the app can be used for free indefinitely by reconnecting the iPhone to the MacBook and pressing **Run** in Xcode once a week. Do not delete the app when refreshing; installing over the same bundle keeps the local LifeOS data.

## Build On macOS

Requirements:

- macOS with Xcode installed.
- XcodeGen: `brew install xcodegen`.

```bash
cd LifeOS
xcodegen generate
xcodebuild test -scheme LifeOS -destination 'platform=iOS Simulator,name=iPhone 16'
```

## Create A Direct Install `.ipa` With Paid Ad Hoc Signing

See [release/INSTALL_ADHOC_IPA.md](release/INSTALL_ADHOC_IPA.md).

This is not the free path. Apple ad hoc `.ipa` installs require an Apple Developer Program membership, an iOS Distribution certificate, and a provisioning profile containing the tester iPhone UDID.

Short version:

```bash
TEAM_ID=YOURTEAMID \
PROFILE_NAME="LifeOS Ad Hoc" \
BUNDLE_ID=app.lifeos.ios \
./scripts/build-adhoc-ipa.sh
```

The signed `.ipa` is written to `build/export/LifeOS.ipa`.

## Direct Install Without TestFlight, But Not Without Signing

Your friend does not need TestFlight, but their iPhone must be registered in your Apple Developer account before signing. Install options are:

- Apple Configurator or Xcode Devices on a Mac.
- HTTPS over-the-air install using the generated manifest.

Apple's ad hoc distribution flow requires a registered device and provisioning profile. See Apple's docs:

- [Distributing your app to registered devices](https://developer.apple.com/documentation/xcode/distributing-your-app-to-registered-devices)
- [Create an ad hoc provisioning profile](https://developer.apple.com/help/account/provisioning-profiles/create-an-ad-hoc-provisioning-profile/)
