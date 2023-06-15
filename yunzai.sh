#!/bin/bash

yum install -y dnf
dnf module install nodejs:16 -y
#安装node.js

yum -y install git
#安装git

yum -y install redis && redis-server --daemonize yes
#安装并运行 redis

git clone --depth=1 -b main https://gitee.com/Le-niao/Yunzai-Bot.git
#克隆yunzai项目

cd Yunzai-Bot
#安装模块

npm install pnpm -g
#安装 pnpm

pnpm install -P
#安装依赖

yum install pango.x86_64 libXcomposite.x86_64 libXcursor.x86_64 libXdamage.x86_64 libXext.x86_64 libXi.x86_64 libXtst.x86_64 cups-libs.x86_64 libXScrnSaver.x86_64 libXrandr.x86_64 GConf2.x86_64 alsa-lib.x86_64 atk.x86_64 gtk3.x86_64 -y && yum install libdrm libgbm libxshmfence -y && yum install nss -y && yum update nss -y
#安装 chrome 依赖库

yum groupinstall fonts -y
#安装中文字体

chear
echo -e 下面是启动和停止运行的命令
echo -e "\033[31mnode app\033[0m\n"
echo -e "\033[31m npm start / npm stop
\033[0m\n"



