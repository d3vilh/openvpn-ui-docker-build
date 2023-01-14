#!/bin/bash -x
# Exit immediately if a command exits with a non-zero status
set -e

OD=$PWD

# go to script folder, required for below steps
CURDIR=${OD}/$(dirname $0)
cd "${CURDIR}"
# Build golang & bee environment
docker build --platform="arm" -f Dockerfile-beego -t local/beego-v8 -t local/beego-v8:latest .

./openvpn-ui-pack2.sh

# Build OpenVPN-UI image

PKGFILE="/home/philipp/build/openvpn-ui/openvpn-ui.tar.gz"
cp -f $PKGFILE ./

docker build -t local/openvpn-ui .
rm -f $PKGFILE; rm -f $(basename $PKGFILE)
