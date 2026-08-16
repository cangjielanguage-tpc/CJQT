/*
 * CJQT native bindings: QLockFile, QPluginLoader, QIdentityProxyModel, QSignalMapper
 */
#include <QLockFile>
#include <QPluginLoader>
#include <QIdentityProxyModel>
#include <QSignalMapper>
#include "native_string.h"

extern "C"
{
    // ---- QLockFile ----

    uintptr_t nativeLockFileCreate(const char *path)
    {
        return reinterpret_cast<uintptr_t>(new QLockFile(QString::fromUtf8(path)));
    }

    void nativeLockFileDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QLockFile *>(static_cast<uintptr_t>(ptr));
    }

    bool nativeLockFileLock(uintptr_t ptr)
    {
        return reinterpret_cast<QLockFile *>(static_cast<uintptr_t>(ptr))->lock();
    }

    bool nativeLockFileTryLock(uintptr_t ptr, int timeout)
    {
        return reinterpret_cast<QLockFile *>(static_cast<uintptr_t>(ptr))->tryLock(timeout);
    }

    void nativeLockFileUnlock(uintptr_t ptr)
    {
        reinterpret_cast<QLockFile *>(static_cast<uintptr_t>(ptr))->unlock();
    }

    bool nativeLockFileIsLocked(uintptr_t ptr)
    {
        return reinterpret_cast<QLockFile *>(static_cast<uintptr_t>(ptr))->isLocked();
    }

    void nativeLockFileSetStaleLockTime(uintptr_t ptr, int ms)
    {
        reinterpret_cast<QLockFile *>(static_cast<uintptr_t>(ptr))->setStaleLockTime(ms);
    }

    void nativeLockFileRemoveStaleLockFile(uintptr_t ptr)
    {
        reinterpret_cast<QLockFile *>(static_cast<uintptr_t>(ptr))->removeStaleLockFile();
    }

    // ---- QPluginLoader ----

    uintptr_t nativePluginLoaderCreate(const char *fileName)
    {
        return reinterpret_cast<uintptr_t>(new QPluginLoader(QString::fromUtf8(fileName)));
    }

    void nativePluginLoaderDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QPluginLoader *>(static_cast<uintptr_t>(ptr));
    }

    bool nativePluginLoaderLoad(uintptr_t ptr)
    {
        return reinterpret_cast<QPluginLoader *>(static_cast<uintptr_t>(ptr))->load();
    }

    bool nativePluginLoaderUnload(uintptr_t ptr)
    {
        return reinterpret_cast<QPluginLoader *>(static_cast<uintptr_t>(ptr))->unload();
    }

    bool nativePluginLoaderIsLoaded(uintptr_t ptr)
    {
        return reinterpret_cast<QPluginLoader *>(static_cast<uintptr_t>(ptr))->isLoaded();
    }

    char *nativePluginLoaderFileName(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QPluginLoader *>(static_cast<uintptr_t>(ptr))->fileName());
    }

    char *nativePluginLoaderErrorString(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QPluginLoader *>(static_cast<uintptr_t>(ptr))->errorString());
    }

    // ---- QIdentityProxyModel ----

    uintptr_t nativeIdentityProxyModelCreate(uintptr_t parentPtr)
    {
        QObject *parent = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QIdentityProxyModel(parent));
    }

    void nativeIdentityProxyModelDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QIdentityProxyModel *>(static_cast<uintptr_t>(ptr));
    }

    void nativeIdentityProxyModelSetSourceModel(uintptr_t ptr, uintptr_t sourcePtr)
    {
        QAbstractItemModel *source = reinterpret_cast<QAbstractItemModel *>(static_cast<uintptr_t>(sourcePtr));
        reinterpret_cast<QIdentityProxyModel *>(static_cast<uintptr_t>(ptr))->setSourceModel(source);
    }

    // ---- QSignalMapper ----

    uintptr_t nativeSignalMapperCreate(uintptr_t parentPtr)
    {
        QObject *parent = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QSignalMapper(parent));
    }

    void nativeSignalMapperDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QSignalMapper *>(static_cast<uintptr_t>(ptr));
    }
}
