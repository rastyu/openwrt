#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt for Amlogic S9xxx STB
# Function: Diy script (After Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Copyright (C) 2020 https://github.com/P3TERX/Actions-OpenWrt
# Copyright (C) 2020 https://github.com/ophub/amlogic-s9xxx-openwrt
#========================================================================================================================

# Add luci-app-bypass
git clone https://github.com/garypang13/openwrt-bypass.git package/luci-app-bypass

# Add luci-app-passwall
git clone https://github.com/xiaorouji/openwrt-passwall package/luci-app-passwall

# Add luci-app-ssr-plus
git clone https://github.com/fw876/helloworld.git package/luci-app-ssr-plus

# Add luci-app-vssr
git clone https://github.com/jerrykuku/luci-app-vssr.git package/luci-app-vssr

# Modify some code adaptation
sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' package/lean/luci-app-cpufreq/Makefile

# Add autocore support for armvirt
sed -i 's/TARGET_rockchip/TARGET_rockchip\|\|TARGET_armvirt/g' package/lean/autocore/Makefile

./scripts/feeds update -a
./scripts/feeds install -a
