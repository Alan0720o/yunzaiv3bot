#!/bin/bash

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

# 安装依赖
npm install

# 启动云崽qq机器人
npm start




