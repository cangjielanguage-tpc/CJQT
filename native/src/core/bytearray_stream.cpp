/*
 * CJQT native bindings: QByteArray, QDataStream, QTextStream
 */
#include <QByteArray>
#include <QDataStream>
#include <QTextStream>
#include "native_string.h"

extern "C"
{
    // ---- QByteArray ----

    uintptr_t nativeByteArrayCreate()
    {
        return reinterpret_cast<uintptr_t>(new QByteArray());
    }

    uintptr_t nativeByteArrayCreateFromString(const char *str)
    {
        return reinterpret_cast<uintptr_t>(new QByteArray(str));
    }

    void nativeByteArrayDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QByteArray *>(static_cast<uintptr_t>(ptr));
    }

    int nativeByteArraySize(uintptr_t ptr)
    {
        return reinterpret_cast<QByteArray *>(static_cast<uintptr_t>(ptr))->size();
    }

    bool nativeByteArrayIsEmpty(uintptr_t ptr)
    {
        return reinterpret_cast<QByteArray *>(static_cast<uintptr_t>(ptr))->isEmpty();
    }

    char *nativeByteArrayToCString(uintptr_t ptr)
    {
        return cjqt_to_cstring(*reinterpret_cast<QByteArray *>(static_cast<uintptr_t>(ptr)));
    }

    char nativeByteArrayAt(uintptr_t ptr, int index)
    {
        return reinterpret_cast<QByteArray *>(static_cast<uintptr_t>(ptr))->at(index);
    }

    void nativeByteArrayAppend(uintptr_t ptr, const char *data)
    {
        reinterpret_cast<QByteArray *>(static_cast<uintptr_t>(ptr))->append(data);
    }

    void nativeByteArrayPrepend(uintptr_t ptr, const char *data)
    {
        reinterpret_cast<QByteArray *>(static_cast<uintptr_t>(ptr))->prepend(data);
    }

    void nativeByteArrayClear(uintptr_t ptr)
    {
        reinterpret_cast<QByteArray *>(static_cast<uintptr_t>(ptr))->clear();
    }

    bool nativeByteArrayContains(uintptr_t ptr, const char *data)
    {
        return reinterpret_cast<QByteArray *>(static_cast<uintptr_t>(ptr))->contains(data);
    }

    int nativeByteArrayIndexOf(uintptr_t ptr, const char *data)
    {
        return reinterpret_cast<QByteArray *>(static_cast<uintptr_t>(ptr))->indexOf(data);
    }

    // ---- QDataStream (over QByteArray) ----

    uintptr_t nativeDataStreamCreate(uintptr_t byteArrayPtr, int mode)
    {
        QByteArray *ba = reinterpret_cast<QByteArray *>(static_cast<uintptr_t>(byteArrayPtr));
        return reinterpret_cast<uintptr_t>(new QDataStream(ba, static_cast<QIODevice::OpenMode>(mode)));
    }

    void nativeDataStreamDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QDataStream *>(static_cast<uintptr_t>(ptr));
    }

    void nativeDataStreamWriteInt(uintptr_t ptr, int value)
    {
        (*reinterpret_cast<QDataStream *>(static_cast<uintptr_t>(ptr))) << value;
    }

    int nativeDataStreamReadInt(uintptr_t ptr)
    {
        int value = 0;
        (*reinterpret_cast<QDataStream *>(static_cast<uintptr_t>(ptr))) >> value;
        return value;
    }

    void nativeDataStreamWriteString(uintptr_t ptr, const char *str)
    {
        (*reinterpret_cast<QDataStream *>(static_cast<uintptr_t>(ptr))) << QString::fromUtf8(str);
    }

    char *nativeDataStreamReadString(uintptr_t ptr)
    {
        QString str;
        (*reinterpret_cast<QDataStream *>(static_cast<uintptr_t>(ptr))) >> str;
        return cjqt_to_cstring(str);
    }

    void nativeDataStreamWriteDouble(uintptr_t ptr, double value)
    {
        (*reinterpret_cast<QDataStream *>(static_cast<uintptr_t>(ptr))) << value;
    }

    double nativeDataStreamReadDouble(uintptr_t ptr)
    {
        double value = 0.0;
        (*reinterpret_cast<QDataStream *>(static_cast<uintptr_t>(ptr))) >> value;
        return value;
    }

    bool nativeDataStreamAtEnd(uintptr_t ptr)
    {
        return reinterpret_cast<QDataStream *>(static_cast<uintptr_t>(ptr))->atEnd();
    }

    // ---- QTextStream (over QByteArray) ----

    uintptr_t nativeTextStreamCreate(uintptr_t byteArrayPtr, int mode)
    {
        QByteArray *ba = reinterpret_cast<QByteArray *>(static_cast<uintptr_t>(byteArrayPtr));
        return reinterpret_cast<uintptr_t>(new QTextStream(ba, static_cast<QIODevice::OpenMode>(mode)));
    }

    void nativeTextStreamDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QTextStream *>(static_cast<uintptr_t>(ptr));
    }

    void nativeTextStreamWriteString(uintptr_t ptr, const char *str)
    {
        (*reinterpret_cast<QTextStream *>(static_cast<uintptr_t>(ptr))) << QString::fromUtf8(str);
    }

    char *nativeTextStreamReadLine(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QTextStream *>(static_cast<uintptr_t>(ptr))->readLine());
    }

    char *nativeTextStreamReadAll(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QTextStream *>(static_cast<uintptr_t>(ptr))->readAll());
    }

    bool nativeTextStreamAtEnd(uintptr_t ptr)
    {
        return reinterpret_cast<QTextStream *>(static_cast<uintptr_t>(ptr))->atEnd();
    }
}
