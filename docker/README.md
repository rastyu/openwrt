```
version: "3.4"
services: 
  web:
    image: jlesage/nginx-proxy-manager:latest   # 容器镜像名
    container_name: nginx                       # 容器名称
    restart: unless-stopped                     # 重启策略
    network_mode: host                          # host网络
    volumes:
      - /volume1/docker/npm:/config             # 配置保存目录
    environment:          
      - TZ=Asia/Shanghai                        # 时区
      - USER_ID=1026
      - GROUP_ID=100
#默认管理: 192.168.10.5:8181
#http端口:8080
#https端口:4443
#默认邮箱：admin@example.com
#默认密码：changeme
```
