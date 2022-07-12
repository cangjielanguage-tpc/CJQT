#include "text_edit.h"

extern "C"
{

    // QTextEdit

    long nativeTextEditCreate(long parentPtr)
    {
        APPLICATION_CREATE
        CjTextEdit *textEdit;
        if (parentPtr == 0L)
        {
            textEdit = new CjTextEdit();
        }
        else
        {
            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            textEdit = new CjTextEdit(parent);
        }
        return reinterpret_cast<long>(textEdit);
    }

    void nativeTextEditAppend(long ptr, const char *text)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
        instance->append(text);
    }

    void nativeTextEditSetFontFamily(long ptr, const char *fontFamily)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
        instance->setFontFamily(fontFamily);
    }

    void nativeTextEditSetPlainText(long ptr, const char *plainText)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
        instance->setPlainText(plainText);
    }

    void nativeTextEditSetHtml(long ptr, const char *html)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
        instance->setHtml(html);
    }

    void nativeTextEditSetMarkdown(long ptr, const char *markdown)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
        instance->setMarkdown(markdown);
    }

    void nativeTextEditSetText(long ptr, const char *text)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
        instance->setText(text);
    }

    void nativeTextEditSetFontWeight(long ptr, int fontWeight)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
        instance->setFontWeight(fontWeight);
    }

    void nativeTextEditSetFontUnderline(long ptr, bool fontUnderline)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
        instance->setFontUnderline(fontUnderline);
    }

    void nativeTextEditSetFontItalic(long ptr, bool fontItalic)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
        instance->setFontItalic(fontItalic);
    }

    void nativeTextEditSetCurrentFont(long ptr, long fontPtr)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
        QFont *font = reinterpret_cast<QFont *>(static_cast<uintptr_t>(fontPtr));
        instance->setCurrentFont(*font);
    }

    void nativeTextEditSetTextColor(long ptr, long colorPtr)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
        QColor *color = reinterpret_cast<QColor *>(static_cast<uintptr_t>(colorPtr));
        instance->setTextColor(*color);
    }

    void nativeTextEditSetTextBackgroundColor(long ptr, long colorPtr)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
        QColor *color = reinterpret_cast<QColor *>(static_cast<uintptr_t>(colorPtr));
        instance->setTextBackgroundColor(*color);
    }

    void nativeTextEditDelete(long ptr)
    {
        CjTextEdit *instance = reinterpret_cast<CjTextEdit *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}