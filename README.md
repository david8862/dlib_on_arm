# port dlib-19.1 and face detect sample to ARMv7

The process only works on old dlib version (<= 19.1) since we use arm-linux-gnueabi toolchain

## build dlib with arm-linux-gnueabi

```shell
apt update && apt install -y cmake
wget http://dlib.net/files/dlib-19.1.tar.bz2
tar xjvf dlib-19.1.tar.bz2
mkdir dlib-19.1/build
cd dlib-19.1/build
export LD_LIBRARY_PATH=/opt/gcc-armv7l-meego-linux-gnueabi-2016.01_linux/usr/lib
cmake -DCMAKE_TOOLCHAIN_FILE=../../toolchain.cmake –build –config Release ..
make
```
the output .so and .a at dlib-19.1/build/dlib/

## build face detect sample with arm-linux-gnueabi

### Use CMake

```shell
cd dlib-19.1/examples/
cp -rf ../../sl_face_detect.cpp .
vim CMakeLists.txt
```
comment out all existing "add_example" and add a new "add_example(sl_face_detect)"

```shell
mkdir build
cd build
cp -rf ../../../toolchain.cmake .
export LD_LIBRARY_PATH=/opt/gcc-armv7l-meego-linux-gnueabi-2016.01_linux/usr/lib
cmake -DDLIB_NO_GUI_SUPPORT=1 -DCMAKE_TOOLCHAIN_FILE=../../../toolchain.cmake –build –config Release ..
make
```
the output binary (static linked) "sl_face_detect" at dlib-19.1/examples/build/

### Use toolchain directly (need libpng,libjpeg)

```shell
cd dlib-19.1/examples/
cp -rf ../../sl_face_detect.cpp .
export LD_LIBRARY_PATH=/opt/gcc-armv7l-meego-linux-gnueabi-2016.01_linux/usr/lib
/opt/gcc-armv7l-meego-linux-gnueabi-2016.01_linux/cross/bin/armv7l-meego-linux-gnueabi-g++ -std=c++11 -O3 -I.. ../dlib/all/source.cpp -lpthread -lpng sl_face_detect.cpp -DDLIB_JPEG_SUPPORT=1 -DDLIB_PNG_SUPPORT=1 -DDLIB_GIF_SUPPORT=1 -DDLIB_NO_GUI_SUPPORT=1 -o sl_face_detect
```

