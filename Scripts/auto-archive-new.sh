#!/bin/bash -il

CONFIGURATION=$1

#CODE_SIGN_IDENTITY="iPhone Distribution: Beijing Zhongguancun Ronghui Financial Information Service Co., Ltd"
#APP_PROFILE="InHouse - CIDemo"


if [ -z "${CONFIGURATION}" ]; then
    echo -e "No configuration specified."
    exit 255;
fi

EXPORT_PATH="./build/${CONFIGURATION}-build"

#echo -e "path ==== ${EXPORT_PATH}"

rm -rf "${EXPORT_PATH}"
#mkdir -p "build/${CONFIGURATION}-build"
#  security unlock-keychain -p " " "/Users/sh/Library/Keychains/login.keychain-db"

buildNumber=`date +"%Y%m%d%H%M"`
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $buildNumber" "../CIDemo/Info.plist"

xcrun xcodebuild -workspace ../CIDemo.xcworkspace/ -configuration "${CONFIGURATION}" -scheme "CIDemo${CONFIGURATION}" clean archive -archivePath "${EXPORT_PATH}/ipa" -verbose

 xcrun xcodebuild -exportArchive -exportOptionsPlist InHouse-QA.plist -archivePath "${EXPORT_PATH}/ipa.xcarchive" -exportPath "${EXPORT_PATH}"
