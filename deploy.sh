#!/usr/bin/env sh

# 获取工作空间路径
workspace="$WORKSPACE"

# 确保脚本抛出遇到的错误
set -e

echo "===开始执行脚本==="

echo "从仓库拉取代码"
git pull origin main
echo "拉取代码完成"

echo "================"
# 检查工作空间是否为空
if [ -z "$(ls -A "$workspace")" ]; then
    echo "工作空间为空，开始执行 npm i"
    echo "开始安装依赖"
    npm i
    echo "依赖安装成功"
else
    echo "工作空间不为空，跳过 npm i"
fi
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
