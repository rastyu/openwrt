#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt for Amlogic s9xxx tv box
# Function: Diy script (After Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/coolsnowwolf/lede / Branch: master
#========================================================================================================================

 
 # Modify default IP（FROM 192.168.1.1 CHANGE TO 192.168.10.6）
sed -i 's/192.168.1.1/192.168.10.10/g' package/base-files/files/bin/config_generate

# Modify default theme（FROM uci-theme-bootstrap CHANGE TO luci-theme-atmaterial）
sed -i 's/luci-theme-bootstrap/luci-theme-argonne/g' ./feeds/luci/collections/luci/Makefile
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-argonne package/luci-theme-argonne

git clone https://github.com/esirplayground/luci-app-poweroff.git package/luci-app-poweroff
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-argonne package/luci-theme-argonne
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-adguardhome package/luci-app-adguardhome
svn co https://github.com/kenzok8/openwrt-packages/trunk/adguardhome package/adguardhome
