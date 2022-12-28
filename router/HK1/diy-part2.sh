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

# 版本号里显示一个自己的名字（281677160 build $(TZ=UTC-8 date "+%Y.%m.%d") @ 这些都是后增加的）
sed -i "s/OpenWrt /ALLEN build @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings
sed -i "s|DISTRIB_REVISION='.*'|DISTRIB_REVISION='R$(date +%Y.%m.%d)'|g" package/lean/default-settings/files/zzz-default-settings

svn co https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/luci-app-amlogic
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-argonne package/luci-theme-argonne
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-argonne-config package/luci-app-argonne-config
git clone https://github.com/vernesong/OpenClash.git package/OpenClash
git clone https://github.com/xiaorouji/openwrt-passwall.git package/passwall

git clone https://github.com/rastyu/package.git package/rastyu

git clone https://github.com/sirpdboy/luci-app-ddns-go.git package/ddns-go

git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome
svn co https://github.com/kenzok8/openwrt-packages/trunk/adguardhome package/adguardhome

svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-store package/luci-app-store
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-lib-taskd package/luci-lib-taskd
svn co https://github.com/kenzok8/openwrt-packages/trunk/taskd package/taskd
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-lib-xterm package/luci-lib-xterm

# Add autocore support for armvirt
sed -i 's/TARGET_rockchip/TARGET_rockchip\|\|TARGET_armvirt/g' package/lean/autocore/Makefile

# Add themes
# git clone https://github.com/thinktip/luci-theme-neobird.git package/luci-theme-neobird
# sed -i 's/shadowsocksr/passwall/g' package/luci-theme-neobird/luasrc/view/themes/neobird/header.htm

curl -fsSL  https://raw.githubusercontent.com/rastyu/s905x3-openwrt/main/poweroff/poweroff.htm > ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_system/poweroff.htm 
curl -fsSL  https://raw.githubusercontent.com/rastyu/s905x3-openwrt/main/poweroff/system.lua > ./feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin/system.lua
