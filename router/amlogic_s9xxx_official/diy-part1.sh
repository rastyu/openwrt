#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt for Amlogic S9xxx STB
# Function: Diy script (Before Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Copyright (C) 2020 https://github.com/P3TERX/Actions-OpenWrt
# Copyright (C) 2020 https://github.com/ophub/amlogic-s9xxx-openwrt
#========================================================================================================================

# Add a feed source
# sed -i 's/src-git packages/#src-git packages/g' ./feeds.conf.default
# sed -i '$a src-git packages https://github.com/immortalwrt/packages.git;openwrt-21.02' feeds.conf.default

git clone https://github.com/zzsj0928/luci-app-pushbot package/luci-app-pushbot
git clone https://github.com/project-lede/luci-app-godproxy.git package/luci-app-godproxy
git clone https://github.com/vernesong/OpenClash package/luci-app-openclash
git clone https://github.com/xiaorouji/openwrt-passwall package/luci-app-passwall
git clone https://github.com/garypang13/luci-app-bypass package/luci-app-bypass
git clone https://github.com/garypang13/smartdns-le package/smartdns-le
git clone https://github.com/jerrykuku/lua-maxminddb package/lua-maxminddb
git clone https://github.com/kongfl888/luci-app-adguardhome.git package/luci-app-adguardhome
git clone https://github.com/toss-a/luci-theme-atmaterial.git package/luci-theme-atmaterial
git clone https://github.com/esirplayground/luci-app-poweroff.git package/luci-app-poweroff
git clone https://github.com/Lienol/openwrt-package.git package/Lienol-package

# other
# rm -rf package/lean/{samba4,luci-app-samba4,luci-app-ttyd}
