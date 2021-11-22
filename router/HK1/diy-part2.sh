#!/bin/bash

# Modify default IP（FROM 192.168.1.1 CHANGE TO 192.168.10.6）
cat >$NETIP <<-EOF
uci set network.lan.ipaddr='192.168.10.6'                   # IPv4 地址(openwrt后台地址)
uci set network.lan.netmask='255.255.255.0'                 # IPv4 子网掩码
uci set network.lan.gateway='192.168.10.1'                  # IPv4 网关+
uci commit network
uci set dhcp.lan.ignore='1'                                                 # 关闭DHCP功能
uci commit dhcp                                                             # 跟‘关闭DHCP功能’联动,同时启用或者删除跟注释

# Modify default theme（FROM uci-theme-bootstrap CHANGE TO luci-theme-atmaterial）
sed -i 's/luci-theme-bootstrap/luci-theme-argon_new/g' ./feeds/luci/collections/luci/Makefile

# 版本号里显示一个自己的名字（281677160 build $(TZ=UTC-8 date "+%Y.%m.%d") @ 这些都是后增加的）
sed -i "s/OpenWrt /ALLEN build@ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings
sed -i "s|DISTRIB_REVISION='.*'|DISTRIB_REVISION='R$(date +%Y.%m.%d)'|g" package/lean/default-settings/files/zzz-default-settings

#添加额外软件包
#添加luci-app-amlogic
svn co https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/luci-app-amlogic
#添加packages
git clone https://github.com/kenzok8/small.git package/small
git clone https://github.com/kenzok8/openwrt-packages.git package/kenzok8
git clone https://github.com/esirplayground/luci-app-poweroff.git package/luci-app-poweroff  

./scripts/feeds update -a
./scripts/feeds install -a
