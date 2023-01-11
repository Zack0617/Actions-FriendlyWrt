#!/bin/bash

# {{ Add luci-app-diskman
(cd friendlywrt && {
    mkdir -p package/luci-app-diskman
    wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/applications/luci-app-diskman/Makefile -O package/luci-app-diskman/Makefile
    mkdir -p package/parted
    wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/Parted.Makefile -O package/parted/Makefile
})
cat >> configs/rockchip/01-nanopi <<EOL
CONFIG_PACKAGE_luci-app-diskman=y
CONFIG_PACKAGE_luci-app-diskman_INCLUDE_btrfs_progs=y
CONFIG_PACKAGE_luci-app-diskman_INCLUDE_lsblk=y
CONFIG_PACKAGE_smartmontools=y
EOL
# }}

# {{ Add helloworld
echo "src-git helloworld https://github.com/Zack0617/helloworld.git" >> friendlywrt/feeds.conf.default
cat >> configs/rockchip/01-nanopi <<EOL
CONFIG_PACKAGE_luci-app-ssr-plus=y
EOL
# }}

