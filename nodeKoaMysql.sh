# !/bin/bash
WoRK_PATH='../nodeKoaMysql'
cd $WoRK_PATH
echo "先清除老代码"
git reset --hard origin
git clean -f
echo "拉取最新代码"
git pull origin master
echo "开始执行构建"
docker build -t node-koa-mysql:1.0 .
echo "停止并删除旧容器"
docker stop node-koa-container
docker rm  node-koa-container
echo "启动新容器,服务器端口和容器端口进行映射 -d后台运行 :1.0版本号"
docker container run -p 9000:9000 -name node-koa-container  -d  node-koa-mysql:1.0

