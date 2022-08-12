# Guide to building and booting Linux on iDevices


## pongoOS

### macOS

1. Install [checkra1n](https://checkra.in)
2. `git clone https://github.com/konradybcio/pongoOS`
3. `cd pongoOS`
4. `make -j$(nproc)`
5. `/Applications/checkra1n.app/Contents/MacOS/checkra1n -v -V -p -c -k ./build/Pongo.bin`

### Linux (adapted from the pongoOS repo)
1. Install [checkra1n](https://checkra.in)
2. `git clone https://github.com/konradybcio/pongoOS`
3. `cd pongoOS`
4. Install `clang` (use your distro's package manager)
5. Install `ld64` and `cctools-strip`

#### Debian, Ubuntu and friends:
```
echo 'deb https://assets.checkra.in/debian /' | sudo tee /etc/apt/sources.list.d/checkra1n.list
sudo apt-key adv --fetch-keys https://assets.checkra.in/debian/archive.key
sudo apt-get update
sudo apt-get install -y ld64 cctools-strip
```
#### Other distros:
**ld64**
```
wget https://github.com/Siguza/ld64/releases/download/530-2/ld64.zip
unzip ld64.zip 
chmod +x ld64
sudo mv ./ld64 /usr/bin/
rm ./ld64.zip ./ld64_530-2_amd64.deb 
```

**cctools-strip**
```
wget https://github.com/Siguza/ld64/releases/download/530-2/cctools-strip.zip
unzip cctools-strip.zip
chmod +x cctools-strip
sudo mv ./cctools-strip /usr/bin/
rm ./cctools-strip.zip ./cctools-strip_949.0.1-2_amd64.deb
```

* Alternatively build from this repo: `https://github.com/Siguza/ld64`
6. `EMBEDDED_CC=clang EMBEDDED_LDFLAGS=-fuse-ld=/usr/bin/ld64 STRIP=cctools-strip make all`
7. `/path/to/checkra1n -v -V -p -c -k ./build/Pongo.bin`


## Linux (kernel)

### macOS

1. Get a Linux machine / VM and follow the instructions below `¯\_(ツ)_/¯`

### Linux

1. Install `clang ncurses flex git bison` and whatever build-essential packages from your distro
2. `git clone https://github.com/konradybcio/linux-apple` (this like >2 GiB in size)
3. `cd linux-apple`
4. Get a defconfig:
 * There's an example one in this repo and copy it as `.config` to the directory you're in. (`wget https://raw.githubusercontent.com/SoMainline/linux-apple-resources/master/example.config -O ./.config`)
 * Alternatively:
    * **On arm64:** Run `make defconfig`
    * **NOT on arm64:** Run `make ARCH=arm64 LLVM=1 defconfig`
5. Make sure `CONFIG_ARCH_APPLE`, `CONFIG_FB_SIMPLE` and `CONFIG_USB_DWC2` are set to `=y`
6. Adjust your page size:
 * **On arm64:** Run `make menuconfig` 
 * **NOT on arm64:** Run `make ARCH=arm64 LLVM=1 menuconfig`
 * Press `/` to search
 * Type `_PAGES` and press ENTER
 * Press `1`
 * Press `ENTER` and select your desired pagesize with arrows (4K for A7-A8X, 16K for A9 and above)
 * Press `ENTER` to select
 * Mash `ESC` like a mad dog until you get asked whether you want to save, choose yes
7. Compile the kernel: 
 * **On arm64:** `make -j$(nproc) Image.lzma dtbs`
 * **Not on arm64:** `make ARCH=arm64 LLVM=1 -j$(nproc) Image.lzma dtbs`


## DTBPACK

1. Get the dtbpack script from this repo and put it in your Linux source directory 
(`wget https://raw.githubusercontent.com/SoMainline/linux-apple-resources/master/dtbpack.sh`)

2. make it executable by running `chmod +x dtbpack.sh`
3. Run `./dtbpack.sh`
4. Verify there is now a ~100KiB (or more) file called `dtbpack` in your directory by running `ls -lh dtbpack`

## Boot the thing

1. Think back to where your pongoOS directory is
2. Find some arm64 ramdisk (you can steal it from any arm64 distro's /boot partition or use one from this repo)
3. `python3 /path/to/pongoOS/scripts/load_linux.py -k arch/arm64/boot/Image.lzma -d dtbpack -r someramdisk.img`
  * If you see `Waiting for device...` -> unplug and replug the lightning cable
