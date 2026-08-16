/*
 * CJQT native bindings: QSaveFile, QProcessEnvironment, QDeadlineTimer,
 * QCoreApplication, QTranslator, QSysInfo, QLibraryInfo, QTimeZone,
 * QSemaphore, QMutex, QPersistentModelIndex
 */
#include <QSaveFile>
#include <QProcessEnvironment>
#include <QDeadlineTimer>
#include <QCoreApplication>
#include <QTranslator>
#include <QSysInfo>
#include <QLibraryInfo>
#include <QTimeZone>
#include <QSemaphore>
#include <QMutex>
#include <QPersistentModelIndex>
#include <QStringList>
#include "native_string.h"

extern "C"
{
    // ---- QSaveFile ----

    uintptr_t nativeSaveFileCreate(const char *path)
    {
        return reinterpret_cast<uintptr_t>(new QSaveFile(QString::fromUtf8(path)));
    }

    void nativeSaveFileDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QSaveFile *>(static_cast<uintptr_t>(ptr));
    }

    bool nativeSaveFileOpen(uintptr_t ptr)
    {
        return reinterpret_cast<QSaveFile *>(static_cast<uintptr_t>(ptr))->open(QIODevice::WriteOnly);
    }

    intptr_t nativeSaveFileWrite(uintptr_t ptr, const char *data)
    {
        return reinterpret_cast<QSaveFile *>(static_cast<uintptr_t>(ptr))->write(data);
    }

    bool nativeSaveFileCommit(uintptr_t ptr)
    {
        return reinterpret_cast<QSaveFile *>(static_cast<uintptr_t>(ptr))->commit();
    }

    void nativeSaveFileCancelWriting(uintptr_t ptr)
    {
        reinterpret_cast<QSaveFile *>(static_cast<uintptr_t>(ptr))->cancelWriting();
    }

    char *nativeSaveFileFileName(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QSaveFile *>(static_cast<uintptr_t>(ptr))->fileName());
    }

    // ---- QProcessEnvironment ----

    uintptr_t nativeProcessEnvCreate()
    {
        return reinterpret_cast<uintptr_t>(new QProcessEnvironment());
    }

    uintptr_t nativeProcessEnvSystemEnvironment()
    {
        return reinterpret_cast<uintptr_t>(new QProcessEnvironment(QProcessEnvironment::systemEnvironment()));
    }

    void nativeProcessEnvDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QProcessEnvironment *>(static_cast<uintptr_t>(ptr));
    }

    bool nativeProcessEnvIsEmpty(uintptr_t ptr)
    {
        return reinterpret_cast<QProcessEnvironment *>(static_cast<uintptr_t>(ptr))->isEmpty();
    }

    bool nativeProcessEnvContains(uintptr_t ptr, const char *key)
    {
        return reinterpret_cast<QProcessEnvironment *>(static_cast<uintptr_t>(ptr))->contains(QString::fromUtf8(key));
    }

    char *nativeProcessEnvValue(uintptr_t ptr, const char *key)
    {
        return cjqt_to_cstring(reinterpret_cast<QProcessEnvironment *>(static_cast<uintptr_t>(ptr))->value(
            QString::fromUtf8(key)));
    }

    void nativeProcessEnvInsert(uintptr_t ptr, const char *key, const char *value)
    {
        reinterpret_cast<QProcessEnvironment *>(static_cast<uintptr_t>(ptr))->insert(QString::fromUtf8(key),
                                                                                    QString::fromUtf8(value));
    }

    void nativeProcessEnvRemove(uintptr_t ptr, const char *key)
    {
        reinterpret_cast<QProcessEnvironment *>(static_cast<uintptr_t>(ptr))->remove(QString::fromUtf8(key));
    }

    uintptr_t nativeProcessEnvKeys(uintptr_t ptr)
    {
        QProcessEnvironment *env = reinterpret_cast<QProcessEnvironment *>(static_cast<uintptr_t>(ptr));
        return reinterpret_cast<uintptr_t>(new QStringList(env->keys()));
    }

    // ---- QDeadlineTimer ----

    uintptr_t nativeDeadlineTimerCreate(intptr_t timeout)
    {
        return reinterpret_cast<uintptr_t>(new QDeadlineTimer(timeout));
    }

    uintptr_t nativeDeadlineTimerCreateForever()
    {
        return reinterpret_cast<uintptr_t>(new QDeadlineTimer(QDeadlineTimer::Forever));
    }

    void nativeDeadlineTimerDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QDeadlineTimer *>(static_cast<uintptr_t>(ptr));
    }

    intptr_t nativeDeadlineTimerRemainingTime(uintptr_t ptr)
    {
        return reinterpret_cast<QDeadlineTimer *>(static_cast<uintptr_t>(ptr))->remainingTime();
    }

    bool nativeDeadlineTimerHasExpired(uintptr_t ptr)
    {
        return reinterpret_cast<QDeadlineTimer *>(static_cast<uintptr_t>(ptr))->hasExpired();
    }

    bool nativeDeadlineTimerIsForever(uintptr_t ptr)
    {
        return reinterpret_cast<QDeadlineTimer *>(static_cast<uintptr_t>(ptr))->isForever();
    }

    void nativeDeadlineTimerSetRemainingTime(uintptr_t ptr, intptr_t msecs)
    {
        reinterpret_cast<QDeadlineTimer *>(static_cast<uintptr_t>(ptr))->setRemainingTime(msecs);
    }

    // ---- QCoreApplication ----

    char *nativeCoreAppApplicationName()
    {
        return cjqt_to_cstring(QCoreApplication::applicationName());
    }

    void nativeCoreAppSetApplicationName(const char *name)
    {
        QCoreApplication::setApplicationName(QString::fromUtf8(name));
    }

    char *nativeCoreAppApplicationDirPath()
    {
        return cjqt_to_cstring(QCoreApplication::applicationDirPath());
    }

    char *nativeCoreAppApplicationFilePath()
    {
        return cjqt_to_cstring(QCoreApplication::applicationFilePath());
    }

    char *nativeCoreAppApplicationVersion()
    {
        return cjqt_to_cstring(QCoreApplication::applicationVersion());
    }

    void nativeCoreAppSetApplicationVersion(const char *version)
    {
        QCoreApplication::setApplicationVersion(QString::fromUtf8(version));
    }

    void nativeCoreAppProcessEvents()
    {
        QCoreApplication::processEvents();
    }

    // ---- QTranslator ----

    uintptr_t nativeTranslatorCreate()
    {
        return reinterpret_cast<uintptr_t>(new QTranslator());
    }

    void nativeTranslatorDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QTranslator *>(static_cast<uintptr_t>(ptr));
    }

    bool nativeTranslatorLoad(uintptr_t ptr, const char *fileName)
    {
        return reinterpret_cast<QTranslator *>(static_cast<uintptr_t>(ptr))->load(QString::fromUtf8(fileName));
    }

    bool nativeTranslatorIsEmpty(uintptr_t ptr)
    {
        return reinterpret_cast<QTranslator *>(static_cast<uintptr_t>(ptr))->isEmpty();
    }

    // ---- QSysInfo ----

    char *nativeSysInfoMachineHostName()
    {
        return cjqt_to_cstring(QSysInfo::machineHostName());
    }

    char *nativeSysInfoProductType()
    {
        return cjqt_to_cstring(QSysInfo::productType());
    }

    char *nativeSysInfoProductVersion()
    {
        return cjqt_to_cstring(QSysInfo::productVersion());
    }

    char *nativeSysInfoKernelType()
    {
        return cjqt_to_cstring(QSysInfo::kernelType());
    }

    char *nativeSysInfoKernelVersion()
    {
        return cjqt_to_cstring(QSysInfo::kernelVersion());
    }

    int nativeSysInfoWordSize()
    {
        return QSysInfo::WordSize;
    }

    // ---- QLibraryInfo ----

    char *nativeLibraryInfoLocation(int location)
    {
        return cjqt_to_cstring(QLibraryInfo::location(static_cast<QLibraryInfo::LibraryLocation>(location)));
    }

    char *nativeLibraryInfoVersion()
    {
        return cjqt_to_cstring(QLibraryInfo::version().toString());
    }

    // ---- QTimeZone ----

    uintptr_t nativeTimeZoneCreate(const char *zoneId)
    {
        return reinterpret_cast<uintptr_t>(new QTimeZone(QByteArray(zoneId)));
    }

    uintptr_t nativeTimeZoneSystem()
    {
        return reinterpret_cast<uintptr_t>(new QTimeZone(QTimeZone::systemTimeZone()));
    }

    void nativeTimeZoneDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QTimeZone *>(static_cast<uintptr_t>(ptr));
    }

    bool nativeTimeZoneIsValid(uintptr_t ptr)
    {
        return reinterpret_cast<QTimeZone *>(static_cast<uintptr_t>(ptr))->isValid();
    }

    char *nativeTimeZoneId(uintptr_t ptr)
    {
        return cjqt_to_cstring(QString::fromUtf8(reinterpret_cast<QTimeZone *>(static_cast<uintptr_t>(ptr))->id()));
    }

    // ---- QSemaphore ----

    uintptr_t nativeSemaphoreCreate(int n)
    {
        return reinterpret_cast<uintptr_t>(new QSemaphore(n));
    }

    void nativeSemaphoreDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QSemaphore *>(static_cast<uintptr_t>(ptr));
    }

    void nativeSemaphoreAcquire(uintptr_t ptr, int n)
    {
        reinterpret_cast<QSemaphore *>(static_cast<uintptr_t>(ptr))->acquire(n);
    }

    bool nativeSemaphoreTryAcquire(uintptr_t ptr, int n)
    {
        return reinterpret_cast<QSemaphore *>(static_cast<uintptr_t>(ptr))->tryAcquire(n);
    }

    void nativeSemaphoreRelease(uintptr_t ptr, int n)
    {
        reinterpret_cast<QSemaphore *>(static_cast<uintptr_t>(ptr))->release(n);
    }

    int nativeSemaphoreAvailable(uintptr_t ptr)
    {
        return reinterpret_cast<QSemaphore *>(static_cast<uintptr_t>(ptr))->available();
    }

    // ---- QMutex ----

    uintptr_t nativeMutexCreate()
    {
        return reinterpret_cast<uintptr_t>(new QMutex());
    }

    void nativeMutexDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QMutex *>(static_cast<uintptr_t>(ptr));
    }

    void nativeMutexLock(uintptr_t ptr)
    {
        reinterpret_cast<QMutex *>(static_cast<uintptr_t>(ptr))->lock();
    }

    bool nativeMutexTryLock(uintptr_t ptr)
    {
        return reinterpret_cast<QMutex *>(static_cast<uintptr_t>(ptr))->tryLock();
    }

    void nativeMutexUnlock(uintptr_t ptr)
    {
        reinterpret_cast<QMutex *>(static_cast<uintptr_t>(ptr))->unlock();
    }

    // ---- QPersistentModelIndex ----

    uintptr_t nativePersistentIndexCreate(int row, int column)
    {
        return reinterpret_cast<uintptr_t>(new QPersistentModelIndex());
    }

    void nativePersistentIndexDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QPersistentModelIndex *>(static_cast<uintptr_t>(ptr));
    }

    int nativePersistentIndexRow(uintptr_t ptr)
    {
        return reinterpret_cast<QPersistentModelIndex *>(static_cast<uintptr_t>(ptr))->row();
    }

    int nativePersistentIndexColumn(uintptr_t ptr)
    {
        return reinterpret_cast<QPersistentModelIndex *>(static_cast<uintptr_t>(ptr))->column();
    }

    bool nativePersistentIndexIsValid(uintptr_t ptr)
    {
        return reinterpret_cast<QPersistentModelIndex *>(static_cast<uintptr_t>(ptr))->isValid();
    }
}
