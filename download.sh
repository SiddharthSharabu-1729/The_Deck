echo "[*] Downloading the Linaro gcc ARM Cross Compiler"
wget -c https://releases.linaro.org/components/toolchain/binaries/6.5-2018.12/arm-linux-gnueabihf/gcc-linaro-6.5.0-2018.12-x86_64_arm-linux-gnueabihf.tar.xz

echo "[*] Extracting and Installing the downloaded Compiler"
tar xf gcc-linaro-6.5.0-2018.12-x86_64_arm-linux-gnueabihf.tar.xz
export CC=`pwd`/gcc-linaro-6.5.0-2018.12-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-

echo "[*] Testing the Compiler"
${CC}gcc --version

echo "The Test Output Should be :as below"
echo "arm-linux-gnueabihf-gcc (Linaro GCC 6.5-2018.12) 6.5.0"
echo "Copyright (C) 2017 Free Software Foundation, Inc."
echo "This is free software; see the source for copying conditions.  There is NO"
echo "warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE."

echo "[*] Downloading the U-Boot Bootloader....."
git clone -b v2021.04 https://github.com/u-boot/u-boot --depth=1
cd u-boot/

echo "[*] Patching and creating the pull request to configure BeagleBone AI"
git pull --no-edit https://github.com/beagleboard/u-boot v2021.04-bbb.io-am57xx

echo "[*] Cleaning the Old Builds....."
make ARCH=arm CROSS_COMPILE=${CC} distclean

echo "[*] Writing the BeagleBone AI configuraion to the .config of U-Boot"
make ARCH=arm CROSS_COMPILE=${CC} am57xx_evm_defconfig

echo "[*] Compiling the am57xx_evm_defconfig...."
make ARCH=arm CROSS_COMPILE=${CC}

echo "[*] Changing the Directory"
cd ~
echo "[*] Downloading the Kernel source from the Official BeagleBoard Repository" 
git clone https://github.com/RobertCNelson/ti-linux-kernel-dev.git
cd ti-linux-kernel-dev/

echo "[*] Git Checkout to ti-linux 4.14.y -b bmp "
git checkout origin/ti-linux-4.14.y -b tmp

echo "[*] Building the Kernel...."
./build_kernel.sh

echo "[*] Downloading the Ubuntu 20.04 Rootfile System..."
cd
wget -c https://rcn-ee.com/rootfs/eewiki/minfs/ubuntu-20.04.2-minimal-armhf-2021-06-20.tar.xz


echo "[*] Extracting the Rootfs..."
tar xf ubuntu-20.04.2-minimal-armhf-2021-06-20.tar.xz
