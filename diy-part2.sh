#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

rm -rf ./package/custom_packages
mkdir -p ./package/custom_packages

# Modify default IP
# sed -i 's/192.168.1.1/10.10.0.253/g' package/base-files/files/bin/config_generate

# Modify default passwd
# sed -i '/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF./ d' package/lean/default-settings/files/zzz-default-settings

# Modify hostname
sed -i 's/OpenWrt/Redmi_AX5/g' package/base-files/files/bin/config_generate

# Add Theme
rm -rf ./feeds/luci/themes/luci-theme-argon
rm -rf ./feeds/luci/themes/luci-theme-argon-mod
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git ./package/custom_packages/luci-theme-argon

rm -rf ./feeds/luci/applications/luci-app-argon-config
git clone -b 18.06 https://github.com/jerrykuku/luci-app-argon-config.git ./package/custom_packages/luci-app-argon-config

#修改连接数
sed -i 's/16384/65535/g' package/kernel/linux/files/sysctl-nf-conntrack.conf



