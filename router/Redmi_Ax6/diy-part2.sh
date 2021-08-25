#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt for Amlogic S9xxx STB
# Function: Diy script (After Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Copyright (C) 2020 https://github.com/P3TERX/Actions-OpenWrt
# Copyright (C) 2020 https://github.com/ophub/amlogic-s9xxx-openwrt
#========================================================================================================================
#添加luci-app-adblock-plus
git clone https://github.com/small-5/luci-app-adblock-plus.git package/luci-app-adblock-plus
#添加packages
git clone https://github.com/kenzok8/openwrt-packages.git package/kenzok8
git clone https://github.com/kenzok8/small.git package/small
git clone https://github.com/project-lede/luci-app-godproxy.git package/luci-app-godproxy
git clone https://github.com/esirplayground/luci-app-poweroff.git package/luci-app-poweroff
svn co https://github.com/Lienol/openwrt-package/trunk/luci-app-filebrowser package/luci-app-filebrowser

# Modify default IP（FROM 192.168.1.1 CHANGE TO 192.168.10.6）
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# Add the default password for the 'root' user（Change the empty password to 'password'）
sed -i 's/root::0:0:99999:7:::/root:$1$R8PYVHeZ$SRRcQVgo.FSLaSE/mk.vD/:18790:0:99999:7:::/g' package/base-files/files/etc/shadow

# 版本号里显示一个自己的名字（281677160 build $(TZ=UTC-8 date "+%Y.%m.%d") @ 这些都是后增加的）
sed -i "s/OpenWrt /ALLEN build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings
#修正连接数（by ベ七秒鱼ベ）
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf
