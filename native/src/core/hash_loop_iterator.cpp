/*
 * CJQT native bindings: QCryptographicHash, QEventLoop, QDirIterator
 */
#include <QCryptographicHash>
#include <QEventLoop>
#include <QDirIterator>
#include <QStringList>
#include "native_string.h"

extern "C"
{
    // ---- QCryptographicHash ----

    uintptr_t nativeHashCreate(int algorithm)
    {
        return reinterpret_cast<uintptr_t>(new QCryptographicHash(static_cast<QCryptographicHash::Algorithm>(algorithm)));
    }

    void nativeHashDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QCryptographicHash *>(static_cast<uintptr_t>(ptr));
    }

    void nativeHashAddData(uintptr_t ptr, const char *data)
    {
        reinterpret_cast<QCryptographicHash *>(static_cast<uintptr_t>(ptr))->addData(data);
    }

    char *nativeHashResult(uintptr_t ptr)
    {
        QCryptographicHash *hash = reinterpret_cast<QCryptographicHash *>(static_cast<uintptr_t>(ptr));
        return cjqt_to_cstring(hash->result().toHex());
    }

    // ---- QEventLoop ----

    uintptr_t nativeEventLoopCreate(uintptr_t parentPtr)
    {
        QObject *parent = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QEventLoop(parent));
    }

    void nativeEventLoopDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QEventLoop *>(static_cast<uintptr_t>(ptr));
    }

    int nativeEventLoopExec(uintptr_t ptr)
    {
        return reinterpret_cast<QEventLoop *>(static_cast<uintptr_t>(ptr))->exec();
    }

    void nativeEventLoopExit(uintptr_t ptr, int code)
    {
        reinterpret_cast<QEventLoop *>(static_cast<uintptr_t>(ptr))->exit(code);
    }

    void nativeEventLoopQuit(uintptr_t ptr)
    {
        reinterpret_cast<QEventLoop *>(static_cast<uintptr_t>(ptr))->quit();
    }

    bool nativeEventLoopIsRunning(uintptr_t ptr)
    {
        return reinterpret_cast<QEventLoop *>(static_cast<uintptr_t>(ptr))->isRunning();
    }

    bool nativeEventLoopProcessEvents(uintptr_t ptr)
    {
        return reinterpret_cast<QEventLoop *>(static_cast<uintptr_t>(ptr))->processEvents();
    }

    // ---- QDirIterator ----

    uintptr_t nativeDirIteratorCreate(const char *path)
    {
        return reinterpret_cast<uintptr_t>(new QDirIterator(QString::fromUtf8(path)));
    }

    void nativeDirIteratorDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QDirIterator *>(static_cast<uintptr_t>(ptr));
    }

    bool nativeDirIteratorHasNext(uintptr_t ptr)
    {
        return reinterpret_cast<QDirIterator *>(static_cast<uintptr_t>(ptr))->hasNext();
    }

    char *nativeDirIteratorNext(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QDirIterator *>(static_cast<uintptr_t>(ptr))->next());
    }

    char *nativeDirIteratorFileName(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QDirIterator *>(static_cast<uintptr_t>(ptr))->fileName());
    }
}
