#!/bin/bash

CUR_DIR=$(cd $(dirname $0) && pwd)
NATIVE_DIR=$CUR_DIR/../../native
BUILD_DIR=$CUR_DIR/build

if [ -z "$QT_HOME" ]; then
    echo "ERROR: QT_HOME is not set"
    exit 1
fi

# build native library first
if [ ! -f "$NATIVE_DIR/lib/x86_64/libnativeQt.so" ]; then
    (cd $NATIVE_DIR && ./make.sh)
fi

if [ ! -d "$BUILD_DIR" ]; then
    mkdir -p $BUILD_DIR
fi

cd $BUILD_DIR
cmake $CUR_DIR
make

export LD_LIBRARY_PATH=$QT_HOME/lib:$NATIVE_DIR/lib/x86_64:${LD_LIBRARY_PATH}
export QT_QPA_PLATFORM=offscreen

./native_test
