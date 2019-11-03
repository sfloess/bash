virt-install \
--connect xen:/// \
--paravirt \
--name workstation-xen \
--ram 3192 \
--disk size=50 \
--vcpus 2 \
--os-type linux \
--os-variant virtio26 \
--network bridge=bridge0 \
--graphics none \
--location 'http://192.168.168.31/cblr/links/Fedora-28-x86_64/' \
--extra-args 'text console=ttyS0 utf8 console=hvc0' 
