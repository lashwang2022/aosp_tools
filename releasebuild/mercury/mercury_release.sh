#!/bin/bash

mercury_root="/data/zhengwang/mercury_release/"

buildType=$(cat $mercury_root/out/target/product/mercury/system/build.prop | grep "ro.build.type" | grep userdebug)

if [ -z $buildType ];then
    # build user version
    cd $mercury_root/vendor/grandstream/build/ && ./release/autoRelease.sh -g mercury -s
    # build userdebug version
    cd $mercury_root/vendor/grandstream/build/ && ./release/autoRelease.sh -g mercury
else
    # build userdebug version
    cd $mercury_root/vendor/grandstream/build/ && ./release/autoRelease.sh -g mercury
    # build user version
    cd $mercury_root/vendor/grandstream/build/ && ./release/autoRelease.sh -g mercury -s
fi
