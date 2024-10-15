#include "text_edit.h"

extern "C"
{

    // QTextEdit

    uintptr_t nativeTextEditCreate(uintptr_t parentPtr)
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
        return reinterpret_cast<uintptr_t>(textEdit);
    }

    void nativeTextEditAppend(uintptr_t ptr, const char *text)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
        instance->append(text);
    }

    void nativeTextEditSetFontFamily(uintptr_t ptr, const char *fontFamily)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
        instance->setFontFamily(fontFamily);
    }

    void nativeTextEditSetPlainText(uintptr_t ptr, const char *plainText)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
        instance->setPlainText(plainText);
    }

    void nativeTextEditSetHtml(uintptr_t ptr, const char *html)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
        instance->setHtml(html);
    }

    void nativeTextEditSetMarkdown(uintptr_t ptr, const char *markdown)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
        instance->setMarkdown(markdown);
    }

    void nativeTextEditSetText(uintptr_t ptr, const char *text)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
        instance->setText(text);
    }

    const char *nativeTextEditToPlainText(uintptr_t ptr)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
        QString str = instance->toPlainText();
        return qstrdup(str.toUtf8());
    }

    const char *nativeTextEditToHtml(uintptr_t ptr)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
        QString str = instance->toHtml();
        return qstrdup(str.toUtf8());
    }

    const char *nativeTextEditToMarkdown(uintptr_t ptr)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
        QString str = instance->toMarkdown();
        return qstrdup(str.toUtf8());
    }

    void nativeTextEditSetFontWeight(uintptr_t ptr, int fontWeight)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
        instance->setFontWeight(fontWeight);
    }

    void nativeTextEditSetFontUnderline(uintptr_t ptr, bool fontUnderline)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
        instance->setFontUnderline(fontUnderline);
    }

    void nativeTextEditSetFontItalic(uintptr_t ptr, bool fontItalic)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
        instance->setFontItalic(fontItalic);
    }

    void nativeTextEditSetCurrentFont(uintptr_t ptr, uintptr_t fontPtr)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
        QFont *font = reinterpret_cast<QFont *>(static_cast<uintptr_t>(fontPtr));
        instance->setCurrentFont(*font);
    }

    void nativeTextEditSetTextColor(uintptr_t ptr, uintptr_t colorPtr)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
        QColor *color = reinterpret_cast<QColor *>(static_cast<uintptr_t>(colorPtr));
        instance->setTextColor(*color);
    }

    void nativeTextEditSetTextBackgroundColor(uintptr_t ptr, uintptr_t colorPtr)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
        QColor *color = reinterpret_cast<QColor *>(static_cast<uintptr_t>(colorPtr));
        instance->setTextBackgroundColor(*color);
    }

    void nativeTextEditDelete(uintptr_t ptr)
    {
        CjTextEdit *instance = reinterpret_cast<CjTextEdit *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativeTextEditCopy(uintptr_t ptr)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
#if QT_CONFIG(clipboard)
        instance->copy();
#endif
    }

    void nativeTextEditCut(uintptr_t ptr)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
#if QT_CONFIG(clipboard)
        instance->cut();
#endif
    }

    void nativeTextEditPaste(uintptr_t ptr)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
#if QT_CONFIG(clipboard)
        instance->paste();
#endif
    }

    void nativeTextEditUndo(uintptr_t ptr)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
        instance->undo();
    }

    void nativeTextEditRedo(uintptr_t ptr)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
        instance->redo();
    }

    bool nativeTextEditIsReadOnly(uintptr_t ptr)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
        return instance->isReadOnly();
    }

    void nativeTextEditSetReadOnly(uintptr_t ptr, bool b)
    {
        QTextEdit *instance = reinterpret_cast<QTextEdit *>(static_cast<uintptr_t>(ptr));
        return instance->setReadOnly(b);
    }
}
