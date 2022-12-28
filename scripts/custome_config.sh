#!/bin/bash

sed -i -e '/CONFIG_MAKE_TOOLCHAIN=y/d' configs/rockchip/01-nanopi
sed -i -e 's/CONFIG_IB=y/# CONFIG_IB is not set/g' configs/rockchip/01-nanopi
sed -i -e 's/CONFIG_SDK=y/# CONFIG_SDK is not set/g' configs/rockchip/01-nanopi
sed -i -e 's/r2s/r4s/g' configs/rockchip/01-nanopi
sed -i -e 's/HOSTNAME="FriendlyWrt"/HOSTNAME="NanoPi-R4SE"/g' friendlywrt/target/linux/rockchip/armv8/base-files/root/setup.sh
sed -i -e '/uci commit network/i \\tuci set network.lan.ipaddr=192.168.10.253' friendlywrt/target/linux/rockchip/armv8/base-files/root/setup.sh
sed -i -e '/uci commit network/i \\tuci set network.lan.gateway=192.168.10.1' friendlywrt/target/linux/rockchip/armv8/base-files/root/setup.sh
sed -i -e '/uci commit network/i \\tuci set network.lan.dns=192.168.10.1' friendlywrt/target/linux/rockchip/armv8/base-files/root/setup.sh
sed -i -e '/uci commit network/i \\tuci set network.lan.broadcast=192.168.10.255' friendlywrt/target/linux/rockchip/armv8/base-files/root/setup.sh
sed -i -e '/uci commit dhcp/i \\tuci set dhcp.lan.ignore=1' friendlywrt/target/linux/rockchip/armv8/base-files/root/setup.sh
sed -i -e '/uci commit dhcp/i \\tuci del dhcp.lan.ra' friendlywrt/target/linux/rockchip/armv8/base-files/root/setup.sh
sed -i -e '/uci commit dhcp/i \\tuci del dhcp.lan.ra_management' friendlywrt/target/linux/rockchip/armv8/base-files/root/setup.sh