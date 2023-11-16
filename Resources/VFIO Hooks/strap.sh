#!/bin/bash

sudo mkdir /etc/libvirt/hooks/

#Strap hooks
sudo wget 'https://raw.githubusercontent.com/PassthroughPOST/VFIO-Tools/master/libvirt_hooks/qemu' \
    -O /etc/libvirt/hooks/qemu
sudo chmod +x /etc/libvirt/hooks/qemu

#Create Dirs
sudo mkdir /etc/libvirt/hooks/qemu.d
sudo mkdir /etc/libvirt/hooks/qemu.d/win11
sudo mkdir /etc/libvirt/hooks/qemu.d/win11/prepare
sudo mkdir /etc/libvirt/hooks/qemu.d/win11/release
sudo mkdir /etc/libvirt/hooks/qemu.d/win11/prepare/begin
sudo mkdir /etc/libvirt/hooks/qemu.d/win11/release/end

#Copy files
sudo cp kvm.conf /etc/libvirt/hooks
sudo cp win11/bind_vfio.sh /etc/libvirt/hooks/qemu.d/win11/prepare/begin 
sudo cp win11/unbind_vfio.sh /etc/libvirt/hooks/qemu.d/win11/release/end

#Make Executable
sudo chmod +x /etc/libvirt/hooks/qemu.d/win11/prepare/begin/bind_vfio.sh 
sudo chmod +x /etc/libvirt/hooks/qemu.d/win11/release/end/unbind_vfio.sh 

#Tree to check the result
sudo tree /etc/libvirt/hooks/