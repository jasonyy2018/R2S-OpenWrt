#!/bin/bash
#Master+jayanta525
git clone -b master https://git.openwrt.org/openwrt/openwrt.git openwrt
cd openwrt
wget -q https://raw.githubusercontent.com/project-openwrt/R2S-OpenWrt/master/PATCH/jayanta525/001-rockchip-add-support-for-rk3328-radxa-rock-pi-e.patch
wget -q https://raw.githubusercontent.com/project-openwrt/R2S-OpenWrt/master/PATCH/jayanta525/002-rockchip-add-support-for-FriendlyARM-NanoPi-R2S.patch
patch -p1 < ./001-rockchip-add-support-for-rk3328-radxa-rock-pi-e.patch
patch -p1 < ./002-rockchip-add-support-for-FriendlyARM-NanoPi-R2S.patch
cd ..
#等待上游修复后使用
#git clone -b nanopi-r2s https://git.openwrt.org/openwrt/staging/blocktrron.git openwrt
cd openwrt
#git config --local user.email "action@github.com" && git config --local user.name "GitHub Action"
#git remote add upstream https://github.com/openwrt/openwrt.git && git fetch upstream
#git rebase upstream/master
sed -i "s/# CONFIG_ROCKCHIP_THERMAL is not set/CONFIG_ROCKCHIP_THERMAL=y/g" target/linux/rockchip/armv8/config-5.4
cd ..
git clone -b dev-19.07 --single-branch https://github.com/Lienol/openwrt openwrt-lienol
exit 0