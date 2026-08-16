/*
 * CJQT native bindings: QVersionNumber, QMimeType
 */
#include <QVersionNumber>
#include <QMimeType>
#include <QStringList>
#include "native_string.h"

extern "C"
{
    // ---- QVersionNumber ----

    uintptr_t nativeVersionNumberCreate(int major, int minor, int patch)
    {
        return reinterpret_cast<uintptr_t>(new QVersionNumber(major, minor, patch));
    }

    uintptr_t nativeVersionNumberFromString(const char *str)
    {
        return reinterpret_cast<uintptr_t>(new QVersionNumber(QVersionNumber::fromString(QString::fromUtf8(str))));
    }

    void nativeVersionNumberDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QVersionNumber *>(static_cast<uintptr_t>(ptr));
    }

    int nativeVersionNumberMajor(uintptr_t ptr)
    {
        return reinterpret_cast<QVersionNumber *>(static_cast<uintptr_t>(ptr))->majorVersion();
    }

    int nativeVersionNumberMinor(uintptr_t ptr)
    {
        return reinterpret_cast<QVersionNumber *>(static_cast<uintptr_t>(ptr))->minorVersion();
    }

    int nativeVersionNumberPatch(uintptr_t ptr)
    {
        QVersionNumber *v = reinterpret_cast<QVersionNumber *>(static_cast<uintptr_t>(ptr));
        return v->segmentCount() > 2 ? v->segmentAt(2) : 0;
    }

    char *nativeVersionNumberToString(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QVersionNumber *>(static_cast<uintptr_t>(ptr))->toString());
    }

    bool nativeVersionNumberIsNull(uintptr_t ptr)
    {
        return reinterpret_cast<QVersionNumber *>(static_cast<uintptr_t>(ptr))->isNull();
    }

    // ---- QMimeType ----

    uintptr_t nativeMimeTypeCreate()
    {
        return reinterpret_cast<uintptr_t>(new QMimeType());
    }

    void nativeMimeTypeDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QMimeType *>(static_cast<uintptr_t>(ptr));
    }

    bool nativeMimeTypeIsValid(uintptr_t ptr)
    {
        return reinterpret_cast<QMimeType *>(static_cast<uintptr_t>(ptr))->isValid();
    }

    bool nativeMimeTypeIsDefault(uintptr_t ptr)
    {
        return reinterpret_cast<QMimeType *>(static_cast<uintptr_t>(ptr))->isDefault();
    }

    char *nativeMimeTypeName(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QMimeType *>(static_cast<uintptr_t>(ptr))->name());
    }

    char *nativeMimeTypeComment(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QMimeType *>(static_cast<uintptr_t>(ptr))->comment());
    }

    uintptr_t nativeMimeTypeSuffixes(uintptr_t ptr)
    {
        QMimeType *mime = reinterpret_cast<QMimeType *>(static_cast<uintptr_t>(ptr));
        return reinterpret_cast<uintptr_t>(new QStringList(mime->suffixes()));
    }
}
