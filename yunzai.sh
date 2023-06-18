#! /bin/bash
#本脚本用于部署Yunzai-Bot v3
#于2022.11.20
if [ $EUID -ne 0 ]; then
    echo "请先输入sudo su root 切换成root权限"
    exit
fi
echo "开始安装和更新相关环境依赖"
apt update #列出可更新的软件清单
apt-get install -y sudo #安装sudo权限 -y表示执行过程中全部是yes
apt-get install -y curl #安装curl,curl是用于请求web服务器的工具

#安装nodejs
echo "开始安装nodejs"
#/dev/null相当于一个黑洞，任何输出信息都会直接丢失，此处表示将标准输出 (1) 以及标准错误输出 (2)都重定向到null中去，即不输出
#若type有输出，则exit code 为0
if ! type node >/dev/null 2>&1; then
    curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash - #curl的-s表示不输出错误和进度信息，-L表示让http请求跟随服务器的重定向
    sudo apt-get install -y nodejs
else
    echo "nodejs已安装"
fi
echo "安装nodejs完成"

#若没有npm则安装npm
if ! type npm >/dev/null 2>&1; then
    apt install npm -y
    echo 'npm安装成功'
else
    echo 'npm已安装'
fi

#安装并运行redis
echo "开始安装redis"
apt-get install redis -y #启动redis服务,save中的默认参数配置
redis-server --save 900 1 --save 300 10 --daemonize yes 
echo "redis安装完成"

#安装chromium浏览器
echo "开始安装chromium浏览器"
apt install chromium-browser -y 
echo "安装chromium完成"

#安装中文字体
echo "开始安装中文字体"
apt install -y --force-yes --no-install-recommends fonts-wqy-microhei 
echo "安装中文字体完成"

#安装git
echo "开始安装git"
apt install git -y 
git config --global http.sslVerify false #去除https的ssl验证，方便拉取项目
echo "安装git完成"

#克隆云崽本体
echo "开始克隆Yunzai-Bot"
if [ ! -d "Yunzai-Bot/" ]; then #如果不存在Yunzai-Bot文件夹,-d表示是否存在文件夹
    git clone --depth=1 -b main https://github.com/Le-niao/Yunzai-Bot.git 
    if [ ! -d "Yunzai-Bot/" ]; then 
        echo "克隆失败" 
        exit 0 
    else 
        echo "克隆完成" 
    fi 
else 
    echo "Yunzai-Bot已安装" 
fi 

cd Yunzai-Bot/
echo "开始安装模块"
if [ ! -d "node-mudules/" ]; then 
    if ! type pnpm >/dev/null; then npm install pnpm -g fi;
    if ! type cnpm >/dev/null; then npm install cnpm -g --registry=https://registry.npmmirror.com fi;
    pnpm install -P 
    echo "安装模块完成" 
else 
    echo "模块已安装" 
fi 

echo "开始安装依赖"
sudo apt install -y gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pix



