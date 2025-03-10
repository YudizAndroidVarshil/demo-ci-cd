#!/bin/sh
# Fail this script if any subcommand fails.
set -e

# Change working directory to the root of your cloned repo.
cd "$CI_PRIMARY_REPOSITORY_PATH"

# Clone the specific Flutter version 3.27.1 directly.
git clone --branch 3.27.1 --depth 1 https://github.com/flutter/flutter.git "$HOME/flutter"

# Add Flutter to the PATH.
export PATH="$PATH:$HOME/flutter/bin"

# Pre-cache iOS artifacts.
flutter precache --ios

# Return to the project root and install Flutter dependencies.
cd "$CI_PRIMARY_REPOSITORY_PATH"
flutter pub get

# Install CocoaPods (disabling Homebrew auto-update).
HOMEBREW_NO_AUTO_UPDATE=1 brew install cocoapods

# Install CocoaPods dependencies.
cd ios && pod install

exit 0
