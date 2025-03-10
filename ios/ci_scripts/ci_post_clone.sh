#!/bin/sh
# Fail this script if any subcommand fails.
set -e

# Change working directory to the root of your cloned repo.
cd "$CI_PRIMARY_REPOSITORY_PATH"

# Clone the Flutter repo.
git clone https://github.com/flutter/flutter.git --depth 1 "$HOME/flutter"

# Switch to Flutter version 3.27.1.
cd "$HOME/flutter"
git checkout 3.27.1

# Add Flutter to PATH.
export PATH="$PATH:$HOME/flutter/bin"

# Cache iOS artifacts.
flutter precache --ios

# Return to your project root and install Flutter dependencies.
cd "$CI_PRIMARY_REPOSITORY_PATH"
flutter pub get

# Install CocoaPods using Homebrew (disable auto-update).
HOMEBREW_NO_AUTO_UPDATE=1 brew install cocoapods

# Install CocoaPods dependencies in the iOS directory.
cd ios && pod install

exit 0
