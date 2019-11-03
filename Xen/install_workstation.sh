virt-install \
--connect xen:/// \
--paravirt \
--name workstation \
--ram 3192 \
--disk size=25 \
--vcpus 2 \
--os-type linux \
--os-variant virtio26 \
--network bridge=bridge0 \
--graphics vga \
--location 'http://192.168.168.31/cblr/links/Fedora-28-x86_64/' \
--extra-args 'ks=http://192.168.168.31/kickstart/workstation.ks text console=ttyS0 utf8 console=hvc0' 
