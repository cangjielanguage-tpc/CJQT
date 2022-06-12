#bin/sh

export LD_LIBRARY_PATH=./native/build:${LD_LIBRARY_PATH}

# native build
./native/make.sh

# cpm build
cpm update
cpm build

# run
./bin/main