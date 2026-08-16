/*
 * CJQT native bindings: QFontDatabase, QFontInfo, QPixmapCache, QDesktopServices, QMovie
 */
#include <QFontDatabase>
#include <QFontInfo>
#include <QPixmapCache>
#include <QDesktopServices>
#include <QMovie>
#include <QUrl>
#include <QStringList>
#include "native_string.h"

extern "C"
{
    // ---- QFontDatabase (static) ----

    uintptr_t nativeFontDatabaseFamilies()
    {
        QFontDatabase db;
        return reinterpret_cast<uintptr_t>(new QStringList(db.families()));
    }

    uintptr_t nativeFontDatabasePointSizes(const char *family)
    {
        QFontDatabase db;
        QStringList sizes;
        const QList<int> points = db.pointSizes(QString::fromUtf8(family));
        for (int size : points)
        {
            sizes << QString::number(size);
        }
        return reinterpret_cast<uintptr_t>(new QStringList(sizes));
    }

    bool nativeFontDatabaseIsFixedPitch(const char *family)
    {
        QFontDatabase db;
        return db.isFixedPitch(QString::fromUtf8(family));
    }

    bool nativeFontDatabaseIsBold(const char *family)
    {
        QFontDatabase db;
        return db.bold(QString::fromUtf8(family), QString());
    }

    // ---- QFontInfo ----

    uintptr_t nativeFontInfoCreate(uintptr_t fontPtr)
    {
        QFont *font = reinterpret_cast<QFont *>(static_cast<uintptr_t>(fontPtr));
        return reinterpret_cast<uintptr_t>(new QFontInfo(*font));
    }

    void nativeFontInfoDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QFontInfo *>(static_cast<uintptr_t>(ptr));
    }

    char *nativeFontInfoFamily(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QFontInfo *>(static_cast<uintptr_t>(ptr))->family());
    }

    int nativeFontInfoPointSize(uintptr_t ptr)
    {
        return reinterpret_cast<QFontInfo *>(static_cast<uintptr_t>(ptr))->pointSize();
    }

    int nativeFontInfoPixelSize(uintptr_t ptr)
    {
        return reinterpret_cast<QFontInfo *>(static_cast<uintptr_t>(ptr))->pixelSize();
    }

    bool nativeFontInfoBold(uintptr_t ptr)
    {
        return reinterpret_cast<QFontInfo *>(static_cast<uintptr_t>(ptr))->bold();
    }

    bool nativeFontInfoItalic(uintptr_t ptr)
    {
        return reinterpret_cast<QFontInfo *>(static_cast<uintptr_t>(ptr))->italic();
    }

    // ---- QPixmapCache (static) ----

    bool nativePixmapCacheInsert(const char *key, uintptr_t pixmapPtr)
    {
        QPixmap *pixmap = reinterpret_cast<QPixmap *>(static_cast<uintptr_t>(pixmapPtr));
        return QPixmapCache::insert(QString::fromUtf8(key), *pixmap);
    }

    void nativePixmapCacheRemove(const char *key)
    {
        QPixmapCache::remove(QString::fromUtf8(key));
    }

    void nativePixmapCacheClear()
    {
        QPixmapCache::clear();
    }

    int nativePixmapCacheCacheLimit()
    {
        return QPixmapCache::cacheLimit();
    }

    void nativePixmapCacheSetCacheLimit(int limit)
    {
        QPixmapCache::setCacheLimit(limit);
    }

    // ---- QDesktopServices (static) ----

    bool nativeDesktopServicesOpenUrl(const char *url)
    {
        return QDesktopServices::openUrl(QUrl(QString::fromUtf8(url)));
    }

    // ---- QMovie ----

    uintptr_t nativeMovieCreate()
    {
        return reinterpret_cast<uintptr_t>(new QMovie());
    }

    uintptr_t nativeMovieCreateFromFile(const char *path)
    {
        return reinterpret_cast<uintptr_t>(new QMovie(QString::fromUtf8(path)));
    }

    void nativeMovieDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QMovie *>(static_cast<uintptr_t>(ptr));
    }

    void nativeMovieStart(uintptr_t ptr)
    {
        reinterpret_cast<QMovie *>(static_cast<uintptr_t>(ptr))->start();
    }

    void nativeMovieStop(uintptr_t ptr)
    {
        reinterpret_cast<QMovie *>(static_cast<uintptr_t>(ptr))->stop();
    }

    void nativeMovieSetPaused(uintptr_t ptr, bool paused)
    {
        reinterpret_cast<QMovie *>(static_cast<uintptr_t>(ptr))->setPaused(paused);
    }

    bool nativeMovieIsRunning(uintptr_t ptr)
    {
        return reinterpret_cast<QMovie *>(static_cast<uintptr_t>(ptr))->state() == QMovie::Running;
    }

    int nativeMovieFrameCount(uintptr_t ptr)
    {
        return reinterpret_cast<QMovie *>(static_cast<uintptr_t>(ptr))->frameCount();
    }

    int nativeMovieCurrentFrameNumber(uintptr_t ptr)
    {
        return reinterpret_cast<QMovie *>(static_cast<uintptr_t>(ptr))->currentFrameNumber();
    }

    char *nativeMovieFileName(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QMovie *>(static_cast<uintptr_t>(ptr))->fileName());
    }

    void nativeMovieSetFileName(uintptr_t ptr, const char *path)
    {
        reinterpret_cast<QMovie *>(static_cast<uintptr_t>(ptr))->setFileName(QString::fromUtf8(path));
    }
}
