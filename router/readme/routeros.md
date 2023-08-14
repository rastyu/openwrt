### IP来源
 
 [17mon/china_ip_list](https://github.com/17mon/china_ip_list)  
 [metowolf/iplist](https://github.com/metowolf/iplist)  
 [苍狼山庄](https://ispip.clang.cn/)
 ***
### ROS导入脚本
```
/tool fetch url=https://ghproxy.com/https://github.com/rastyu/s905x3-openwrt/releases/download/cnip/cnip.rsc
/system logging disable 0
/import cnip.rsc
/system logging enable 0
:local CNIP [:len [/ip firewall address-list find list="CNIP"]]
/file remove [find name="cnip.rsc"]
:log info ("CNIP列表更新:"."$CNIP"."条规则")
```
