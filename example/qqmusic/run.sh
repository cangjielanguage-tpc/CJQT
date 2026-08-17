#!/bin/bash

CUR_DIR=$(cd $(dirname $0) && pwd)

GET_ARCH=`arch`
if [[ $GET_ARCH =~ "x86_64" ]];then
    QT_PLATFORM_URL=$CUR_DIR/../../native/lib/x86_64
elif [[ $GET_ARCH =~ "aarch64" ]];then
    QT_PLATFORM_URL=$CUR_DIR/../../native/lib/aarch64
else
    QT_PLATFORM_URL=$CUR_DIR/../../native/lib
fi

if [ -n "$QT_HOME" ]; then
    export LD_LIBRARY_PATH=$QT_HOME/lib:${LD_LIBRARY_PATH}
fi

if [ -n "$CANGJIE_HOME" ]; then
    export LD_LIBRARY_PATH=$CANGJIE_HOME/runtime/lib/linux_${GET_ARCH}_cjnative:${LD_LIBRARY_PATH}
    export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:${LD_LIBRARY_PATH}
fi

export LD_LIBRARY_PATH=$QT_PLATFORM_URL:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=$CUR_DIR/target/release/cjqt:${LD_LIBRARY_PATH}

export QT_QPA_PLATFORM_PLUGIN_PATH=$QT_PLATFORM_URL/platforms

cd $CUR_DIR

cjpm update
cjpm build

# run (工作目录需包含 musics 目录)
./target/release/bin/main
