/*
 * CJQT native bindings: QTextFormat, QPainterPathStroker
 */
#include <QTextFormat>
#include <QPainterPathStroker>
#include <QPainterPath>
#include "native_string.h"

extern "C"
{
    // ---- QTextFormat ----

    uintptr_t nativeTextFormatCreate()
    {
        return reinterpret_cast<uintptr_t>(new QTextFormat());
    }

    void nativeTextFormatDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QTextFormat *>(static_cast<uintptr_t>(ptr));
    }

    bool nativeTextFormatIsEmpty(uintptr_t ptr)
    {
        return reinterpret_cast<QTextFormat *>(static_cast<uintptr_t>(ptr))->isEmpty();
    }

    bool nativeTextFormatIsValid(uintptr_t ptr)
    {
        return reinterpret_cast<QTextFormat *>(static_cast<uintptr_t>(ptr))->isValid();
    }

    int nativeTextFormatType(uintptr_t ptr)
    {
        return static_cast<int>(reinterpret_cast<QTextFormat *>(static_cast<uintptr_t>(ptr))->type());
    }

    int nativeTextFormatObjectType(uintptr_t ptr)
    {
        return static_cast<int>(reinterpret_cast<QTextFormat *>(static_cast<uintptr_t>(ptr))->objectType());
    }

    void nativeTextFormatSetProperty(uintptr_t ptr, int propertyId, const char *value)
    {
        reinterpret_cast<QTextFormat *>(static_cast<uintptr_t>(ptr))->setProperty(propertyId,
                                                                                  QString::fromUtf8(value));
    }

    char *nativeTextFormatStringProperty(uintptr_t ptr, int propertyId)
    {
        return cjqt_to_cstring(reinterpret_cast<QTextFormat *>(static_cast<uintptr_t>(ptr))->stringProperty(propertyId));
    }

    void nativeTextFormatSetFontPointSize(uintptr_t ptr, double size)
    {
        reinterpret_cast<QTextFormat *>(static_cast<uintptr_t>(ptr))->setProperty(QTextFormat::FontPointSize, size);
    }

    double nativeTextFormatFontPointSize(uintptr_t ptr)
    {
        return reinterpret_cast<QTextFormat *>(static_cast<uintptr_t>(ptr))->doubleProperty(
            QTextFormat::FontPointSize);
    }

    // ---- QPainterPathStroker ----

    uintptr_t nativePainterPathStrokerCreate()
    {
        return reinterpret_cast<uintptr_t>(new QPainterPathStroker());
    }

    void nativePainterPathStrokerDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QPainterPathStroker *>(static_cast<uintptr_t>(ptr));
    }

    void nativePainterPathStrokerSetWidth(uintptr_t ptr, double width)
    {
        reinterpret_cast<QPainterPathStroker *>(static_cast<uintptr_t>(ptr))->setWidth(width);
    }

    double nativePainterPathStrokerWidth(uintptr_t ptr)
    {
        return reinterpret_cast<QPainterPathStroker *>(static_cast<uintptr_t>(ptr))->width();
    }

    uintptr_t nativePainterPathStrokerCreateStroke(uintptr_t ptr, uintptr_t pathPtr)
    {
        QPainterPath *path = reinterpret_cast<QPainterPath *>(static_cast<uintptr_t>(pathPtr));
        return reinterpret_cast<uintptr_t>(
            new QPainterPath(reinterpret_cast<QPainterPathStroker *>(static_cast<uintptr_t>(ptr))->createStroke(*path)));
    }
}
