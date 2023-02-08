#!/bin/bash

mercury_root="/data/zhengwang/mercury_release/"

# build user version
cd $mercury_root/vendor/grandstream/build/ && ./release/autoRelease.sh -g mercury -s
# build user debug version
cd $mercury_root/vendor/grandstream/build/ && ./release/autoRelease.sh -g mercury


