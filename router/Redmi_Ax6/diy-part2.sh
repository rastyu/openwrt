#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt for Amlogic S9xxx STB
# Function: Diy script (After Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Copyright (C) 2020 https://github.com/P3TERX/Actions-OpenWrt
# Copyright (C) 2020 https://github.com/ophub/amlogic-s9xxx-openwrt
#========================================================================================================================
#添加adguardhome
git clone https://github.com/281677160/AdGuardHome.git package/luci-app-adguardhome
#添加关机
git clone https://github.com/esirplayground/luci-app-poweroff.git package/luci-app-poweroff

#添加文件浏览
git clone https://github.com/Lienol/openwrt-package.git package/openwrt-packages

#添加全能推送
git clone https://github.com/zzsj0928/luci-app-pushbot package/luci-app-pushbot

#添加广告过滤
git clone https://github.com/project-lede/luci-app-godproxy.git package/luci-app-godproxy

#添加atmaterial主题
git clone https://github.com/openwrt-develop/luci-theme-atmaterial.git package/luci-theme-atmaterial

# Modify default IP（FROM 192.168.1.1 CHANGE TO 192.168.10.6）
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# Modify default theme（FROM uci-theme-bootstrap CHANGE TO luci-theme-material）
sed -i 's/luci-theme-bootstrap/luci-theme-atmaterial/g' ./feeds/luci/collections/luci/Makefile

# Add the default password for the 'root' user（Change the empty password to 'password'）
# sed -i 's/root::0:0:99999:7:::/root:$1$R8PYVHeZ$SRRcQVgo.FSLaSE/mk.vD/:18790:0:99999:7:::/g' package/base-files/files/etc/shadow

# 版本号里显示一个自己的名字（281677160 build $(TZ=UTC-8 date "+%Y.%m.%d") @ 这些都是后增加的）
sed -i "s/OpenWrt /ALLEN build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

# Add luci-app-bypass
git clone https://github.com/garypang13/openwrt-bypass.git package/luci-app-bypass

# Add luci-app-passwall
git clone https://github.com/xiaorouji/openwrt-passwall package/luci-app-passwall

# Add luci-app-openclash
git clone https://github.com/vernesong/OpenClash package/luci-app-openclash

# Add luci-app-ssr-plus
# git clone https://github.com/fw876/helloworld.git package/luci-app-ssr-plus

# Modify some code adaptation
sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' package/lean/luci-app-cpufreq/Makefile
# Add autocore support for armvirt
sed -i 's/TARGET_rockchip/TARGET_rockchip\|\|TARGET_armvirt/g' package/lean/autocore/Makefile
