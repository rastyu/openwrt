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
sed -i 's/luci-theme-bootstrap/luci-theme-argonne/g' ./feeds/luci/collections/luci/Makefile

# 版本号里显示一个自己的名字（281677160 build $(TZ=UTC-8 date "+%Y.%m.%d") @ 这些都是后增加的）
sed -i "s/OpenWrt /ALLEN Build @/g" package/lean/default-settings/files/zzz-default-settings
sed -i "s|DISTRIB_REVISION='.*'|DISTRIB_REVISION='R$(date "+%Y年%m月%d日)'|g" package/lean/default-settings/files/zzz-default-settings


git clone https://github.com/vernesong/OpenClash.git package/OpenClash

git clone https://github.com/xiaorouji/openwrt-passwall.git package/passwall
# svn co https://github.com/xiaorouji/openwrt-passwall/branches/luci/luci-app-passwall package/luci-app-passwall

git clone https://github.com/rastyu/package.git package/rastyu
git clone https://github.com/sirpdboy/luci-app-ddns-go.git package/ddns-go

svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-argonne package/luci-theme-argonne
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-argonne-config package/luci-app-argonne-config

git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome

svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-store package/luci-app-store
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-lib-taskd package/luci-lib-taskd
svn co https://github.com/kenzok8/openwrt-packages/trunk/taskd package/taskd
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-lib-xterm package/luci-lib-xterm


git clone https://github.com/sbwml/luci-app-alist.git package/luci-app-alist

# rm -rf ./feeds/luci/applications/luci-app-netdata
# git clone https://github.com/sirpdboy/luci-app-netdata.git package/luci-app-netdata

# git clone https://github.com/sirpdboy/netspeedtest.git package/netspeedtest

# svn co https://github.com/kenzok8/small-package/trunk/luci-app-nginx-manager package/luci-app-nginx-manager
# svn co https://github.com/kenzok8/openwrt-packages/trunk/filebrowser package/filebrowser
# svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-filebrowser package/luci-app-filebrowser
# git clone https://github.com/jerrykuku/lua-maxminddb.git package/maxminddb
# git clone https://github.com/jerrykuku/luci-app-vssr.git package/luci-app-vssr
# git clone https://github.com/fw876/helloworld package/helloworld

# Add themes
# git clone https://github.com/thinktip/luci-theme-neobird.git package/luci-theme-neobird
# sed -i 's/shadowsocksr/passwall/g' package/luci-theme-neobird/luasrc/view/themes/neobird/header.htm

#在编译前,运行如下二条命令，集成到系统源码菜单中，不需要另外选择和设置即可使用关机功能。
curl -fsSL  https://raw.githubusercontent.com/rastyu/package/main/poweroff.htm > ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_system/poweroff.htm 
curl -fsSL  https://raw.githubusercontent.com/rastyu/package/main/system.lua > ./feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin/system.lua
