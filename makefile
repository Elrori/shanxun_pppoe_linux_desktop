#This is a demo for MTK7620A bcm2710(raspberrypi3) x86linux (all test OK)
#bcm2710(raspberrypi3)'s Toolchain dowmload from https://downloads.lede-project.org/snapshots/targets/brcm2708/bcm2710/lede-sdk-brcm2708-bcm2710_gcc-5.4.0_musl-1.1.15_eabi.Linux-x86_64.tar.bz2
#openwrt(lede) on bcm2710(raspberrypi3) test OK,version 2016-09-23-raspbian-jessie
#makefile，sxplugin use Leon - <miao1007@gmail.com> 's script
#感谢 Leon - <miao1007@gmail.com> https://github.com/miao1007/Openwrt-NetKeeper/

#请先使用下面默认的TODO项，编译不通过再修改
#TODO:填写解压的Toolchain中bin与include所在的目录（根目录）
LOCATION=/usr
#TODO:请查找目录LOCATION/bin/ 下gcc编译器的具体名字填在下面
CC=$(LOCATION)/bin/gcc
#TODO:必须修改pppd的版本，取决于路由器(电脑)的/usr/lib/pppd/下的版本号，ubuntu 14.04 2.4.5,raspbian 2.4.6,openwrt主流2.4.7
PPPD_VER=2.4.5

CFLAGS=-Os -Werror -I$(LOCATION)/include -fPIC -DPPPOE_VER='"${PPPD_VER}"'
#  change RADIUS
# 
# ChongQing Netkeeper: cqxinliradius002
# ChongQing Netkeeper(0094): xianxinli1radius
# WuHan E xin: hubtxinli01
# Hangzhou(Tested on HDU): singlenet01
# qinghai 3.6.27: shd@xiaoyuan0002
# Xinjiang 3.7.3 : xinjiang@0724
# hebei: hebeicncxinli002
# ShanDong Mobile : shandongmobile13
# Shanxi Yixun : sh_xi@xiaoyuan01
# GanSu Telecom 3.7.1 : xiaoyuanyixun001

##  The following radius has been deprecated due to update. No more used.
#
# ShanDong Telecom : 560Ox!a0yuanOlIz  (For 3.7.3 Augest Version)
# ShanDong Telecom : shdOx!a0yuan01lz  (For 3.7.3 October 27th Version)
# NanChangV12~V17: radius
# NanChangV18~V29: nanchang3.0
# NanChangV32: jiangxi4.0
#

#  Change PREFIX1
# 
# NanChangV32: '1'
# Others: '\n'


chongqing0094_sxplugin:
	@$(CC) $(CFLAGS) sxplugin.c -DRADIUS='"xianxinli1radius"'  -DPREFIX1="'\n'" -shared -o $@.so

chongqing_sxplugin:
	@$(CC) $(CFLAGS) sxplugin.c -DRADIUS='"cqxinliradius002"'  -DPREFIX1="'\n'" -shared -o $@.so

hubei_sxplugin:
	@$(CC) $(CFLAGS) sxplugin.c -DRADIUS='"hubtxinli01"' -DPREFIX1="'\n'" -shared -o $@.so
	
zhejiang_xiaoyuan_sxplugin:
	@$(CC) $(CFLAGS) sxplugin.c -DRADIUS='"singlenet01"' -DPREFIX1="'\n'" -shared -o $@.so
	
xinjiang_sxplugin:
	@$(CC) $(CFLAGS) sxplugin.c -DRADIUS='"xinjiang@0724"' -DPREFIX1="'\n'" -shared -o $@.so
	
qinghai_sxplugin:
	@$(CC) $(CFLAGS) sxplugin.c -DRADIUS='"shd@xiaoyuan0002"'  -DPREFIX1="'\n'" -shared -o $@.so
	
shandongmobile_sxplugin:
	@$(CC) $(CFLAGS) sxplugin.c -DRADIUS='"shandongmobile13"' -DPREFIX1="'\n'" -shared -o $@.so
	
hebei_sxplugin:
	@$(CC) $(CFLAGS) sxplugin.c -DRADIUS='"hebeicncxinli002"' -DPREFIX1="'\n'" -shared -o $@.so
	
shanxi_yixun_sxplugin:
	@$(CC) $(CFLAGS) sxplugin.c -DRADIUS='"sh_xi@xiaoyuan01"' -DPREFIX1="'\n'" -shared -o $@.so
	
gansu_telecom_sxplugin:
	@$(CC) $(CFLAGS) sxplugin.c -DRADIUS='"xiaoyuanyixun001"' -DPREFIX1="'\n'" -shared -o $@.so
	
zhejiang_qiye_sxplugin:
	@$(CC) $(CFLAGS) sxplugin.c -DRADIUS='"zjxinlisx02"' -DPREFIX1="'\n'" -shared -o $@.so
	
hainan_sxplugin:
	@$(CC) $(CFLAGS) hainan_sxplugin.c -shared -o $@.so
	
clean:
	rm *.so 
install:
	cp *.so /usr/lib/pppd/${PPPD_VER}/ 
