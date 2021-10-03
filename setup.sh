#!/usr/bin/env bash
image_version=`date +%Y%m%d%H%M`;
# 关闭test_docker容器
docker stop test_docker || true;
# 删除test_docker容器
docker rm test_docker || true;
# 删除test/docker镜像
docker rmi --force $(docker images | grep test/docker | awk '{print $3}')
# 构建test/docker:$image_version镜像
docker build . -t test/docker:$image_version;
# 查看镜像列表
docker images;
# 基于test/docker 镜像 构建一个容器 test_docker
docker run -p 8010:80 -d --name test_docker test/docker:$image_version;
# 查看日志
docker logs test_docker;
#删除build过程中产生的镜像    #docker image prune -a -f
docker rmi $(docker images -f "dangling=true" -q)
# 对空间进行自动清理
docker system prune -a -f
