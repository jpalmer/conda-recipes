#!/bin/bash
CC=cc CXX=c++ ./bootstrap --system-libs --no-system-jsoncpp --prefix=$PREFIX --parallel=${CPU_COUNT} -- -DCMAKE_USE_OPENSSL=ON
make -j${CPU_COUNT}
rm $SRC_DIR/Modules/CPack.OSXScriptLauncher.in
make install
