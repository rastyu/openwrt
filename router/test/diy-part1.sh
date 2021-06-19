#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/op
# Description: Automatically Build OpenWrt for Amlogic S9xxx STB
# Function: Diy script (Before Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Copyright (C) 2020 https://github.com/P3TERX/Actions-OpenWrt
# Copyright (C) 2020 https://github.com/ophub/op
#========================================================================================================================

# Add to compile options (Add related dependencies according to the requirements of the third-party software package Makefile)
# git clone https://github.com/281677160/openwrt-package.git package/openwrt-packages
# git clone https://github.com/zzsj0928/luci-app-pushbot package/luci-app-pushbot
# git clone https://github.com/project-lede/luci-app-godproxy.git package/luci-app-godproxy
# git clone https://github.com/vernesong/OpenClash package/luci-app-openclash
# git clone https://github.com/fw876/helloworld.git package/luci-app-ssr-plus
#git clone https://github.com/xiaorouji/openwrt-passwall package/luci-app-passwall

# other
# rm -rf package/lean/{samba4,luci-app-samba4,luci-app-ttyd}
