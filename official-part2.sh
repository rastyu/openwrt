#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt for Amlogic s9xxx tv box
# Function: Diy script (After Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/coolsnowwolf/lede / Branch: master
#========================================================================================================================

# 默认IP地址（FROM 192.168.1.1 CHANGE TO 192.168.10.6）
sed -i 's/192.168.1.1/192.168.10.10/g' package/base-files/files/bin/config_generate

# 默认主题（FROM uci-theme-bootstrap CHANGE TO luci-theme-atmaterial）
sed -i 's/luci-theme-bootstrap/luci-theme-argonne/g' ./feeds/luci/collections/luci/Makefile

git clone https://github.com/vernesong/OpenClash.git package/OpenClash
# 主题
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-argonne package/luci-theme-argonne
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-argonne-config package/luci-app-argonne-config


git clone https://github.com/rastyu/package.git package/rastyu
git clone https://github.com/sirpdboy/luci-app-ddns-go.git package/ddns-go
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome

# kms server
svn checkout https://github.com/kiddin9/openwrt-packages/trunk/luci-app-vlmcsd package/luci-app-vlmcsd
svn checkout https://github.com/kiddin9/openwrt-packages/trunk/vlmcsd package/vlmcsd
