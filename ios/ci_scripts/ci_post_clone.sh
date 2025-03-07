//
//  ci_post_clone.swift
//  Runner
//
//  Created by Yudiz Solutions Ltd. on 07/03/25.
//

flutter clean
flutter pub get
brew install cocoapods
pod install
xcodebuild archive -workspace /Volumes/workspace/repository/ios/Runner.xcworkspace -scheme Runner -destination generic/platform=iOS -archivePath /Volumes/workspace/build.xcarchive -derivedDataPath /Volumes/workspace/DerivedData -resultBundleVersion 3 -resultBundlePath /Volumes/workspace/resultbundle.xcresult -resultStreamPath /Volumes/workspace/tmp/resultBundleStream204cb033-ad3d-47db-aaca-c2fe1956a617.json -IDEPostProgressNotifications=YES CODE_SIGN_IDENTITY=- AD_HOC_CODE_SIGNING_ALLOWED=YES CODE_SIGN_STYLE=Automatic DEVELOPMENT_TEAM=XGZ34PKRQ2 COMPILER_INDEX_STORE_ENABLE=NO -hideShellScriptEnvironment
