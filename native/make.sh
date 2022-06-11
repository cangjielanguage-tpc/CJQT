#bin/sh

NATIVE_PATH=$(cd `dirname $0`; pwd)
BUILD_PATH=$NATIVE_PATH/build

if [ ! -d "$BUILD_PATH" ];then
    echo "mkdir $BUILD_PATH"
    mkdir $PWD/build
fi

cd $BUILD_PATH
cmake ..
make