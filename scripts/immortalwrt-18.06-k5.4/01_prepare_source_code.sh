#!/bin/bash

. ./scripts/funcations.sh

# 开始克隆仓库，并行执行
clone_repo $immortalwrt_repo openwrt-18.06-k5.4 openwrt &
clone_repo $mosdns_repo v5 mosdns &
clone_repo $v2ray_geodata_repo master v2ray_geodata &
clone_repo $dockerman_repo master dockerman &
clone_repo $openclash_repo master openclash &
# 等待所有后台任务完成
wait

# 修改默认 IP 为 192.168.1.99
sed -i 's/192.168.1.1/192.168.2.254/g' openwrt/package/base-files/files/bin/config_generate

exit 0
