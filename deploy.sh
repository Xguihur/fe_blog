#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

echo "===开始执行脚本==="

echo "从仓库拉取代码"
git pull origin main
echo "拉取代码完成"

echo "================"

echo "开始安装依赖"
npm i
echo "依赖安装成功"

echo "================"

echo "开始打包项目"
npm run build
echo "打包完成"

echo "================"

echo "开始推送至阿里云服务器，请耐心等待"
scp -r dist root@www.guihurge.top:/www/wwwroot/www.feblog.com
echo "推送成功"

echo "================"

echo "执行完成"

cd -
