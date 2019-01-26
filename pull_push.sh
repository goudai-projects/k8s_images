#!/bin/bash
source_namespace = 'k8s.gcr.io'
target_namespace = 'registry-vpc.cn-beijing.aliyuncs.com/ops'
for img in `awk -F '/' '{print $2}' images.list`  
{  
    echo 'pull ' $img
    docker pull $source_namespace/$img
    docker tag $source_namespace/$img  $target_namespace/$img
    docker push $target_namespace/$img
}  