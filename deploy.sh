#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

echo "===开始执行脚本==="

echo "开始安装依赖"
#/usr/bin/node -v
#/usr/bin/npm -v

# node -v

npm i

echo "依赖安装成功，开始打包项目"

echo "================"

echo "开始打包项目"
# 生成静态文件
npm run build
echo "打包完成"

# 进入生成的文件夹

echo "正在推送至阿里云服务器，请耐心等待"
scp -r dist root@www.guihurge.top:/www/wwwroot/www.feblog.com
echo "推送成功"

echo "================"

echo "执行完成"

cd -
