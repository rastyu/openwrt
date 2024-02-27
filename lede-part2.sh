#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt for Amlogic s9xxx tv box
# Function: Diy script (After Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/coolsnowwolf/lede / Branch: master
#========================================================================================================================
# 换内核版本
# sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=5.10/g' ./target/linux/x86/Makefile

# 默认IP地址（FROM 192.168.1.1 CHANGE TO 192.168.10.6）
sed -i 's/192.168.1.1/192.168.10.10/g' package/base-files/files/bin/config_generate

# 默认主题（FROM uci-theme-bootstrap CHANGE TO luci-theme-atmaterial）
sed -i 's/luci-theme-bootstrap/luci-theme-argone/g' ./feeds/luci/collections/luci/Makefile

# 版本号里显示一个自己的名字（281677160 build $(TZ=UTC-8 date "+%Y.%m.%d") @ 这些都是后增加的）
sed -i "s/OpenWrt /OpenWrt $(date +%Y.%m.%d) /g" package/lean/default-settings/files/zzz-default-settings
sed -i "s|DISTRIB_REVISION='.*'|DISTRIB_REVISION='by Allen'|g" package/lean/default-settings/files/zzz-default-settings

# 设置首次登录后台密码为空（进入openwrt后自行修改密码）
sed -i '/CYXluq4wUazHjmCDBCqXF/d' package/lean/default-settings/files/zzz-default-settings    # 设置密码为空


echo "开始 DIY2 配置……"
echo "========================="

function merge_package(){
    repo=`echo $1 | rev | cut -d'/' -f 1 | rev`
    pkg=`echo $2 | rev | cut -d'/' -f 1 | rev`
    # find package/ -follow -name $pkg -not -path "package/custom/*" | xargs -rt rm -rf
    git clone --depth=1 --single-branch $1
    mv $2 package/custom/
    rm -rf $repo
}
function drop_package(){
    find package/ -follow -name $1 -not -path "package/custom/*" | xargs -rt rm -rf
}
function merge_feed(){
    if [ ! -d "feed/$1" ]; then
        echo >> feeds.conf.default
        echo "src-git $1 $2" >> feeds.conf.default
    fi
    ./scripts/feeds update $1
    ./scripts/feeds install -a -p $1
}
rm -rf package/custom; mkdir package/custom

merge_package https://github.com/vernesong/OpenClash OpenClash/luci-app-openclash
# git clone https://github.com/xiaorouji/openwrt-passwall.git package/passwall
# svn co https://github.com/xiaorouji/openwrt-passwall/branches/luci/luci-app-passwall package/luci-app-passwall

# 主题
merge_package https://github.com/kenzok78/luci-theme-argone luci-theme-argone
# svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-argone package/luci-theme-argone
# svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-argone-config package/luci-app-argone-config

# 商店
merge_package https://github.com/kenzok8/openwrt-packages openwrt-packages/luci-app-store
merge_package https://github.com/kenzok8/openwrt-packages openwrt-packages/luci-lib-taskd
merge_package https://github.com/kenzok8/openwrt-packages openwrt-packages/taskd
merge_package https://github.com/kenzok8/openwrt-packages openwrt-packages/luci-lib-xterm

merge_package https://github.com/rastyu/package package/luci-app-poweroff
merge_package https://github.com/sirpdboy/luci-app-ddns-go luci-app-ddns-go
merge_package https://github.com/rufengsuixing/luci-app-adguardhome luci-app-adguardhome
#git clone https://github.com/sbwml/luci-app-alist.git package/luci-app-alist

# poweroff关机功能集成到系统源码菜单中
curl -fsSL  https://raw.githubusercontent.com/rastyu/package/main/poweroff.htm > ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_system/poweroff.htm 
curl -fsSL  https://raw.githubusercontent.com/rastyu/package/main/system.lua > ./feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin/system.lua
# 系统监控
# rm -rf ./feeds/luci/applications/luci-app-netdata
# git clone https://github.com/sirpdboy/luci-app-netdata.git package/luci-app-netdata

# svn co https://github.com/kenzok8/small-package/trunk/luci-app-nginx-manager package/luci-app-nginx-manager
# svn co https://github.com/kenzok8/openwrt-packages/trunk/filebrowser package/filebrowser
# svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-filebrowser package/luci-app-filebrowser
# 科学软件
# git clone https://github.com/jerrykuku/lua-maxminddb.git package/maxminddb
# git clone https://github.com/jerrykuku/luci-app-vssr.git package/luci-app-vssr
# git clone https://github.com/fw876/helloworld package/helloworld
