#!/bin/bash

CUR_DIR=$(cd $(dirname $0) && pwd)

export LD_LIBRARY_PATH=$CANGJIE_HOME/runtime/lib/linux_x86_64_cjnative:$CANGJIE_HOME/tools/lib:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=$QT_HOME/lib:$CUR_DIR/native/lib/x86_64:${LD_LIBRARY_PATH}
export QT_QPA_PLATFORM=offscreen

# build cjqt library
cd $CUR_DIR
cjpm update
cjpm build

LIB_PATH=$CUR_DIR/target/release/cjqt
NATIVE_LIB=$CUR_DIR/native/lib/x86_64

# run Cangjie unit tests (test/UT/*)
echo "== Cangjie unit tests =="
UT_DIR=$CUR_DIR/target/release/ut
mkdir -p $UT_DIR
UT_PASS=0
UT_FAIL=0
for f in $CUR_DIR/test/UT/*/ut_*_test.cj; do
    name=$(basename "$f" .cj)
    if ! cjc --test-only --import-path $LIB_PATH -L $LIB_PATH -L $NATIVE_LIB \
        -lcjqt -lcjqt.core -lcjqt.gui -lcjqt.widgets -lcjqt.tools -lnativeQt \
        -o $UT_DIR/$name "$f" 2>/dev/null; then
        echo "COMPILE FAIL $name"
        UT_FAIL=$((UT_FAIL+1))
        continue
    fi
    if timeout 120 $UT_DIR/$name >$UT_DIR/$name.log 2>&1 && \
        [ "$(perl -pe 's/\e\[\d*(;\d*)*[mK]//g' $UT_DIR/$name.log | grep -aoE 'FAILED: [0-9]+' | tail -1)" = "FAILED: 0" ]; then
        echo "RUN OK    $name"
        UT_PASS=$((UT_PASS+1))
    else
        echo "RUN FAIL  $name"
        UT_FAIL=$((UT_FAIL+1))
    fi
done
echo "Cangjie unit tests passed: $UT_PASS, failed: $UT_FAIL"
if [ $UT_FAIL -ne 0 ]; then
    exit 1
fi

# run native layer unit tests (test/native/)
echo "== native unit tests =="
if ! $CUR_DIR/test/native/run_native_test.sh; then
    echo "NATIVE UNIT TEST FAILED"
    exit 1
fi
echo "native unit tests passed"

# compile and run LLT tests
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
