/*
 * CJQT native bindings: QLocale, QLibrary, QMimeData
 */
#include <QLocale>
#include <QLibrary>
#include <QMimeData>
#include "native_string.h"

extern "C"
{
    // ---- QLocale ----

    uintptr_t nativeLocaleCreate(const char *language)
    {
        return reinterpret_cast<uintptr_t>(new QLocale(QString::fromUtf8(language)));
    }

    uintptr_t nativeLocaleSystem()
    {
        return reinterpret_cast<uintptr_t>(new QLocale(QLocale::system()));
    }

    void nativeLocaleDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QLocale *>(static_cast<uintptr_t>(ptr));
    }

    char *nativeLocaleName(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QLocale *>(static_cast<uintptr_t>(ptr))->name());
    }

    char *nativeLocaleLanguage(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QLocale *>(static_cast<uintptr_t>(ptr))->languageToString(
            reinterpret_cast<QLocale *>(static_cast<uintptr_t>(ptr))->language()));
    }

    char *nativeLocaleCountry(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QLocale *>(static_cast<uintptr_t>(ptr))->countryToString(
            reinterpret_cast<QLocale *>(static_cast<uintptr_t>(ptr))->country()));
    }

    char *nativeLocaleToString(uintptr_t ptr, double value, int precision)
    {
        return cjqt_to_cstring(reinterpret_cast<QLocale *>(static_cast<uintptr_t>(ptr))->toString(value, 'f', precision));
    }

    // ---- QLibrary ----

    uintptr_t nativeLibraryCreate(const char *fileName)
    {
        return reinterpret_cast<uintptr_t>(new QLibrary(QString::fromUtf8(fileName)));
    }

    void nativeLibraryDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QLibrary *>(static_cast<uintptr_t>(ptr));
    }

    bool nativeLibraryLoad(uintptr_t ptr)
    {
        return reinterpret_cast<QLibrary *>(static_cast<uintptr_t>(ptr))->load();
    }

    bool nativeLibraryUnload(uintptr_t ptr)
    {
        return reinterpret_cast<QLibrary *>(static_cast<uintptr_t>(ptr))->unload();
    }

    bool nativeLibraryIsLoaded(uintptr_t ptr)
    {
        return reinterpret_cast<QLibrary *>(static_cast<uintptr_t>(ptr))->isLoaded();
    }

    char *nativeLibraryFileName(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QLibrary *>(static_cast<uintptr_t>(ptr))->fileName());
    }

    void nativeLibrarySetFileName(uintptr_t ptr, const char *fileName)
    {
        reinterpret_cast<QLibrary *>(static_cast<uintptr_t>(ptr))->setFileName(QString::fromUtf8(fileName));
    }

    // ---- QMimeData ----

    uintptr_t nativeMimeDataCreate()
    {
        return reinterpret_cast<uintptr_t>(new QMimeData());
    }

    void nativeMimeDataDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QMimeData *>(static_cast<uintptr_t>(ptr));
    }

    bool nativeMimeDataHasText(uintptr_t ptr)
    {
        return reinterpret_cast<QMimeData *>(static_cast<uintptr_t>(ptr))->hasText();
    }

    char *nativeMimeDataText(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QMimeData *>(static_cast<uintptr_t>(ptr))->text());
    }

    void nativeMimeDataSetText(uintptr_t ptr, const char *text)
    {
        reinterpret_cast<QMimeData *>(static_cast<uintptr_t>(ptr))->setText(QString::fromUtf8(text));
    }

    bool nativeMimeDataHasUrls(uintptr_t ptr)
    {
        return reinterpret_cast<QMimeData *>(static_cast<uintptr_t>(ptr))->hasUrls();
    }

    char *nativeMimeDataFormats(uintptr_t ptr)
    {
        QMimeData *mime = reinterpret_cast<QMimeData *>(static_cast<uintptr_t>(ptr));
        return cjqt_to_cstring(mime->formats().join(","));
    }
}
