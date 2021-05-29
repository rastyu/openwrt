#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/op
# Description: Automatically Build OpenWrt for Amlogic S9xxx STB
# Function: Diy script (Before Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Copyright (C) 2020 https://github.com/P3TERX/Actions-OpenWrt
# Copyright (C) 2020 https://github.com/ophub/op
#========================================================================================================================

# Add to compile options (Add related dependencies according to the requirements of the third-party software package Makefile)
#git clone https://github.com/zzsj0928/luci-app-pushbot package/luci-app-pushbot
#git clone https://github.com/project-lede/luci-app-godproxy.git package/luci-app-godproxy
#git clone https://github.com/vernesong/OpenClash package/luci-app-openclash
#git clone https://github.com/xiaorouji/openwrt-passwall package/luci-app-passwall
#git clone https://github.com/garypang13/luci-app-bypass package/luci-app-bypass
#git clone https://github.com/garypang13/smartdns-le package/smartdns-le
#git clone https://github.com/jerrykuku/lua-maxminddb package/lua-maxminddb
#git clone https://github.com/kongfl888/luci-app-adguardhome.git package/luci-app-adguardhome
#git clone https://github.com/toss-a/luci-theme-atmaterial.git package/luci-theme-atmaterial
#git clone https://github.com/esirplayground/luci-app-poweroff.git package/luci-app-poweroff
#git clone https://github.com/Lienol/openwrt-package.git package/Lienol-package
# git clone https://github.com/garypang13/luci-app-dnsfilter package/luci-app-dnsfilter
# git clone https://github.com/sirpdboy/luci-app-advanced.git package/luci-app-advanced
# git clone https://github.com/pymumu/openwrt-smartdns.git package/openwrt-smartdns
# git clone https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns
# git clone https://github.com/fw876/helloworld.git package/luci-app-ssr-plus
# git clone https://github.com/281677160/openwrt-package.git package/openwrt-packages


# other
#rm -rf package/lean/{luci-theme-argon}
