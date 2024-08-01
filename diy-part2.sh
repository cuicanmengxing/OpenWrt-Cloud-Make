# Modify hostname
sed -i 's/OpenWrt/S1/g' package/base-files/files/bin/config_generate
# Add Theme
rm -rf ./feeds/luci/themes/luci-theme-argon
rm -rf ./feeds/luci/themes/luci-theme-argon-mod
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git ./package/custom_packages/luci-theme-argon
rm -rf ./feeds/luci/applications/luci-app-argon-config
git clone -b 18.06 https://github.com/jerrykuku/luci-app-argon-config.git ./package/custom_packages/luci-app-argon-config
git clone https://github.com/gngpp/luci-theme-design.git  package/luci-theme-design
#修改连接数
sed -i 's/16384/65535/g' package/kernel/linux/files/sysctl-nf-conntrack.conf
