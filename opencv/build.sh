#!/bin/bash

if [ `uname` == Darwin ]; then
    PY_LIB="libpython2.7.dylib"
else
    PY_LIB="libpython2.7.so"
fi
export LD_LIBRARY_PATH=$PREFIX/lib
export LIBRARY_PATH=$PREFIX/lib
export INCLUDE_PATH=$PREFIX/include
export all_proxy=http://web-cache.usyd.edu.au:8080
export http_proxy=http://web-cache.usyd.edu.au:8080
export https_proxy=http://web-cache.usyd.edu.au:8080
echo 00000
echo $LD_LIBRARY_PATH
echo 00000
echo $LIBRARY_PATH
echo 00000
pkg-config --cflags libavformat
echo 00000
mkdir build
cd build
cmake                                                               \
    -DPYTHON_EXECUTABLE=$PREFIX/bin/python                          \
    -DPYTHON_INCLUDE_DIR=$PREFIX/include/python2.7/                 \
    -DPYTHON_LIBRARY=$PREFIX/lib/$PY_LIB                            \
    -DPYTHON_PACKAGES_PATH=$PREFIX/lib/python2.7/site-packages/     \
    -DCMAKE_INSTALL_PREFIX=$PREFIX                                  \
    -DJPEG_INCLUDE_DIR:PATH=$PREFIX/include                         \
    -DJPEG_LIBRARY:FILEPATH=$PREFIX/lib/libjpeg.so                  \
    -DPNG_PNG_INCLUDE_DIR:PATH=$PREFIX/include                      \
    -DPNG_LIBRARY:FILEPATH=$PREFIX/lib/libpng.so                    \
    -DZLIB_INCLUDE_DIR:PATH=$PREFIX/include                         \
    -DZLIB_LIBRARY:FILEPATH=$PREFIX/lib/libz.so                     \
    -DCMAKE_BUILD_TYPE=Release                                      \
    -DFFMPEG_INCLUDE_DIR=$PREFIX/include                            \
    ..
make -j -
make install
