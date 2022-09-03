import time
from embyserver import embyserver

#EMBY 域名 包含http(s)和端口号后面不带/
#例如https://xxx.xxx.xxx:8920
embyhost = 'http://192.168.10.5:8096'
#EMBY 用户ID 进EMBY 用户点击管理员账号配置可以在网址上看到userId
embyuserid = '053e047de092441a9e0a8fe1951345a6'
#EMBY APIKEY
embykey = '799a6b5d48eb48cca88aae17917bd5c1'
#TMDB APIKEY
tmdbkey = '3dc672cf452b813d8c97b26917b8b375'
#线程数量
threadnum = 4
#是否刷新人名
updatepeople = True
#每次刷新全部媒体间隔时间 [小时]
updatetime = 1

if __name__ == '__main__':
    embymediaclient = embyserver(embyhost=embyhost, embyuserid=embyuserid, embykey=embykey, tmdbkey=tmdbkey, threadnum=threadnum, updatepeople=updatepeople)
    while True:
        try:
            print('开始刷新媒体库元数据')
            embymediaclient.update_media_name()
            print('刷新媒体库元数据完成')
        except Exception as reuslt:
            print(reuslt)
