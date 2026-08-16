/*
 * CJQT native bindings: QUndoStack, QUndoCommand
 */
#include <QUndoStack>
#include <QUndoCommand>
#include "object.h"
#include "native_string.h"

extern "C"
{
    // ---- QUndoStack ----

    uintptr_t nativeUndoStackCreate(uintptr_t parentPtr)
    {
        QObject *parent = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
        return reinterpret_cast<uintptr_t>(new QUndoStack(parent));
    }

    void nativeUndoStackDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QUndoStack *>(static_cast<uintptr_t>(ptr));
    }

    void nativeUndoStackUndo(uintptr_t ptr)
    {
        reinterpret_cast<QUndoStack *>(static_cast<uintptr_t>(ptr))->undo();
    }

    void nativeUndoStackRedo(uintptr_t ptr)
    {
        reinterpret_cast<QUndoStack *>(static_cast<uintptr_t>(ptr))->redo();
    }

    int nativeUndoStackCount(uintptr_t ptr)
    {
        return reinterpret_cast<QUndoStack *>(static_cast<uintptr_t>(ptr))->count();
    }

    bool nativeUndoStackCanUndo(uintptr_t ptr)
    {
        return reinterpret_cast<QUndoStack *>(static_cast<uintptr_t>(ptr))->canUndo();
    }

    bool nativeUndoStackCanRedo(uintptr_t ptr)
    {
        return reinterpret_cast<QUndoStack *>(static_cast<uintptr_t>(ptr))->canRedo();
    }

    bool nativeUndoStackIsClean(uintptr_t ptr)
    {
        return reinterpret_cast<QUndoStack *>(static_cast<uintptr_t>(ptr))->isClean();
    }

    void nativeUndoStackClear(uintptr_t ptr)
    {
        reinterpret_cast<QUndoStack *>(static_cast<uintptr_t>(ptr))->clear();
    }

    // ---- QUndoCommand ----

    uintptr_t nativeUndoCommandCreate(const char *text)
    {
        return reinterpret_cast<uintptr_t>(new QUndoCommand(QString::fromUtf8(text)));
    }

    void nativeUndoCommandDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QUndoCommand *>(static_cast<uintptr_t>(ptr));
    }

    void nativeUndoCommandSetText(uintptr_t ptr, const char *text)
    {
        reinterpret_cast<QUndoCommand *>(static_cast<uintptr_t>(ptr))->setText(QString::fromUtf8(text));
    }

    char *nativeUndoCommandText(uintptr_t ptr)
    {
        return cjqt_to_cstring(reinterpret_cast<QUndoCommand *>(static_cast<uintptr_t>(ptr))->text());
    }

    int nativeUndoCommandChildCount(uintptr_t ptr)
    {
        return reinterpret_cast<QUndoCommand *>(static_cast<uintptr_t>(ptr))->childCount();
    }
}
