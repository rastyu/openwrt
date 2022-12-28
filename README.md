
# 个人定制编译Openwrt固件仓库
<a href="https://github.com/rastyu/s905x3-openwrt/releases/tag/x86_64" title="x86_64_lede"><img src="https://img.shields.io/badge/openwrt-x86_64_lede-32CD32"></a>
<a href="https://github.com/rastyu/s905x3-openwrt/releases/tag/x86_64-iptv" title="x86_64_iptv"><img src="https://img.shields.io/badge/openwrt-x86_64_iptv-32CD32"></a>
<a href="https://github.com/rastyu/s905x3-openwrt/releases/tag/x86_64-docker" title="x86_64_docker"><img src="https://img.shields.io/badge/openwrt-x86_64_docker-32CD32"></a>
<a href="https://github.com/rastyu/s905x3-openwrt/releases/tag/x86_64_immor" title="x86_64_immor"><img src="https://img.shields.io/badge/openwrt-x86_64_immor-7FFF00"></a>
<a href="https://github.com/rastyu/s905x3-openwrt/releases/tag/AX6" title="AX6"><img src="https://img.shields.io/badge/openwrt-AX6-7FFF00"></a>
<a href="https://github.com/rastyu/s905x3-openwrt/releases/tag/ARM-box" title="ARM盒子固件 Releases"><img src="https://img.shields.io/badge/openwrt-ARM盒子固件-7FFF00"></a>
## Openwrt应用列表
<a href="https://github.com/rastyu/s905x3-openwrt/blob/main/%E5%BA%94%E7%94%A8%E5%88%97%E8%A1%A8/x86-lede.txt" title="x86_64_lede"><img src="https://img.shields.io/badge/应用列表-x86_64_lede-DBDB70"></a>
<a href="https://github.com/rastyu/s905x3-openwrt/blob/main/%E5%BA%94%E7%94%A8%E5%88%97%E8%A1%A8/x86-docker.txt" title="x86_64_docker"><img src="https://img.shields.io/badge/应用列表-x86_64_docker-DBDB70"></a>
<a href="https://github.com/rastyu/s905x3-openwrt/blob/main/%E5%BA%94%E7%94%A8%E5%88%97%E8%A1%A8/x86-immor.txt" title="x86_64_docker"><img src="https://img.shields.io/badge/应用列表-x86_64_immor-DBDB70"></a>
<a href="https://github.com/rastyu/s905x3-openwrt/blob/main/%E5%BA%94%E7%94%A8%E5%88%97%E8%A1%A8/ARM%E7%9B%92%E5%AD%90.txt" title="x86_64_docker"><img src="https://img.shields.io/badge/应用列表-ARM盒子固件-DBDB70"></a>
#### 配置 RELEASES_TOKEN  发布固件用
#### 配置 TELEGRAM_TO 和 TELEGRAM__TOKEN   ssh自动发链接到指定电报账户
## 笔记
```
CONFIG_LINUX_5.4=y
CONFIG_LINUX_5.10=y
CONFIG_LINUX_5.15=y
CONFIG_LINUX_6_1=y
```
- 单独拉取特定的插件或者文件，比如单独拉取插件包的luci-app-clash

      svn co https://github.com/281677160/openwrt-package/trunk/luci-app-clash package/luci-app-clash
      
- 这个关系就跟上面差不多了，就不多说了，重点要说的是这个链接是有改变的，怎么改变法呢？整个链接真正的链接看下面的，这个原始链接怎么来呢?比如你在别人的仓库看到某个插件，再点开那个插件的文件夹，然后在浏览器复制完整链接就是了。如果有分支的，你想要分支的插件，就先选择了分支再打开插件文件夹然后在复制链接就可以了。

      https://github.com/281677160/openwrt-package/tree/master/luci-app-clash  <--- 在浏览器上复制出来的真正链接
      
      https://github.com/281677160/openwrt-package/trunk/luci-app-clash        <--- 用的时候修改过的链接，认真对比一下就懂了
      
- 大家看清楚没有？链接里面是带有分支名称的，还有一个tree，就是这个了 tree/master 把这里替换成 trunk 就可以了，主仓库就这样拉取，如果要拉取分支的呢？也简单的，把tree改成branches就行，比如
     
      https://github.com/281677160/openwrt-package/tree/19.07/luci-app-eqos   <--- 在浏览器上复制出来的真正链接
      
      https://github.com/281677160/openwrt-package/branches/19.07/luci-app-eqos   <--- 用的时候修改过的链接

      svn co https://github.com/281677160/openwrt-package/branches/19.07/luci-app-eqos package/luci-app-eqos  <--- 完整拉取链接



## Acknowledgments
- [OpenWrt](https://github.com/openwrt/openwrt)
- [coolsnowwolf/lede](https://github.com/coolsnowwolf/lede)
- [Lienol/openwrt](https://github.com/Lienol/openwrt)
- [unifreq/openwrt_packit](https://github.com/unifreq/openwrt_packit)
- [tuanqing/mknop](https://github.com/tuanqing/mknop)
- [P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)
- [ophub/amlogic-s9xxx-openwrt](https://github.com/ophub/amlogic-s9xxx-openwrt)
