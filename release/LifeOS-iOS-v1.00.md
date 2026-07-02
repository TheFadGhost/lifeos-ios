# LifeOS iOS v1.00

This public release contains the native iOS source, XcodeGen project definition, release scripts, and direct ad hoc `.ipa` installation instructions.

## Included

- Native SwiftUI LifeOS app.
- Offline-only local JSON persistence.
- Dashboard, Habits, Tasks, Calendar, Money, Fitness, Level Up, Notes, and Settings.
- Local notification support.
- JSON/CSV export.
- XCTest coverage for core Android-equivalent logic.
- macOS ad hoc `.ipa` archive/export script.
- OTA manifest template and install guide.

## Download

Download the release source archive from GitHub, then follow `release/INSTALL_ADHOC_IPA.md` on a Mac to produce the signed `.ipa`.

This release does not include a pre-signed `.ipa` because ad hoc iOS installs require your Apple Developer certificate and a provisioning profile containing the tester's iPhone UDID.

## Build

```bash
cd ios
brew install xcodegen
TEAM_ID=YOURTEAMID PROFILE_NAME="LifeOS Ad Hoc" BUNDLE_ID=app.lifeos.ios ./scripts/build-adhoc-ipa.sh
```
