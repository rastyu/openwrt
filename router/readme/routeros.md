### IP来源
 
 [17mon/china_ip_list](https://github.com/17mon/china_ip_list)  
 [metowolf/iplist](https://github.com/metowolf/iplist)  
 [苍狼山庄](https://ispip.clang.cn/)
 ***
```
/tool fetch url=https://github.75969207.xyz/https://github.com/rastyu/s905x3-openwrt/releases/download/cnip/17mon_v4_CNIP.rsc
```
```
/tool fetch url=https://github.75969207.xyz/https://github.com/rastyu/s905x3-openwrt/releases/download/cnip/metowolf_v4_CNIP.rsc
```
```
/tool fetch url=https://github.75969207.xyz/https://github.com/rastyu/s905x3-openwrt/releases/download/cnip/clang_v4_CNIP.rsc
```
```
/tool fetch url=https://github.75969207.xyz/https://github.com/rastyu/s905x3-openwrt/releases/download/cnip/clang_v6_CNIP.rsc
```
```
/tool fetch url=https://github.75969207.xyz/https://github.com/rastyu/s905x3-openwrt/releases/download/cnip/all_v4_list.rsc
```
### ROS ipv4导入脚本
```
/tool fetch url=https://github.75969207.xyz/https://github.com/rastyu/s905x3-openwrt/releases/download/cnip/clang_v4_CNIP.rsc
/system logging disable 0
/import cnip.rsc
/system logging enable 0
:local CNIP [:len [/ip firewall address-list find list="CNIP"]]
/file remove [find name="cnip.rsc"]
:log info ("CNIP列表更新:"."$CNIP"."条规则")
```
### ROS ipv6导入脚本
```
/tool fetch url=https://github.75969207.xyz/https://github.com/rastyu/s905x3-openwrt/releases/download/cnip/clang_v6_CNIP.rsc
/system logging disable 0
/import cnipv6.rsc
/system logging enable 0
:local CNipv6 [:len [/ipv6 firewall address-list find list="CNipv6"]]
/file remove [find name="cnipv6.rsc"]
:log info ("CNipv6列表更新:"."$CNipv6"."条规则")
```
