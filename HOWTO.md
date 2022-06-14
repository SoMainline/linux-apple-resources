# Guide to building and booting Linux on iDevices


## pongoOS

### macOS

0. install [checkra1n](https://checkra.in)
1. git clone https://github.com/konradybcio/pongoOS
2. cd pongoOS
3. `make -j$(nproc)`
4. `/Applications/checkra1n.app/Contents/MacOS/checkra1n -v -V -p -c -k /build/Pongo.bin`

### Linux (adapted from the pongoOS repo)
0. install [checkra1n](https://checkra.in)
1. git clone https://github.com/konradybcio/pongoOS
2. cd pongoOS
3. install clang (use your distro's package manager)
4. install ld64 and cctools-strip
 * on Debian, Ubuntu and friends:
```
echo 'deb https://assets.checkra.in/debian /' | sudo tee /etc/apt/sources.list.d/checkra1n.list
sudo apt-key adv --fetch-keys https://assets.checkra.in/debian/archive.key
sudo apt-get update
sudo apt-get install -y ld64 cctools-strip
```
 * else build from this repo `https://github.com/Siguza/ld64`
5. `EMBEDDED_CC=clang EMBEDDED_LDFLAGS=-fuse-ld=/usr/bin/ld64 STRIP=cctools-strip make all`
6. `/path/to/checkra1n -v -V -p -c -k /build/Pongo.bin`


## Linux

### macOS

0. get a Linux machine / VM and follow the instructions below `¯\_(ツ)_/¯`

### Linux

0. install `clang ncurses flex git` and whatever build-essential packages from your distro
1. `https://github.com/konradybcio/linux-apple` (this like >2 GiB in size)
2. cd linux-apple
3. 
 * get a defconfig (there's an example one in this repo) and copy it as .config to the directory you're in or
 * run `make defconfig` if you're on arm64 or
 * run `make ARCH=arm64 CROSS_COMPILE=clang LLVM=1 defconfig` if you're on !arm64
4. make sure `CONFIG_ARCH_APPLE`, `CONFIG_FB_SIMPLE` and `CONFIG_USB_DWC2` are set to =y
5. adjust your page size:
 * run `make menuconfig` (arm64) / `make ARCH=arm64 CROSS_COMPILE=clang LLVM=1 menuconfig` (!arm64)
 * press `/` to search
 * type `_PAGES` and press ENTER
 * press 1
 * press enter and select your desired pagesize with arrows (4K for A7-A8X, 16K for A9 and above)
 * press enter to select
 * mash ESC like a mad dog until you get asked whether you want to save, choose yes
6. compile the kernel with `make -j$(nproc) Image.lzma dtbs` (arm64) / `make ARCH=arm64 CROSS_COMPILE=clang LLVM=1 -j$(nproc) Image.lzma dtbs` (!arm64)


## DTBPACK

0. get the dtbpack script from this repo and put it in your Linux source directory
1. make it executable by running `chmod +x dtbpack.sh`
2. run ./dtbpack.sh
3. verify there is now a ~100KiB file called dtbpack in your directory by running `ls -lh dtbpack`

## Boot the thing

0. think back to where your pongoOS directory is
1. find some arm64 ramdisk (you can steal it from any arm64 distro's /boot partition or use one from this repo)
2. python3 /path/to/pongoOS/scripts/load_linux.py -k arch/arm64/boot/Image.lzma -d dtbpack -r someramdisk.img
