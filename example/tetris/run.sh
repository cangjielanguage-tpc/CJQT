#bin/sh

CUR_DIR=$(cd $(dirname $0) && pwd)

export LD_LIBRARY_PATH=$CUR_DIR/../../native/build:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=$CUR_DIR/build/cjqt:${LD_LIBRARY_PATH}

# native build
sh $CUR_DIR/../../build.sh

cd $CUR_DIR

# cpm build
cpm update
cpm build

# run
./bin/main