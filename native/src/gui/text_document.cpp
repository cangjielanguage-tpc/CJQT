/*
 * CJQT native bindings: QTextDocument, QTextCursor, QRegularExpressionValidator
 */
#include <QTextDocument>
#include <QTextCursor>
#include <QRegularExpressionValidator>
#include "native_string.h"

extern "C"
{
    // ---- QTextDocument ----

    uintptr_t nativeTextDocumentCreate()
    {
        return reinterpret_cast<uintptr_t>(new QTextDocument());
    }

    uintptr_t nativeTextDocumentCreateFromString(const char *text)
    {
        return reinterpret_cast<uintptr_t>(new QTextDocument(QString::fromUtf8(text)));
    }

    void nativeTextDocumentDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QTextDocument *>(static_cast<uintptr_t>(ptr));
    }

    char *nativeTextDocumentToPlainText(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QTextDocument *>(static_cast<uintptr_t>(ptr))->toPlainText());
    }

    char *nativeTextDocumentToHtml(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QTextDocument *>(static_cast<uintptr_t>(ptr))->toHtml());
    }

    void nativeTextDocumentSetPlainText(uintptr_t ptr, const char *text)
    {
        reinterpret_cast<QTextDocument *>(static_cast<uintptr_t>(ptr))->setPlainText(QString::fromUtf8(text));
    }

    void nativeTextDocumentSetHtml(uintptr_t ptr, const char *html)
    {
        reinterpret_cast<QTextDocument *>(static_cast<uintptr_t>(ptr))->setHtml(QString::fromUtf8(html));
    }

    bool nativeTextDocumentIsModified(uintptr_t ptr)
    {
        return reinterpret_cast<QTextDocument *>(static_cast<uintptr_t>(ptr))->isModified();
    }

    void nativeTextDocumentSetModified(uintptr_t ptr, bool b)
    {
        reinterpret_cast<QTextDocument *>(static_cast<uintptr_t>(ptr))->setModified(b);
    }

    int nativeTextDocumentCharacterCount(uintptr_t ptr)
    {
        return reinterpret_cast<QTextDocument *>(static_cast<uintptr_t>(ptr))->characterCount();
    }

    int nativeTextDocumentBlockCount(uintptr_t ptr)
    {
        return reinterpret_cast<QTextDocument *>(static_cast<uintptr_t>(ptr))->blockCount();
    }

    // ---- QTextCursor ----

    uintptr_t nativeTextCursorCreate(uintptr_t docPtr)
    {
        QTextDocument *doc = reinterpret_cast<QTextDocument *>(static_cast<uintptr_t>(docPtr));
        return reinterpret_cast<uintptr_t>(new QTextCursor(doc));
    }

    void nativeTextCursorDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QTextCursor *>(static_cast<uintptr_t>(ptr));
    }

    void nativeTextCursorInsertText(uintptr_t ptr, const char *text)
    {
        reinterpret_cast<QTextCursor *>(static_cast<uintptr_t>(ptr))->insertText(QString::fromUtf8(text));
    }

    int nativeTextCursorPosition(uintptr_t ptr)
    {
        return reinterpret_cast<QTextCursor *>(static_cast<uintptr_t>(ptr))->position();
    }

    void nativeTextCursorSetPosition(uintptr_t ptr, int pos)
    {
        reinterpret_cast<QTextCursor *>(static_cast<uintptr_t>(ptr))->setPosition(pos);
    }

    void nativeTextCursorSelectAll(uintptr_t ptr)
    {
        reinterpret_cast<QTextCursor *>(static_cast<uintptr_t>(ptr))->select(QTextCursor::Document);
    }

    void nativeTextCursorClearSelection(uintptr_t ptr)
    {
        reinterpret_cast<QTextCursor *>(static_cast<uintptr_t>(ptr))->clearSelection();
    }

    bool nativeTextCursorHasSelection(uintptr_t ptr)
    {
        return reinterpret_cast<QTextCursor *>(static_cast<uintptr_t>(ptr))->hasSelection();
    }

    // ---- QRegularExpressionValidator ----

    uintptr_t nativeRegexValidatorCreate(const char *pattern, uintptr_t parentPtr)
    {
        QObject *parent = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QRegularExpressionValidator(QRegularExpression(QString::fromUtf8(pattern)),
                                                                           parent));
    }

    void nativeRegexValidatorDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QRegularExpressionValidator *>(static_cast<uintptr_t>(ptr));
    }

    int nativeRegexValidatorValidate(uintptr_t ptr, const char *input, int pos)
    {
        QString text = QString::fromUtf8(input);
        int p = pos;
        return static_cast<int>(reinterpret_cast<QRegularExpressionValidator *>(static_cast<uintptr_t>(ptr))->validate(
            text, p));
    }
}
