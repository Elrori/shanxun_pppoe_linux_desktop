
shanxun_pppoe_linux_desktop是linux上使用pppd进行闪讯拨号上网的脚本.实际上只使用了pppd命令.动态链接库的编译使用 Leon - <miao1007@gmail.com>的源码``拨号命令在pppd_sx.sh内``.脚本调用pppd命令拨号，pppd同时调用.so插件计算账号.

**依赖：pppd** 
```
sudo apt-get install ppp
```
**使用方法：**
1 修改或确认makefile文件的TODO项

2 安装&编译，进入src目录执行：
```
sudo chmod a+x INSTALL
sudo ./INSTALL zhejiang_xiaoyuan_sxplugin 
#(其他地区请更换,地区列表在makefile内) 
```
3 连接：
```
sudo connect_sx <username> <password> 
```
例如：```sudo connect_sx 18166666666@DZKD.XY 123456``` 即可连上闪讯；再一次连接使用上一次帐号密码直接执行 ```sudo connect_sx``` ; 更换密码 ```sudo connect_sx <password>```

4 断开连接：
```
sudo connect_sx stop
```
5 可以直接使用pppd命令拨号:
```
pppd noauth nodetach defaultroute usepeerdns maxfail 1 user <your username> password <your password> mtu 1492 mru 1492 plugin rp-pppoe.so <network card name> plugin zhejiang_xiaoyuan_sxplugin.so
```
其中动态链接库需要根据地区更改.
注意：显示连接成功但是无法连接外网，请配置路由表.

```connect_sx stop``` 后如果无法使用无线网,请配置路由表或重启网络服务

**感谢**

算法源码使用了Openwrt-NetKeeper 

作者：Leon - miao1007@gmail.com

项目页：https://github.com/miao1007/Openwrt-NetKeeper

Authors
 shell script : helrori - <helrori2011@gmail.com> in HDU 2016.10.18
 脚本不会被再次修改.
