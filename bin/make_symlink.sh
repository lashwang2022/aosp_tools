#!/bin/bash

# source project 默认放在/data/project/{project_name} 目录下
# 输出project默认放在/data/ide/{project_name}


project=$1
project_path="/data/project/$project"
link_root="/data/ide/$project"


if [ -z "$project" ];then
    echo "please input project name"
    exit 1
fi

if [ ! -d "$project_path" ];then
    echo "$project_path not found, please check."
    exit 1
fi

if [ -d "$project_path/android" ];then
    project_path="$project_path/android/"
    link_root="/data/ide/$project/android/"
fi


module_list=$(awk 'NF' /opt/aosp/etc/config)
#echo "$path_list"


rm -rf $link_root
mkdir -p $link_root

for module in ${module_list[@]}
do
    if [ -d $project_path/$module ];then
        module_path=$(dirname $link_root/$module)
        mkdir -p  $module_path
        ln -s $project_path/$module $module_path/.
    elif [ -f $project_path/$module ];then
        # 处理文件
        module_path=$(dirname $link_root/$(dirname $module))
        mkdir -p $module_path
        ln -s $project_path/$module $module_path/.
    else
        echo "$project_path/$module not exist"
    fi
done

echo "done, please check the project on $link_root"

