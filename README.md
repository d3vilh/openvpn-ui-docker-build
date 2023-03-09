# openvpn-ui-docker-build
Scripts simplifying build of openvpn-ui for ARM32v7

## To build the image
As prerequisite, you need to have Docker installed and running:
```
sudo apt-get install docker.io -y
sudo systemctl restart docker
```

 To build own image you need to set local path to [openvpn-ui](https://github.com/d3vilh/openvpn-ui ) sources into OVPN_UI_HOME var in the [build_openvpn-ui.sh](https://github.com/d3vilh/openvpn-ui-docker-build/blob/master/build_openvpn-ui.sh) and [openvpn-ui-pack2.sh](https://github.com/d3vilh/openvpn-ui-docker-build/blob/master/openvpn-ui-pack2.sh) files. For example:

```
# Set the home directory of the openvpn-ui project
OVPN_UI_HOME="/home/admin/build/openvpn-ui"
```

Then run `build_openvpn-ui.sh` to build the image. The image will be named `openvpn-ui`.

## To run the image

```
docker run --platform="arm" \
-v /home/philipp/openvpn:/etc/openvpn \
-v /home/philipp/openvpn/db:/opt/openvpn-gui/db \
-v /home/philipp/openvpn/pki:/usr/share/easy-rsa/pki \
-e OPENVPN_ADMIN_USERNAME='admin' \
-e OPENVPN_ADMIN_PASSWORD='gagaZush' \
-p 8080:8080/tcp \
--privileged local/openvpn-ui 
```

Originally developed by [@bugsyb](https://github.com/bugsyb) for ARMv8, then modified to support ARM32v7 and [raspberry-gateway](https://github.com/d3vilh/raspberry-gateway) project by [@d3vilh](https://github.com/d3vilh) 
