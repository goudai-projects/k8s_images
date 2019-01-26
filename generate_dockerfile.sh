#!/bin/bash
set -f
# kubeadm config images list > images.list
for img in `awk -F '/' '{print $2}' images.list`  
do  
    ary=(${img//:/ })
    echo "create Dockerfile for ${ary[0]} version ${ary[1]}"
    echo "FROM k8s.gcr.io/${ary[0]}:${ary[1]}" >${ary[0]}.dockerfile
    echo "LABEL MAINTAINER=\"jianglin <jianglin@flyoil.cn>\"" >>${ary[0]}.dockerfile
done