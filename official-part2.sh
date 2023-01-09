#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt for Amlogic s9xxx tv box
# Function: Diy script (After Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/coolsnowwolf/lede / Branch: master
#========================================================================================================================
git clone https://github.com/vernesong/OpenClash.git package/OpenClash
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
# rm -rf ./feeds/luci/applications/luci-app-netdata
# git clone https://github.com/sirpdboy/luci-app-netdata.git package/luci-app-netdata

# svn co https://github.com/kenzok8/small-package/trunk/luci-app-nginx-manager package/luci-app-nginx-manager
# svn co https://github.com/kenzok8/openwrt-packages/trunk/filebrowser package/filebrowser
# svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-filebrowser package/luci-app-filebrowser
# 科学软件
# git clone https://github.com/jerrykuku/lua-maxminddb.git package/maxminddb
# git clone https://github.com/jerrykuku/luci-app-vssr.git package/luci-app-vssr
# git clone https://github.com/fw876/helloworld package/helloworld
