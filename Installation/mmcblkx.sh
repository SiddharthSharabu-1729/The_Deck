export DISK=/dev/$1

clear
echo "[*] Deleting Partition..."
sudo dd if=/dev/zero of=${DISK} bs=1M count=10

clear
echo "[*] Installing BootLoader..."
sudo dd if=./u-boot/MLO of=${DISK} count=2 seek=1 bs=128k
sudo dd if=./u-boot/u-boot-dtb.img of=${DISK} count=4 seek=1 bs=384k

clear
echo "[*] Removing Partion in Sdcard..."
sudo sfdisk ${DISK} <<-__EOF__
4M,,L,*
__EOF__

sudo mkfs.ext4 -L rootfs ${DISK}1

clear
echo "[*] Mounting the Sdcard..."
sudo mount ${DISK}1 /media/rootfs/

export kernel_version=4.14.108-ti-r143

clear
echo "[*] Installing the Rootfile System..."
#sudo tar xfvp ./ubuntu-*-*-armhf-*/armhf-rootfs-*.tar -C /media/rootfs/
sudo tar xfvp armhf_rootfs_TheDeck.tar -C /media/rootfs
clear
echo "[*] Syncing..."
sync
sudo chown root:root /media/rootfs/
sudo chmod 755 /media/rootfs/

clear
echo "[*] Writing the uEnv..."
sudo sh -c "echo 'uname_r=${kernel_version}' >> /media/rootfs/boot/uEnv.txt"

clear
echo "[*] Installing the kernel..."
sudo cp -v ./ti-linux-kernel-dev/deploy/${kernel_version}.zImage /media/rootfs/boot/vmlinuz-${kernel_version}

clear
echo "[*] Installing the Device tree Binaries..."
sudo mkdir -p /media/rootfs/boot/dtbs/${kernel_version}/
sudo tar xfv ./ti-linux-kernel-dev/deploy/${kernel_version}-dtbs.tar.gz -C /media/rootfs/boot/dtbs/${kernel_version}/

clear
echo "[*] Installing the kernel modules..."
sudo tar xfv ./ti-linux-kernel-dev/deploy/${kernel_version}-modules.tar.gz -C /media/rootfs/

clear
echo "[*] umounting the /etc/fstab..."
sudo sh -c "echo '/dev/mmcblk0p1  /  auto  errors=remount-ro  0  1' >> /media/rootfs/etc/fstab"

clear
echo "[*] Syncing and umounting..."
sync
sudo umount /media/rootfs

clear
echo "[*] Unmounted Sucessfully..."
echo "[*] Sdcard is ready to Boot..."
