### 编辑 /etc/config/cifs
```
config cifs
	option workgroup 'WORKGROUP'
	option iocharset 'utf8'
	option delay '5'
	option mountarea '/mnt'
	option enabled '1'

config natshare
	option iocharset 'utf8'
	option agm 'rw'
	option users 'admin'
	option pwd 'password'
	option server '192.168.10.5'
	option name 'pt'
	option smbver '3.0'
	option natpath '/mnt/pt'

```
