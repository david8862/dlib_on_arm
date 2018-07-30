# this is required
SET(CMAKE_SYSTEM_NAME Linux)

# specify the cross compiler
SET(CMAKE_C_COMPILER   /opt/gcc-armv7l-meego-linux-gnueabi-2016.01_linux/cross/bin/armv7l-meego-linux-gnueabi-gcc)
SET(CMAKE_CXX_COMPILER /opt/gcc-armv7l-meego-linux-gnueabi-2016.01_linux/cross/bin/armv7l-meego-linux-gnueabi-g++)

# where is the target environment 
SET(CMAKE_FIND_ROOT_PATH  /opt/gcc-armv7l-meego-linux-gnueabi-2016.01_linux/cross/armv7l-meego-linux-gnueabi/sys-root/)

# specify the compiler flag
SET(CMAKE_C_FLAGS  -O3 -mfpu=vfpv3)
SET(CMAKE_CXX_FLAGS  -std=c++11 -O3 -mfpu=vfpv3)
# search for programs in the build host directories (not necessary)
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

