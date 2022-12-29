#bin/sh

CUR_DIR=$(cd $(dirname $0) && pwd)

GET_ARCH=`arch`
if [[ $GET_ARCH =~ "x86_64" ]];then
    QT_PLATFORM_URL=$CUR_DIR/../../native/lib/x86_64
elif [[ $GET_ARCH =~ "aarch64" ]];then
    QT_PLATFORM_URL=$CUR_DIR/../../native/lib/aarch64
else
    QT_PLATFORM_URL=$CUR_DIR/../../native/lib
fi

export LD_LIBRARY_PATH=$QT_PLATFORM_URL:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=$CUR_DIR/build/cjqt:${LD_LIBRARY_PATH}

export QT_QPA_PLATFORM_PLUGIN_PATH=$QT_PLATFORM_URL/platforms

# native build
# sh $CUR_DIR/../../build.sh

cd $CUR_DIR

# cpm build
cpm update
cpm build

# run
./build/bin/main