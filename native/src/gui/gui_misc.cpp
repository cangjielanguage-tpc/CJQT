/*
 * CJQT native bindings: QIntValidator, QKeySequence, QCursor, QClipboard
 */
#include <QIntValidator>
#include <QKeySequence>
#include <QCursor>
#include <QApplication>
#include <QClipboard>
#include "native_string.h"

extern "C"
{
    // ---- QIntValidator ----

    uintptr_t nativeIntValidatorCreate(int bottom, int top, uintptr_t parentPtr)
    {
        QObject *parent = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QIntValidator(bottom, top, parent));
    }

    void nativeIntValidatorDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QIntValidator *>(static_cast<uintptr_t>(ptr));
    }

    void nativeIntValidatorSetRange(uintptr_t ptr, int bottom, int top)
    {
        reinterpret_cast<QIntValidator *>(static_cast<uintptr_t>(ptr))->setRange(bottom, top);
    }

    int nativeIntValidatorBottom(uintptr_t ptr)
    {
        return reinterpret_cast<QIntValidator *>(static_cast<uintptr_t>(ptr))->bottom();
    }

    int nativeIntValidatorTop(uintptr_t ptr)
    {
        return reinterpret_cast<QIntValidator *>(static_cast<uintptr_t>(ptr))->top();
    }

    int nativeIntValidatorValidate(uintptr_t ptr, const char *input, int pos)
    {
        QString text = QString::fromUtf8(input);
        int p = pos;
        return static_cast<int>(reinterpret_cast<QIntValidator *>(static_cast<uintptr_t>(ptr))->validate(text, p));
    }

    // ---- QKeySequence ----

    uintptr_t nativeKeySequenceCreate(const char *str)
    {
        return reinterpret_cast<uintptr_t>(new QKeySequence(QString::fromUtf8(str)));
    }

    void nativeKeySequenceDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QKeySequence *>(static_cast<uintptr_t>(ptr));
    }

    char *nativeKeySequenceToString(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QKeySequence *>(static_cast<uintptr_t>(ptr))->toString());
    }

    bool nativeKeySequenceIsEmpty(uintptr_t ptr)
    {
        return reinterpret_cast<QKeySequence *>(static_cast<uintptr_t>(ptr))->isEmpty();
    }

    int nativeKeySequenceCount(uintptr_t ptr)
    {
        return reinterpret_cast<QKeySequence *>(static_cast<uintptr_t>(ptr))->count();
    }

    // ---- QCursor ----

    uintptr_t nativeCursorCreate()
    {
        return reinterpret_cast<uintptr_t>(new QCursor());
    }

    uintptr_t nativeCursorCreateWithShape(int shape)
    {
        return reinterpret_cast<uintptr_t>(new QCursor(static_cast<Qt::CursorShape>(shape)));
    }

    void nativeCursorDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QCursor *>(static_cast<uintptr_t>(ptr));
    }

    int nativeCursorShape(uintptr_t ptr)
    {
        return static_cast<int>(reinterpret_cast<QCursor *>(static_cast<uintptr_t>(ptr))->shape());
    }

    int nativeCursorPosX()
    {
        return QCursor::pos().x();
    }

    int nativeCursorPosY()
    {
        return QCursor::pos().y();
    }

    void nativeCursorSetPos(int x, int y)
    {
        QCursor::setPos(x, y);
    }

    // ---- QClipboard ----

    char *nativeClipboardText()
    {
        if (QApplication::clipboard() == nullptr)
        {
            return cjqt_to_cstring(QString());
        }
        return cjqt_to_cstring(QApplication::clipboard()->text());
    }

    void nativeClipboardSetText(const char *text)
    {
        if (QApplication::clipboard() != nullptr)
        {
            QApplication::clipboard()->setText(QString::fromUtf8(text));
        }
    }

    void nativeClipboardClear()
    {
        if (QApplication::clipboard() != nullptr)
        {
            QApplication::clipboard()->clear();
        }
    }
}
