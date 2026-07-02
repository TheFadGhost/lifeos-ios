# Free Install On iPhone 15 Pro With A MacBook

This is the free path for your friend's MacBook and iPhone 15 Pro. It uses only free tools: Xcode, an Apple Account, Homebrew, and XcodeGen.

## The Important Apple Limit

Apple allows free on-device testing with an Xcode Personal Team, but the free provisioning profile expires after 7 days. Apple documents this under [Choosing a Membership](https://developer.apple.com/support/compare-memberships/): Personal Team App IDs, test-device registrations, and provisioning profiles expire after 7 days.

That means there is no fully free, one-time, forever-signed native iPhone install. The free forever workflow is:

1. Install LifeOS with Xcode.
2. Use it normally.
3. Once a week, plug the iPhone into the MacBook and press Run in Xcode again.

Do not delete the app when refreshing. Installing over the same app keeps the local LifeOS data on the phone.

## What To Download On The MacBook

1. Open **App Store** on the MacBook.
2. Search for **Xcode**.
3. Click **Get** or the download icon.
4. After it installs, open **Xcode** once.
5. Click **Agree** when the license prompt appears.
6. Let Xcode install extra components if it asks.

Then install the free project generator:

1. Open **Terminal** on the MacBook.
2. If Homebrew is not installed, paste the install command from [brew.sh](https://brew.sh), then press **Return**.
3. Run:

```bash
brew install xcodegen
```

## Download LifeOS

1. Open [LifeOS iOS v1.00](https://github.com/TheFadGhost/lifeos-ios/releases/tag/v1.00-ios).
2. Under **Assets**, click **LifeOS-iOS-v1.00-release-kit.zip**.
3. Open the downloaded zip file.
4. Move the unzipped folder somewhere easy, such as **Desktop**.

## Open The App In Xcode

1. Open the unzipped LifeOS folder.
2. Open the **scripts** folder.
3. Double-click **open-lifeos-in-xcode.command**.
4. If macOS blocks it, right-click the file, click **Open**, then click **Open** again.
5. Xcode should open **LifeOS.xcodeproj**.

If the script says XcodeGen is missing, go back to Terminal and run:

```bash
brew install xcodegen
```

## Sign In To Xcode For Free

1. In Xcode, click **Xcode** in the menu bar.
2. Click **Settings**.
3. Click **Accounts**.
4. Click the **+** button.
5. Click **Apple Account**.
6. Sign in with the same Apple Account used on the iPhone if possible.
7. Close Settings.

## Set Signing

1. In the left sidebar, click the blue **LifeOS** project icon.
2. Under **Targets**, click **LifeOS**.
3. Click **Signing & Capabilities**.
4. Tick **Automatically manage signing**.
5. In **Team**, choose the free **Personal Team**.
6. If Xcode says the bundle identifier is taken, change **Bundle Identifier** to something unique, for example:

```text
app.lifeos.ios.yourfirstname
```

## Prepare The iPhone 15 Pro

1. Connect the iPhone 15 Pro to the MacBook with a USB-C cable.
2. Unlock the iPhone.
3. If the phone asks **Trust This Computer?**, tap **Trust** and enter the passcode.
4. In Xcode, click **Window** in the menu bar.
5. Click **Devices and Simulators**.
6. Select the iPhone and wait until Xcode finishes preparing it.

Developer Mode is required by Apple for local development apps. Apple documents this at [Enabling Developer Mode on a device](https://developer.apple.com/documentation/xcode/enabling-developer-mode-on-a-device).

On the iPhone:

1. Open **Settings**.
2. Tap **Privacy & Security**.
3. Scroll down and tap **Developer Mode**.
4. Turn **Developer Mode** on.
5. Tap **Restart**.
6. After the phone restarts, unlock it.
7. Tap **Turn On** when iOS asks, then enter the passcode.

If Developer Mode is not visible, keep the iPhone plugged in, open **Window > Devices and Simulators** in Xcode, then unplug and reconnect the iPhone.

## Install LifeOS

1. In Xcode's top toolbar, click the device selector next to the **LifeOS** scheme.
2. Choose the connected **iPhone 15 Pro**.
3. Click the **Run** button, the triangle play icon.
4. Wait while Xcode builds and installs the app.
5. If Xcode shows signing prompts, click **Allow** or enter the Mac password.
6. When LifeOS opens on the iPhone, the install worked.

If the iPhone says the developer is not trusted:

1. Open **Settings** on the iPhone.
2. Tap **General**.
3. Tap **VPN & Device Management**.
4. Tap the developer profile for the Apple Account.
5. Tap **Trust**.
6. Open LifeOS again.

## Keep Using It For Free

Every 6 or 7 days:

1. Connect the iPhone to the MacBook.
2. Open the same LifeOS folder.
3. Double-click **scripts/open-lifeos-in-xcode.command**.
4. In Xcode, select the iPhone 15 Pro.
5. Click **Run**.

Do not delete LifeOS from the iPhone. Running from Xcode again refreshes the free signature and keeps the app data.

## Backup Before Big Changes

LifeOS is offline-only, so the data lives on the phone. Before deleting the app, changing bundle identifiers, resetting the phone, or switching Apple Accounts:

1. Open **LifeOS**.
2. Go to **Settings**.
3. Tap **Export Local Data**.
4. Save the exported folder somewhere safe.

## What Is Not Free

These options remove the weekly refresh hassle, but they are not free:

- Apple Developer Program ad hoc signing.
- TestFlight.
- App Store distribution.

For a no-payment setup, use the Xcode Personal Team flow above and refresh weekly.
