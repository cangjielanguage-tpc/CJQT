#bin/sh

NATIVE_PATH=$(cd `dirname $0`; pwd)
BUILD_PATH=$NATIVE_PATH/build

if [ ! -d "$BUILD_PATH" ];then
    echo "mkdir $BUILD_PATH"
    mkdir $BUILD_PATH
fi

cd $BUILD_PATH
cmake ..
make

cp $NATIVE_PATH/build/libnativeQt.so $NATIVE_PATH/lib/aarch64/libnativeQt.so