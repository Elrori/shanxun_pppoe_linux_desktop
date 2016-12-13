shanxun_pppoe_linux_desktop 使用 Leon - <miao1007@gmail.com>同学的源码```不支持心跳```因为没有x86-ubuntu上的闪讯拨号软件，直接使用Openwrt-NetKeeper插件，外加shell脚本就可以方便的拨号，核心仍是帐号算法(real name 前8位码不按照此刻时间得出的值似乎也可以使用)，这个安装脚本只是方便拨号而已！win版已经编写完成（室友C#上马，不过似乎没啥实用意义）。
###依赖：pppd 
```
sudo apt-get install ppp
```
###使用方法：
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
##注意：显示连接成功但是无法连接外网，请配置路由表。```connect_sx stop``` 后如果无法使用无线网，请配置路由表或重启网络服务
###感谢 
算法源码使用了Openwrt-NetKeeper 作者：Leon - miao1007@gmail.com
项目页：https://github.com/miao1007/Openwrt-NetKeeper
###Authors
 shell script : helrori - <helrori2011@gmail.com> from HDU 2016.10.18
