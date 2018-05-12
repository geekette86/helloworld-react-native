#!/bin/bash -xe

source $(dirname $0)/config.sh

$(dirname $0)/update-release.sh

cd ./ios

export FORCE_BUNDLING=true

xcodebuild build -project $APP_NAME.xcodeproj -scheme $APP_NAME -configuration Debug -sdk iphonesimulator -derivedDataPath ./build

cd ..

(cd ./ios/build/Build/Products/Debug-iphonesimulator && zip -FSr $PROJECT_DIR/build/app-debug.zip $APP_NAME.app)

echo -e '\n ==> ./build/app-debug.zip'
