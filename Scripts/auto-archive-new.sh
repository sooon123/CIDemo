#!/bin/bash -il


CONFIGURATION=$1

if [ -z "${CONFIGURATION}" ]; then
    echo -e "No configuration specified."
    exit 255;
fi

EXPORT_PATH="./build/${CONFIGURATION}-build"

rm -rf "${EXPORT_PATH}"

buildNumber=`date +"%Y%m%d%H%M"`
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $buildNumber" "../CIDemo/Info.plist"

xcrun xcodebuild -workspace ../CIDemo.xcworkspace/ -configuration "${CONFIGURATION}" -scheme "CIDemo${CONFIGURATION}" clean archive -archivePath "${EXPORT_PATH}/ipa" -verbose CODE_SIGN_IDENTITY="iPhone Distribution: Beijing Zhongguancun Ronghui Financial Information Service Co., Ltd" APP_PROFILE="InHouse - CIDemo"

xcrun xcodebuild -exportArchive -exportOptionsPlist InHouse-QA.plist -archivePath "${EXPORT_PATH}/ipa.xcarchive" -exportPath "${EXPORT_PATH}"
