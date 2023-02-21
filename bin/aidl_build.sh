#!/bin/bash

#set -x

if test -z "$ANDROID_BUILD_TOP"; then
  echo "please lunch the android devices"
  exit 1
fi

aidlFiles=$(find $ANDROID_BUILD_TOP/frameworks/base/ -name *.aidl -not -path "*/*tests/*")
aidlIncludeFiles=$(find $ANDROID_BUILD_TOP/frameworks/base/ -type d -name java -not -path "*/*tests/*" -exec echo -n "-I{}/ " \;)
aidlIncludeFiles="-I$ANDROID_BUILD_TOP/frameworks/native/aidl/binder/ $aidlIncludeFiles "

mkdir $ANDROID_BUILD_TOP/aidlfiles/

cd $ANDROID_BUILD_TOP/aidlfiles/
rm -rf framework_base_aidl
for af in $aidlFiles; do
    echo "generating $af"
    # aidl -o framework_base_aidl $aidlIncludeFiles $af
    # if [ $? -eq 0 ]; then
    #     exit 1
    # fi
done

cd -
echo "done."
