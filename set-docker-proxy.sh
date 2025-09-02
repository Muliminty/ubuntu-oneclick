#!/bin/bash
# 一键设置 Docker 代理 (systemd)

set -e

# 代理地址 (请修改为你自己的代理地址)
HTTP_PROXY="http://127.0.0.1:7890 "
HTTPS_PROXY="http://127.0.0.1:7890 "
NO_PROXY="localhost,127.0.0.1"

# 创建目录
sudo mkdir -p /etc/systemd/system/docker.service.d

# 写入代理配置
cat <<EOF | sudo tee /etc/systemd/system/docker.service.d/http-proxy.conf
[Service]
Environment="HTTP_PROXY=${HTTP_PROXY}"
Environment="HTTPS_PROXY=${HTTPS_PROXY}"
Environment="NO_PROXY=${NO_PROXY}"
EOF

# 重新加载并重启 Docker
echo ">>> 重新加载 systemd..."
sudo systemctl daemon-reexec
sudo systemctl daemon-reload

echo ">>> 重启 Docker..."
sudo systemctl restart docker

echo ">>> Docker 代理配置完成！"
echo "验证配置: systemctl show --property=Environment docker"
