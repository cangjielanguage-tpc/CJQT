/*
 * CJQT native bindings: QDropEvent, QDragEnterEvent, QDragMoveEvent, QDragLeaveEvent
 */
#include <QDropEvent>
#include <QDragEnterEvent>
#include <QDragMoveEvent>
#include <QDragLeaveEvent>
#include <QMimeData>
#include <QPoint>
#include <QStringList>
#include "native_string.h"

extern "C"
{
    // ---- QDropEvent ----

    uintptr_t nativeDropEventCreate(int x, int y, uintptr_t mimePtr)
    {
        QMimeData *mime = reinterpret_cast<QMimeData *>(static_cast<uintptr_t>(mimePtr));
        return reinterpret_cast<uintptr_t>(new QDropEvent(QPointF(x, y), Qt::CopyAction, mime, Qt::LeftButton,
                                                         Qt::NoModifier));
    }

    void nativeDropEventDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QDropEvent *>(static_cast<uintptr_t>(ptr));
    }

    int nativeDropEventPosX(uintptr_t ptr)
    {
        return static_cast<int>(reinterpret_cast<QDropEvent *>(static_cast<uintptr_t>(ptr))->posF().x());
    }

    int nativeDropEventPosY(uintptr_t ptr)
    {
        return static_cast<int>(reinterpret_cast<QDropEvent *>(static_cast<uintptr_t>(ptr))->posF().y());
    }

    bool nativeDropEventHasFormat(uintptr_t ptr, const char *format)
    {
        return reinterpret_cast<QDropEvent *>(static_cast<uintptr_t>(ptr))->mimeData()->hasFormat(QString::fromUtf8(format));
    }

    char *nativeDropEventText(uintptr_t ptr)
    {
        const QMimeData *mime = reinterpret_cast<QDropEvent *>(static_cast<uintptr_t>(ptr))->mimeData();
        return cjqt_to_cstring(mime != nullptr ? mime->text() : QString());
    }

    // ---- QDragEnterEvent ----

    uintptr_t nativeDragEnterEventCreate(int x, int y, uintptr_t mimePtr)
    {
        QMimeData *mime = reinterpret_cast<QMimeData *>(static_cast<uintptr_t>(mimePtr));
        return reinterpret_cast<uintptr_t>(new QDragEnterEvent(QPoint(x, y), Qt::CopyAction, mime, Qt::LeftButton,
                                                              Qt::NoModifier));
    }

    void nativeDragEnterEventDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QDragEnterEvent *>(static_cast<uintptr_t>(ptr));
    }

    // ---- QDragMoveEvent ----

    uintptr_t nativeDragMoveEventCreate(int x, int y, uintptr_t mimePtr)
    {
        QMimeData *mime = reinterpret_cast<QMimeData *>(static_cast<uintptr_t>(mimePtr));
        return reinterpret_cast<uintptr_t>(new QDragMoveEvent(QPoint(x, y), Qt::CopyAction, mime, Qt::LeftButton,
                                                             Qt::NoModifier));
    }

    void nativeDragMoveEventDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QDragMoveEvent *>(static_cast<uintptr_t>(ptr));
    }

    void nativeDragMoveEventAccept(uintptr_t ptr)
    {
        reinterpret_cast<QDragMoveEvent *>(static_cast<uintptr_t>(ptr))->accept();
    }

    // ---- QDragLeaveEvent ----

    uintptr_t nativeDragLeaveEventCreate()
    {
        return reinterpret_cast<uintptr_t>(new QDragLeaveEvent());
    }

    void nativeDragLeaveEventDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QDragLeaveEvent *>(static_cast<uintptr_t>(ptr));
    }
}
