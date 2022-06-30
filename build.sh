#bin/sh

CUR_DIR=$(cd $(dirname $0) && pwd)

# native build
sh $CUR_DIR/native/make.sh

# cpm build
cpm update
cpm build

# run
# ./bin/main