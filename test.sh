#!/bin/bash

CUR_DIR=$(cd $(dirname $0) && pwd)

export LD_LIBRARY_PATH=$CANGJIE_HOME/runtime/lib/linux_x86_64_cjnative:$CANGJIE_HOME/tools/lib:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=$QT_HOME/lib:$CUR_DIR/native/lib/x86_64:${LD_LIBRARY_PATH}
export QT_QPA_PLATFORM=offscreen

# build cjqt library
cd $CUR_DIR
cjpm update
cjpm build

# compile and run LLT tests
LIB_PATH=$CUR_DIR/target/release/cjqt
NATIVE_LIB=$CUR_DIR/native/lib/x86_64
TMP_DIR=$CUR_DIR/target/release/llt
mkdir -p $TMP_DIR

PASS=0
FAIL=0
for f in $CUR_DIR/test/LLT/*.cj; do
    name=$(basename "$f" .cj)
    if ! cjc --import-path $LIB_PATH -L $LIB_PATH -L $NATIVE_LIB \
        -lcjqt -lcjqt.core -lcjqt.gui -lcjqt.widgets -lcjqt.tools -lnativeQt \
        -o $TMP_DIR/$name "$f" 2>/dev/null; then
        echo "COMPILE FAIL $name"
        FAIL=$((FAIL+1))
        continue
    fi
    # painter_test uses QApplication.exec() and is interactive by design
    if [ "$name" = "painter_test" ]; then
        echo "RUN SKIP  $name (interactive)"
        continue
    fi
    if timeout 30 $TMP_DIR/$name >$TMP_DIR/$name.log 2>&1; then
        echo "RUN OK    $name"
        PASS=$((PASS+1))
    else
        echo "RUN FAIL  $name"
        FAIL=$((FAIL+1))
    fi
done

echo "=========="
echo "test pass: $PASS, fail: $FAIL"
exit $FAIL
