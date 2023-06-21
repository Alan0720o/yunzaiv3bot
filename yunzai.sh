#!/bin/bash

# 检测用户是否是root用户
if [ "$(id -u)" != "0" ]; then
   echo "错误: 该脚本必须以root用户身份运行"
   exit 1
fi

# 更新软件包
sudo apt-get update

# 安装必要的软件包
sudo apt-get install -y curl git

# 安装 Node.js
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

# 安装 Redis
sudo apt-get install -y redis-server

# 安装 Chromium 浏览器
sudo apt-get install -y chromium-browser

# 克隆云崽qq机器人的代码仓库
git clone https://github.com/Le-niao/Yunzai-Bot.git

# 进入代码仓库目录
cd Yunzai-Bot/


#安装pnpm
npm install pnpm -g


# 安装依赖
npm install -p

yum groupinstall fonts -y

node app


# 启动云崽qq机器人
npm start




