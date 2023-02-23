#!/bin/bash

#set -x

if test -z "$ANDROID_BUILD_TOP"; then
  echo "please lunch the android devices"
  exit 1
fi

IDE_LIBS=$ANDROID_BUILD_TOP/development/tools/idegen/ide_libs/
rm -rf $IDE_LIBS
mkdir $IDE_LIBS

cd $ANDROID_BUILD_TOP/out/target/common/obj/JAVA_LIBRARIES/
all_libs=$(find -maxdepth 1 -type d -not -path '\.' -exec basename {} \; | sort -h)
suffix="_intermediates"
for al in $all_libs; do
  _tmp=${al/%$suffix}
  #echo "$_tmp"
  ln -sf $ANDROID_BUILD_TOP/out/target/common/obj/JAVA_LIBRARIES/$al/classes.jar $IDE_LIBS/$_tmp.jar
done

cd - > /dev/null
echo "done."
