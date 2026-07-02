# LifeOS iOS v1.00

This public release contains the native iOS source, XcodeGen project definition, release scripts, a free Xcode/iPhone install guide, and optional paid ad hoc `.ipa` installation instructions.

## Included

- Native SwiftUI LifeOS app.
- Offline-only local JSON persistence.
- Dashboard, Habits, Tasks, Calendar, Money, Fitness, Level Up, Notes, and Settings.
- Local notification support.
- JSON/CSV export.
- XCTest coverage for core Android-equivalent logic.
- Free MacBook + iPhone install guide using Xcode Personal Team signing.
- macOS ad hoc `.ipa` archive/export script.
- OTA manifest template and install guide.

## Download

Download `LifeOS-iOS-v1.00-release-kit.zip` from GitHub.

For the free route, follow `release/FREE_XCODE_IPHONE_INSTALL.md` on your friend's MacBook. Apple free provisioning profiles expire after 7 days, so the free workflow is to refresh the install from Xcode once a week without deleting the app.

For a direct `.ipa`, follow `release/INSTALL_ADHOC_IPA.md`. This release does not include a pre-signed `.ipa` because iPhone-installable ad hoc `.ipa` files require your Apple Developer certificate and a provisioning profile containing the tester's iPhone UDID.

## Build

```bash
brew install xcodegen
TEAM_ID=YOURTEAMID PROFILE_NAME="LifeOS Ad Hoc" BUNDLE_ID=app.lifeos.ios ./scripts/build-adhoc-ipa.sh
```
