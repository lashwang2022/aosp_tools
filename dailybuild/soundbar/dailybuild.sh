#!/bin/bash
PROJECT_HOME=/data/zhengwang/RK_SoundBar
cd $PROJECT_HOME/
repo forall -c 'git stash && git clean -df && git pull -r' -j8
repo sync --force-sync
repo start RK_Soundbar_Dev --all

cd $PROJECT_HOME/vendor/grandstream/build/
./autoBuild.sh -w -r hz_soundbar@grandstream.cn
