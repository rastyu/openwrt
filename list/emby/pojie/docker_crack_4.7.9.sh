#!/bin/bash
echo "docker一键破解脚本，适4.7.9版本"
echo "-------------------web端破解-------------------"
rm -f /system/Emby.Web.dll
wget -P /system/ https://ghproxy.com/https://raw.githubusercontent.com/rastyu/s905x3-openwrt/main/list/emby/pojie/Emby.Web.dll
rm -f /system/MediaBrowser.Model.dll
wget -P /system/ https://ghproxy.com/https://raw.githubusercontent.com/rastyu/s905x3-openwrt/main/list/emby/pojie/MediaBrowser.Model.dll
echo "核心破解完成..."
rm -f /system/dashboard-ui/modules/emby-apiclient/connectionmanager.js
wget -P /system/dashboard-ui/modules/emby-apiclient/ https://ghproxy.com/https://raw.githubusercontent.com/rastyu/s905x3-openwrt/main/list/emby/pojie/connectionmanager.js
rm -f /system/dashboard-ui/embypremiere/embypremiere.js
wget -P /system/dashboard-ui/embypremiere/ https://ghproxy.com/https://raw.githubusercontent.com/rastyu/s905x3-openwrt/main/list/emby/pojie/embypremiere.js
echo "web破解完成..."
rm -f /system/Emby.Server.Implementations.dll
wget -P /system/ https://ghproxy.com/https://raw.githubusercontent.com/rastyu/s905x3-openwrt/main/list/emby/pojie/Emby.Server.Implementations.dll
echo "Implementations替换认证..."

echo "完成替换..."
rm -rf synology6-7crack_4.7.9.sh
echo "-------------------删除脚本完成，预防重运行出错-------------------"
