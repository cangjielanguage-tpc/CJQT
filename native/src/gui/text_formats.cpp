/*
 * CJQT native bindings: QTextCharFormat, QTextBlockFormat, QTextDocumentFragment
 */
#include <QTextCharFormat>
#include <QTextBlockFormat>
#include <QTextDocumentFragment>
#include "native_string.h"

extern "C"
{
    // ---- QTextCharFormat ----

    uintptr_t nativeCharFormatCreate()
    {
        return reinterpret_cast<uintptr_t>(new QTextCharFormat());
    }

    void nativeCharFormatDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QTextCharFormat *>(static_cast<uintptr_t>(ptr));
    }

    void nativeCharFormatSetFontWeight(uintptr_t ptr, int weight)
    {
        reinterpret_cast<QTextCharFormat *>(static_cast<uintptr_t>(ptr))->setFontWeight(weight);
    }

    int nativeCharFormatFontWeight(uintptr_t ptr)
    {
        return reinterpret_cast<QTextCharFormat *>(static_cast<uintptr_t>(ptr))->fontWeight();
    }

    void nativeCharFormatSetFontItalic(uintptr_t ptr, bool b)
    {
        reinterpret_cast<QTextCharFormat *>(static_cast<uintptr_t>(ptr))->setFontItalic(b);
    }

    bool nativeCharFormatFontItalic(uintptr_t ptr)
    {
        return reinterpret_cast<QTextCharFormat *>(static_cast<uintptr_t>(ptr))->fontItalic();
    }

    void nativeCharFormatSetFontUnderline(uintptr_t ptr, bool b)
    {
        reinterpret_cast<QTextCharFormat *>(static_cast<uintptr_t>(ptr))->setFontUnderline(b);
    }

    bool nativeCharFormatFontUnderline(uintptr_t ptr)
    {
        return reinterpret_cast<QTextCharFormat *>(static_cast<uintptr_t>(ptr))->fontUnderline();
    }

    void nativeCharFormatSetFontPointSize(uintptr_t ptr, double size)
    {
        reinterpret_cast<QTextCharFormat *>(static_cast<uintptr_t>(ptr))->setFontPointSize(size);
    }

    double nativeCharFormatFontPointSize(uintptr_t ptr)
    {
        return reinterpret_cast<QTextCharFormat *>(static_cast<uintptr_t>(ptr))->fontPointSize();
    }

    // ---- QTextBlockFormat ----

    uintptr_t nativeBlockFormatCreate()
    {
        return reinterpret_cast<uintptr_t>(new QTextBlockFormat());
    }

    void nativeBlockFormatDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QTextBlockFormat *>(static_cast<uintptr_t>(ptr));
    }

    void nativeBlockFormatSetAlignment(uintptr_t ptr, int alignment)
    {
        reinterpret_cast<QTextBlockFormat *>(static_cast<uintptr_t>(ptr))->setAlignment(
            static_cast<Qt::Alignment>(alignment));
    }

    int nativeBlockFormatAlignment(uintptr_t ptr)
    {
        return static_cast<int>(reinterpret_cast<QTextBlockFormat *>(static_cast<uintptr_t>(ptr))->alignment());
    }

    void nativeBlockFormatSetTopMargin(uintptr_t ptr, double margin)
    {
        reinterpret_cast<QTextBlockFormat *>(static_cast<uintptr_t>(ptr))->setTopMargin(margin);
    }

    double nativeBlockFormatTopMargin(uintptr_t ptr)
    {
        return reinterpret_cast<QTextBlockFormat *>(static_cast<uintptr_t>(ptr))->topMargin();
    }

    // ---- QTextDocumentFragment ----

    uintptr_t nativeTextDocumentFragmentCreate(const char *text)
    {
        return reinterpret_cast<uintptr_t>(new QTextDocumentFragment(QTextDocumentFragment::fromPlainText(QString::fromUtf8(text))));
    }

    void nativeTextDocumentFragmentDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QTextDocumentFragment *>(static_cast<uintptr_t>(ptr));
    }

    char *nativeTextDocumentFragmentToPlainText(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QTextDocumentFragment *>(static_cast<uintptr_t>(ptr))->toPlainText());
    }

    char *nativeTextDocumentFragmentToHtml(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QTextDocumentFragment *>(static_cast<uintptr_t>(ptr))->toHtml());
    }
}
