#!/bin/bash
route del default
pppd nodetach defaultroute usepeerdns maxfail 1 user $1 password $2 mtu 1492 mru 1492 plugin rp-pppoe.so nic-eth0 plugin zhejiang_xiaoyuan_sxplugin.so
