#!/usr/bin/env bash
image_version=`date +%Y%m%d%H%M`;
# 关闭TESTNAME容器
docker stop TESTNAME || true;
# 删除TESTNAME容器
docker rm TESTNAME || true;
# 删除TESTNAME镜像
docker rmi --force $(docker images | grep TESTNAME | awk '{print $3}')
# docker rmi test_docker;
# 构建test_docker:$image_version镜像
docker build -t test_docker:$image_version .;
# 查看镜像列表
docker images;
# 基于 test_docker 镜像 构建一个容器 test_docker
docker run -d --name TESTNAME -p 8010:80 test_docker:$image_version;
# 查看日志
docker logs TESTNAME;
#删除build过程中产生的镜像    #docker image prune -a -f
docker rmi $(docker images -f "dangling=true" -q)
# 对空间进行自动清理
docker system prune -a -f
