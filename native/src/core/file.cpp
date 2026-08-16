/*
 * CJQT native bindings: QFile, QFileInfo, QDir
 */
#include <QFile>
#include <QFileInfo>
#include <QDir>
#include "native_string.h"

extern "C"
{
    // ---- QFile ----

    uintptr_t nativeFileCreate(const char *path)
    {
        return reinterpret_cast<uintptr_t>(new QFile(QString::fromUtf8(path)));
    }

    void nativeFileDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QFile *>(static_cast<uintptr_t>(ptr));
    }

    bool nativeFileExists(uintptr_t ptr)
    {
        return reinterpret_cast<QFile *>(static_cast<uintptr_t>(ptr))->exists();
    }

    bool nativeFileOpen(uintptr_t ptr, int mode)
    {
        return reinterpret_cast<QFile *>(static_cast<uintptr_t>(ptr))->open(static_cast<QIODevice::OpenMode>(mode));
    }

    void nativeFileClose(uintptr_t ptr)
    {
        reinterpret_cast<QFile *>(static_cast<uintptr_t>(ptr))->close();
    }

    bool nativeFileIsOpen(uintptr_t ptr)
    {
        return reinterpret_cast<QFile *>(static_cast<uintptr_t>(ptr))->isOpen();
    }

    bool nativeFileFlush(uintptr_t ptr)
    {
        return reinterpret_cast<QFile *>(static_cast<uintptr_t>(ptr))->flush();
    }

    char *nativeFileReadAll(uintptr_t ptr)
    {
        QFile *file = reinterpret_cast<QFile *>(static_cast<uintptr_t>(ptr));
        return cjqt_to_cstring(file->readAll());
    }

    intptr_t nativeFileWrite(uintptr_t ptr, const char *data, int length)
    {
        QFile *file = reinterpret_cast<QFile *>(static_cast<uintptr_t>(ptr));
        return file->write(data, static_cast<int64_t>(length));
    }

    intptr_t nativeFileSize(uintptr_t ptr)
    {
        return reinterpret_cast<QFile *>(static_cast<uintptr_t>(ptr))->size();
    }

    char *nativeFileFileName(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QFile *>(static_cast<uintptr_t>(ptr))->fileName());
    }

    bool nativeFileRemove(uintptr_t ptr)
    {
        return QFile::remove(reinterpret_cast<QFile *>(static_cast<uintptr_t>(ptr))->fileName());
    }

    bool nativeFileRename(uintptr_t ptr, const char *newName)
    {
        return QFile::rename(reinterpret_cast<QFile *>(static_cast<uintptr_t>(ptr))->fileName(),
                             QString::fromUtf8(newName));
    }

    bool nativeFileExistsPath(const char *path)
    {
        return QFile::exists(QString::fromUtf8(path));
    }

    bool nativeFileRemovePath(const char *path)
    {
        return QFile::remove(QString::fromUtf8(path));
    }

    // ---- QFileInfo ----

    uintptr_t nativeFileInfoCreate(const char *path)
    {
        return reinterpret_cast<uintptr_t>(new QFileInfo(QString::fromUtf8(path)));
    }

    void nativeFileInfoDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QFileInfo *>(static_cast<uintptr_t>(ptr));
    }

    bool nativeFileInfoExists(uintptr_t ptr)
    {
        return reinterpret_cast<QFileInfo *>(static_cast<uintptr_t>(ptr))->exists();
    }

    char *nativeFileInfoFilePath(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QFileInfo *>(static_cast<uintptr_t>(ptr))->filePath());
    }

    char *nativeFileInfoFileName(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QFileInfo *>(static_cast<uintptr_t>(ptr))->fileName());
    }

    char *nativeFileInfoAbsoluteFilePath(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QFileInfo *>(static_cast<uintptr_t>(ptr))->absoluteFilePath());
    }

    bool nativeFileInfoIsDir(uintptr_t ptr)
    {
        return reinterpret_cast<QFileInfo *>(static_cast<uintptr_t>(ptr))->isDir();
    }

    bool nativeFileInfoIsFile(uintptr_t ptr)
    {
        return reinterpret_cast<QFileInfo *>(static_cast<uintptr_t>(ptr))->isFile();
    }

    bool nativeFileInfoIsReadable(uintptr_t ptr)
    {
        return reinterpret_cast<QFileInfo *>(static_cast<uintptr_t>(ptr))->isReadable();
    }

    bool nativeFileInfoIsWritable(uintptr_t ptr)
    {
        return reinterpret_cast<QFileInfo *>(static_cast<uintptr_t>(ptr))->isWritable();
    }

    intptr_t nativeFileInfoSize(uintptr_t ptr)
    {
        return reinterpret_cast<QFileInfo *>(static_cast<uintptr_t>(ptr))->size();
    }

    char *nativeFileInfoSuffix(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QFileInfo *>(static_cast<uintptr_t>(ptr))->suffix());
    }

    char *nativeFileInfoCompleteSuffix(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QFileInfo *>(static_cast<uintptr_t>(ptr))->completeSuffix());
    }

    // ---- QDir ----

    uintptr_t nativeDirCreate(const char *path)
    {
        return reinterpret_cast<uintptr_t>(new QDir(QString::fromUtf8(path)));
    }

    void nativeDirDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QDir *>(static_cast<uintptr_t>(ptr));
    }

    bool nativeDirExists(uintptr_t ptr)
    {
        return reinterpret_cast<QDir *>(static_cast<uintptr_t>(ptr))->exists();
    }

    char *nativeDirPath(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QDir *>(static_cast<uintptr_t>(ptr))->path());
    }

    char *nativeDirAbsolutePath(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QDir *>(static_cast<uintptr_t>(ptr))->absolutePath());
    }

    bool nativeDirMakePath(uintptr_t ptr, const char *dirPath)
    {
        return reinterpret_cast<QDir *>(static_cast<uintptr_t>(ptr))->mkpath(QString::fromUtf8(dirPath));
    }

    bool nativeDirRemove(uintptr_t ptr, const char *fileName)
    {
        return reinterpret_cast<QDir *>(static_cast<uintptr_t>(ptr))->remove(QString::fromUtf8(fileName));
    }

    bool nativeDirRemoveRecursively(uintptr_t ptr)
    {
        return reinterpret_cast<QDir *>(static_cast<uintptr_t>(ptr))->removeRecursively();
    }

    bool nativeDirIsEmpty(uintptr_t ptr)
    {
        return reinterpret_cast<QDir *>(static_cast<uintptr_t>(ptr))->isEmpty();
    }

    int nativeDirEntryCount(uintptr_t ptr)
    {
        return reinterpret_cast<QDir *>(static_cast<uintptr_t>(ptr))->entryList().size();
    }

    uintptr_t nativeDirEntryList(uintptr_t ptr)
    {
        QDir *dir = reinterpret_cast<QDir *>(static_cast<uintptr_t>(ptr));
        return reinterpret_cast<uintptr_t>(new QStringList(dir->entryList()));
    }
}
