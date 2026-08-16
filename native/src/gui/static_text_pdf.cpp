/*
 * CJQT native bindings: QStaticText, QPdfWriter, QTextLayout
 */
#include <QStaticText>
#include <QPdfWriter>
#include <QTextLayout>
#include <QSizeF>
#include "native_string.h"

extern "C"
{
    // ---- QStaticText ----

    uintptr_t nativeStaticTextCreate()
    {
        return reinterpret_cast<uintptr_t>(new QStaticText());
    }

    uintptr_t nativeStaticTextCreateFromText(const char *text)
    {
        return reinterpret_cast<uintptr_t>(new QStaticText(QString::fromUtf8(text)));
    }

    void nativeStaticTextDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QStaticText *>(static_cast<uintptr_t>(ptr));
    }

    void nativeStaticTextSetText(uintptr_t ptr, const char *text)
    {
        reinterpret_cast<QStaticText *>(static_cast<uintptr_t>(ptr))->setText(QString::fromUtf8(text));
    }

    char *nativeStaticTextText(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QStaticText *>(static_cast<uintptr_t>(ptr))->text());
    }

    double nativeStaticTextWidth(uintptr_t ptr)
    {
        return reinterpret_cast<QStaticText *>(static_cast<uintptr_t>(ptr))->size().width();
    }

    double nativeStaticTextHeight(uintptr_t ptr)
    {
        return reinterpret_cast<QStaticText *>(static_cast<uintptr_t>(ptr))->size().height();
    }

    // ---- QPdfWriter ----

    uintptr_t nativePdfWriterCreate(const char *fileName)
    {
        return reinterpret_cast<uintptr_t>(new QPdfWriter(QString::fromUtf8(fileName)));
    }

    void nativePdfWriterDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QPdfWriter *>(static_cast<uintptr_t>(ptr));
    }

    void nativePdfWriterSetTitle(uintptr_t ptr, const char *title)
    {
        reinterpret_cast<QPdfWriter *>(static_cast<uintptr_t>(ptr))->setTitle(QString::fromUtf8(title));
    }

    void nativePdfWriterSetCreator(uintptr_t ptr, const char *creator)
    {
        reinterpret_cast<QPdfWriter *>(static_cast<uintptr_t>(ptr))->setCreator(QString::fromUtf8(creator));
    }

    int nativePdfWriterWidth(uintptr_t ptr)
    {
        return reinterpret_cast<QPdfWriter *>(static_cast<uintptr_t>(ptr))->width();
    }

    int nativePdfWriterHeight(uintptr_t ptr)
    {
        return reinterpret_cast<QPdfWriter *>(static_cast<uintptr_t>(ptr))->height();
    }

    // ---- QTextLayout ----

    uintptr_t nativeTextLayoutCreate(const char *text)
    {
        return reinterpret_cast<uintptr_t>(new QTextLayout(QString::fromUtf8(text)));
    }

    void nativeTextLayoutDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QTextLayout *>(static_cast<uintptr_t>(ptr));
    }

    char *nativeTextLayoutText(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QTextLayout *>(static_cast<uintptr_t>(ptr))->text());
    }

    void nativeTextLayoutSetFont(uintptr_t ptr, uintptr_t fontPtr)
    {
        QFont *font = reinterpret_cast<QFont *>(static_cast<uintptr_t>(fontPtr));
        reinterpret_cast<QTextLayout *>(static_cast<uintptr_t>(ptr))->setFont(*font);
    }

    void nativeTextLayoutSetText(uintptr_t ptr, const char *text)
    {
        reinterpret_cast<QTextLayout *>(static_cast<uintptr_t>(ptr))->setText(QString::fromUtf8(text));
    }
}
