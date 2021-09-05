# Encrypt Ubuntu

This follows https://www.mikekasberg.com/blog/2020/04/08/dual-boot-ubuntu-and-windows-with-encryption.html


* boot from live stick
* run gparted
* create 2 partitions - note that the partition names may be different depending on disk
  * boot
    * 768 MB
    * ext4
    * Name: /boot
    * Partition /dev/nvme0n1p7
  * data
    * whatever space is available
    * ext4
    * Name: /rootfs
    * Partition /dev/nvme0n1p8

Run
```
cryptsetup luksFormat --type=luks1 /dev/nvme0n1p8
cryptsetup open /dev/nvme0n1p8 sda6_crypt
ls /dev/mapper (should show "control sda6_crypt")
```
```
pvcreate /dev/mapper/sda6_crypt 
vgcreate ubuntu-vg /dev/mapper/sda6_crypt
lvcreate -L 32G -n swap_1 ubuntu-vg  (32G == RAM)
lvcreate -l 100%FREE -n root ubuntu-vg
```

now run "install ubuntu" with "Something else"

in gparted select the partitions and choose "Change"
- /dev/nvme0n1p7 as ext4 with mount point /boot
- /dev/mapper/ubuntu--vg-root as ext4 with mount point /
- /dev/mapper/ubuntu--vg-swap_1 as swap
bootloader device should remain as is

after installation back to live ubuntu (continue testing)

get UUID of encrypted drive (not the PARTUUID): `blkid /dev/nvme0n1p8`

get into chroot of newly installed system:

```
mount /dev/mapper/ubuntu--vg-root /target
mount /ddev/nvme0n1p7 /target/boot
for n in proc sys dev etc/resolv.conf; do mount --rbind /$n /target/$n; done 
chroot /target     
mount -a

vi /etc/crypttab
enter the following
sda6_crypt UUID=<uuid-from-blkid> none luks,discard
save and close, run
update-initramfs -k all -c
```