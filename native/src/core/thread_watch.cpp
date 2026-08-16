/*
 * CJQT native bindings: QThread, QFileSystemWatcher, QTemporaryFile, QTemporaryDir
 */
#include <QThread>
#include <QFileSystemWatcher>
#include <QTemporaryFile>
#include <QTemporaryDir>
#include <QStringList>
#include "native_string.h"

extern "C"
{
    // ---- QThread ----

    uintptr_t nativeThreadCreate()
    {
        return reinterpret_cast<uintptr_t>(new QThread());
    }

    void nativeThreadDelete(uintptr_t ptr)
    {
        QThread *thread = reinterpret_cast<QThread *>(static_cast<uintptr_t>(ptr));
        thread->quit();
        thread->wait();
        delete thread;
    }

    void nativeThreadStart(uintptr_t ptr)
    {
        reinterpret_cast<QThread *>(static_cast<uintptr_t>(ptr))->start();
    }

    bool nativeThreadWait(uintptr_t ptr, int msecs)
    {
        return reinterpret_cast<QThread *>(static_cast<uintptr_t>(ptr))->wait(msecs);
    }

    bool nativeThreadIsRunning(uintptr_t ptr)
    {
        return reinterpret_cast<QThread *>(static_cast<uintptr_t>(ptr))->isRunning();
    }

    bool nativeThreadIsFinished(uintptr_t ptr)
    {
        return reinterpret_cast<QThread *>(static_cast<uintptr_t>(ptr))->isFinished();
    }

    void nativeThreadQuit(uintptr_t ptr)
    {
        reinterpret_cast<QThread *>(static_cast<uintptr_t>(ptr))->quit();
    }

    void nativeThreadSleep(int secs)
    {
        QThread::sleep(static_cast<unsigned long>(secs));
    }

    void nativeThreadMsleep(int msecs)
    {
        QThread::msleep(static_cast<unsigned long>(msecs));
    }

    uintptr_t nativeThreadCurrentThreadId()
    {
        return reinterpret_cast<uintptr_t>(QThread::currentThreadId());
    }

    int nativeThreadIdealThreadCount()
    {
        return QThread::idealThreadCount();
    }

    // ---- QFileSystemWatcher ----

    uintptr_t nativeFileSystemWatcherCreate()
    {
        return reinterpret_cast<uintptr_t>(new QFileSystemWatcher());
    }

    void nativeFileSystemWatcherDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QFileSystemWatcher *>(static_cast<uintptr_t>(ptr));
    }

    bool nativeFileSystemWatcherAddPath(uintptr_t ptr, const char *path)
    {
        return reinterpret_cast<QFileSystemWatcher *>(static_cast<uintptr_t>(ptr))->addPath(QString::fromUtf8(path));
    }

    bool nativeFileSystemWatcherRemovePath(uintptr_t ptr, const char *path)
    {
        return reinterpret_cast<QFileSystemWatcher *>(static_cast<uintptr_t>(ptr))->removePath(QString::fromUtf8(path));
    }

    uintptr_t nativeFileSystemWatcherFiles(uintptr_t ptr)
    {
        QFileSystemWatcher *watcher = reinterpret_cast<QFileSystemWatcher *>(static_cast<uintptr_t>(ptr));
        return reinterpret_cast<uintptr_t>(new QStringList(watcher->files()));
    }

    uintptr_t nativeFileSystemWatcherDirectories(uintptr_t ptr)
    {
        QFileSystemWatcher *watcher = reinterpret_cast<QFileSystemWatcher *>(static_cast<uintptr_t>(ptr));
        return reinterpret_cast<uintptr_t>(new QStringList(watcher->directories()));
    }

    // ---- QTemporaryFile ----

    uintptr_t nativeTemporaryFileCreate()
    {
        return reinterpret_cast<uintptr_t>(new QTemporaryFile());
    }

    void nativeTemporaryFileDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QTemporaryFile *>(static_cast<uintptr_t>(ptr));
    }

    bool nativeTemporaryFileOpen(uintptr_t ptr)
    {
        return reinterpret_cast<QTemporaryFile *>(static_cast<uintptr_t>(ptr))->open();
    }

    char *nativeTemporaryFileFileName(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QTemporaryFile *>(static_cast<uintptr_t>(ptr))->fileName());
    }

    intptr_t nativeTemporaryFileWrite(uintptr_t ptr, const char *data)
    {
        return reinterpret_cast<QTemporaryFile *>(static_cast<uintptr_t>(ptr))->write(data);
    }

    char *nativeTemporaryFileReadAll(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QTemporaryFile *>(static_cast<uintptr_t>(ptr))->readAll());
    }

    bool nativeTemporaryFileAutoRemove(uintptr_t ptr)
    {
        return reinterpret_cast<QTemporaryFile *>(static_cast<uintptr_t>(ptr))->autoRemove();
    }

    void nativeTemporaryFileSetAutoRemove(uintptr_t ptr, bool b)
    {
        reinterpret_cast<QTemporaryFile *>(static_cast<uintptr_t>(ptr))->setAutoRemove(b);
    }

    // ---- QTemporaryDir ----

    uintptr_t nativeTemporaryDirCreate()
    {
        return reinterpret_cast<uintptr_t>(new QTemporaryDir());
    }

    void nativeTemporaryDirDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QTemporaryDir *>(static_cast<uintptr_t>(ptr));
    }

    bool nativeTemporaryDirIsValid(uintptr_t ptr)
    {
        return reinterpret_cast<QTemporaryDir *>(static_cast<uintptr_t>(ptr))->isValid();
    }

    char *nativeTemporaryDirPath(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QTemporaryDir *>(static_cast<uintptr_t>(ptr))->path());
    }

    bool nativeTemporaryDirAutoRemove(uintptr_t ptr)
    {
        return reinterpret_cast<QTemporaryDir *>(static_cast<uintptr_t>(ptr))->autoRemove();
    }

    void nativeTemporaryDirSetAutoRemove(uintptr_t ptr, bool b)
    {
        reinterpret_cast<QTemporaryDir *>(static_cast<uintptr_t>(ptr))->setAutoRemove(b);
    }
}
