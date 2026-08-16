/*
 * CJQT native layer unit tests: QtCore classes
 */
#include "test_harness.h"

extern "C"
{
    uintptr_t nativeTimerCreate(void (*callback)(uintptr_t), int interval);
    void nativeTimerDelete(uintptr_t ptr);
    void nativeTimerStart(uintptr_t ptr);
    void nativeTimerStop(uintptr_t ptr);

    uintptr_t nativeUrlCreate(const char *url, int parsingMode);
    void nativeUrlDelete(uintptr_t ptr);
    char *nativeUrlToString(uintptr_t ptr);
    bool nativeUrlIsValid(uintptr_t ptr);

    void *nativeVariantCreate();
    void *nativeVariantCreateWithValue(int typeVal, void *value);
    void nativeVariantSetValue(void *ptr, int typeVal, void *value);
    void nativeVariantDelete(void *ptr);
    bool nativeVariantIsValid(void *ptr);
    bool nativeVariantIsNull(void *ptr);
    int nativeVariantToInt(void *ptr);
    bool nativeVariantToBool(void *ptr);
    const char *nativeVariantToString(void *ptr);

    uintptr_t nativeSizeCreateWithWidth(int width, int height);
    void nativeSizeDelete(uintptr_t ptr);
    int nativeSizeWidth(uintptr_t ptr);
    int nativeSizeHeight(uintptr_t ptr);
    bool nativeSizeIsNull(uintptr_t ptr);
    bool nativeSizeIsEmpty(uintptr_t ptr);
    bool nativeSizeIsValid(uintptr_t ptr);

    uintptr_t nativeRectCreate(int x, int y, int width, int height);
    void nativeRectDelete(uintptr_t ptr);
    int nativeRectWidth(uintptr_t ptr);
    int nativeRectHeight(uintptr_t ptr);
    int nativeRectX(uintptr_t ptr);
    int nativeRectY(uintptr_t ptr);

    uintptr_t nativePointFCreate(double xpos, double ypos);
    void nativePointFDelete(uintptr_t ptr);
    bool nativePointFIsNull(uintptr_t ptr);
    double nativePointFManhattanLength(uintptr_t ptr);
    double nativePointFRx(uintptr_t ptr);
    double nativePointFRy(uintptr_t ptr);
    void nativePointFSetX(uintptr_t ptr, double x);
    void nativePointFSetY(uintptr_t ptr, double y);
    uintptr_t nativePointFToPoint(uintptr_t ptr);

    uintptr_t nativeStringListCreate();
    void nativeStringListDelete(uintptr_t ptr);
    void nativeStringListAppend(uintptr_t ptr, char *data);

    uintptr_t nativeModelIndexCreate();
    void nativeModelIndexDelete(uintptr_t ptr);
    bool nativeModelIndexIsValid(uintptr_t ptr);
}

static void timerTick(uintptr_t) {}

void run_core_tests()
{
    TEST_MODULE_BEGIN("core");

    // QTimer
    {
        uintptr_t timer = nativeTimerCreate(timerTick, 100);
        CHECK(timer != 0);
        nativeTimerStart(timer);
        nativeTimerStop(timer);
        nativeTimerDelete(timer);
        CHECK(true);
    }

    // QUrl
    {
        uintptr_t url = nativeUrlCreate("https://cangjie-lang.cn", 0);
        CHECK(url != 0);
        CHECK(nativeUrlIsValid(url));
        char *s = nativeUrlToString(url);
        CHECK_STR_CONTAINS(s, "cangjie-lang.cn");
        nativeUrlDelete(url);
    }

    // QVariant int
    {
        void *v = nativeVariantCreateWithValue(2, (void *)(intptr_t)42);
        CHECK(v != nullptr);
        CHECK(nativeVariantIsValid(v));
        CHECK_EQ_INT(nativeVariantToInt(v), 42);
        nativeVariantSetValue(v, 2, (void *)(intptr_t)99);
        CHECK_EQ_INT(nativeVariantToInt(v), 99);
        nativeVariantDelete(v);
    }

    // QVariant string
    {
        char buf[] = "hello cjqt";
        void *v = nativeVariantCreateWithValue(10, (void *)buf);
        CHECK(v != nullptr);
        const char *s = nativeVariantToString(v);
        CHECK_EQ_STR(s, "hello cjqt");
        nativeVariantDelete(v);
    }

    // QSize
    {
        uintptr_t size = nativeSizeCreateWithWidth(100, 200);
        CHECK(size != 0);
        CHECK_EQ_INT(nativeSizeWidth(size), 100);
        CHECK_EQ_INT(nativeSizeHeight(size), 200);
        CHECK(!nativeSizeIsNull(size));
        CHECK(!nativeSizeIsEmpty(size));
        CHECK(nativeSizeIsValid(size));
        nativeSizeDelete(size);
    }

    // QRect
    {
        uintptr_t rect = nativeRectCreate(10, 20, 100, 50);
        CHECK(rect != 0);
        CHECK_EQ_INT(nativeRectX(rect), 10);
        CHECK_EQ_INT(nativeRectY(rect), 20);
        CHECK_EQ_INT(nativeRectWidth(rect), 100);
        CHECK_EQ_INT(nativeRectHeight(rect), 50);
        nativeRectDelete(rect);
    }

    // QPointF
    {
        uintptr_t p = nativePointFCreate(3.5, 4.5);
        CHECK(p != 0);
        CHECK(!nativePointFIsNull(p));
        CHECK_EQ_INT((int)nativePointFRx(p), 3);
        CHECK_EQ_INT((int)nativePointFRy(p), 4);
        nativePointFSetX(p, 10.0);
        nativePointFSetY(p, 20.0);
        CHECK_EQ_INT((int)nativePointFRx(p), 10);
        CHECK_EQ_INT((int)nativePointFRy(p), 20);
        CHECK_EQ_INT((int)nativePointFManhattanLength(p), 30);
        uintptr_t ip = nativePointFToPoint(p);
        CHECK(ip != 0);
        nativePointFDelete(p);
    }

    // QStringList
    {
        uintptr_t list = nativeStringListCreate();
        CHECK(list != 0);
        char a[] = "alpha";
        char b[] = "beta";
        nativeStringListAppend(list, a);
        nativeStringListAppend(list, b);
        nativeStringListDelete(list);
        CHECK(true);
    }

    // QModelIndex
    {
        uintptr_t idx = nativeModelIndexCreate();
        CHECK(idx != 0);
        CHECK(!nativeModelIndexIsValid(idx));
        nativeModelIndexDelete(idx);
    }

    TEST_MODULE_END("core");
}

// ---- new core classes ----

extern "C"
{
    uintptr_t nativeByteArrayCreateFromString(const char *str);
    void nativeByteArrayDelete(uintptr_t ptr);
    int nativeByteArraySize(uintptr_t ptr);
    bool nativeByteArrayIsEmpty(uintptr_t ptr);
    char *nativeByteArrayToCString(uintptr_t ptr);
    void nativeByteArrayAppend(uintptr_t ptr, const char *data);
    void nativeByteArrayClear(uintptr_t ptr);
    bool nativeByteArrayContains(uintptr_t ptr, const char *data);

    uintptr_t nativeDataStreamCreate(uintptr_t byteArrayPtr, int mode);
    void nativeDataStreamDelete(uintptr_t ptr);
    void nativeDataStreamWriteInt(uintptr_t ptr, int value);
    int nativeDataStreamReadInt(uintptr_t ptr);
    void nativeDataStreamWriteString(uintptr_t ptr, const char *str);
    char *nativeDataStreamReadString(uintptr_t ptr);
    bool nativeDataStreamAtEnd(uintptr_t ptr);

    uintptr_t nativeTextStreamCreate(uintptr_t byteArrayPtr, int mode);
    void nativeTextStreamDelete(uintptr_t ptr);
    void nativeTextStreamWriteString(uintptr_t ptr, const char *str);
    char *nativeTextStreamReadLine(uintptr_t ptr);

    uintptr_t nativeJsonValueCreateString(const char *value);
    void nativeJsonValueDelete(uintptr_t ptr);
    bool nativeJsonValueIsString(uintptr_t ptr);
    char *nativeJsonValueToString(uintptr_t ptr);
    uintptr_t nativeJsonObjectCreate();
    void nativeJsonObjectDelete(uintptr_t ptr);
    void nativeJsonObjectInsert(uintptr_t ptr, const char *key, uintptr_t valuePtr);
    bool nativeJsonObjectContains(uintptr_t ptr, const char *key);
    char *nativeJsonObjectToString(uintptr_t ptr);
    uintptr_t nativeJsonObjectFromString(const char *str);
    int nativeJsonObjectSize(uintptr_t ptr);

    uintptr_t nativeTemporaryFileCreate();
    void nativeTemporaryFileDelete(uintptr_t ptr);
    bool nativeTemporaryFileOpen(uintptr_t ptr);
    char *nativeTemporaryFileFileName(uintptr_t ptr);

    uintptr_t nativeTemporaryDirCreate();
    void nativeTemporaryDirDelete(uintptr_t ptr);
    bool nativeTemporaryDirIsValid(uintptr_t ptr);
    char *nativeTemporaryDirPath(uintptr_t ptr);

    int nativeRandomGeneratorGlobalBounded(int highest);
    uintptr_t nativeThreadCurrentThreadId();
    int nativeThreadIdealThreadCount();

    uintptr_t nativeHashCreate(int algorithm);
    void nativeHashDelete(uintptr_t ptr);
    void nativeHashAddData(uintptr_t ptr, const char *data);
    char *nativeHashResult(uintptr_t ptr);
}

void run_core_new_tests()
{
    TEST_MODULE_BEGIN("core new");

    // QByteArray
    {
        uintptr_t ba = nativeByteArrayCreateFromString("hello");
        CHECK(ba != 0);
        CHECK_EQ_INT(nativeByteArraySize(ba), 5);
        CHECK(!nativeByteArrayIsEmpty(ba));
        CHECK_EQ_STR(nativeByteArrayToCString(ba), "hello");
        nativeByteArrayAppend(ba, " world");
        CHECK_EQ_INT(nativeByteArraySize(ba), 11);
        CHECK(nativeByteArrayContains(ba, "wor"));
        nativeByteArrayClear(ba);
        CHECK(nativeByteArrayIsEmpty(ba));
        nativeByteArrayDelete(ba);
    }

    // QDataStream roundtrip
    {
        uintptr_t ba = nativeByteArrayCreateFromString("");
        uintptr_t out = nativeDataStreamCreate(ba, 0x0002); // WriteOnly
        nativeDataStreamWriteInt(out, 42);
        nativeDataStreamWriteString(out, "cjqt");
        nativeDataStreamDelete(out);
        uintptr_t in = nativeDataStreamCreate(ba, 0x0001); // ReadOnly
        CHECK_EQ_INT(nativeDataStreamReadInt(in), 42);
        CHECK_EQ_STR(nativeDataStreamReadString(in), "cjqt");
        CHECK(nativeDataStreamAtEnd(in));
        nativeDataStreamDelete(in);
        nativeByteArrayDelete(ba);
    }

    // QTextStream
    {
        uintptr_t ba = nativeByteArrayCreateFromString("");
        uintptr_t ts = nativeTextStreamCreate(ba, 0x0002);
        nativeTextStreamWriteString(ts, "line1\n");
        nativeTextStreamDelete(ts);
        uintptr_t ts2 = nativeTextStreamCreate(ba, 0x0001);
        CHECK_EQ_STR(nativeTextStreamReadLine(ts2), "line1");
        nativeTextStreamDelete(ts2);
        nativeByteArrayDelete(ba);
    }

    // QJsonObject
    {
        uintptr_t obj = nativeJsonObjectCreate();
        uintptr_t val = nativeJsonValueCreateString("cjqt");
        nativeJsonObjectInsert(obj, "name", val);
        nativeJsonValueDelete(val);
        CHECK(nativeJsonObjectContains(obj, "name"));
        CHECK_EQ_INT(nativeJsonObjectSize(obj), 1);
        char *json = nativeJsonObjectToString(obj);
        CHECK_STR_CONTAINS(json, "cjqt");
        uintptr_t parsed = nativeJsonObjectFromString("{\"a\": 1}");
        CHECK(parsed != 0);
        nativeJsonObjectDelete(parsed);
        nativeJsonObjectDelete(obj);
    }

    // QTemporaryFile / QTemporaryDir
    {
        uintptr_t f = nativeTemporaryFileCreate();
        CHECK(nativeTemporaryFileOpen(f));
        char *name = nativeTemporaryFileFileName(f);
        CHECK(name != nullptr && strlen(name) > 0);
        nativeTemporaryFileDelete(f);
        uintptr_t d = nativeTemporaryDirCreate();
        CHECK(nativeTemporaryDirIsValid(d));
        char *dpath = nativeTemporaryDirPath(d);
        CHECK(dpath != nullptr && strlen(dpath) > 0);
        nativeTemporaryDirDelete(d);
    }

    // QRandomGenerator / QThread statics
    {
        int v = nativeRandomGeneratorGlobalBounded(100);
        CHECK(v >= 0 && v < 100);
        CHECK(nativeThreadCurrentThreadId() != 0);
        CHECK(nativeThreadIdealThreadCount() >= 1);
    }

    // QCryptographicHash
    {
        uintptr_t h = nativeHashCreate(1); // Md5 = 1
        nativeHashAddData(h, "hello");
        char *hex = nativeHashResult(h);
        CHECK_EQ_INT((int)strlen(hex), 32);
        nativeHashDelete(h);
    }

    TEST_MODULE_END("core new");
}
