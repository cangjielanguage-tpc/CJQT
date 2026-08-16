/*
 * CJQT native bindings: QResizeEvent, QMoveEvent, QShowEvent, QCloseEvent,
 * QHoverEvent, QDrag
 */
#include <QResizeEvent>
#include <QMoveEvent>
#include <QShowEvent>
#include <QCloseEvent>
#include <QHoverEvent>
#include <QDrag>
#include <QWidget>
#include <QSize>
#include <QPoint>
#include "native_string.h"

extern "C"
{
    // ---- QResizeEvent ----

    uintptr_t nativeResizeEventCreate(int w1, int h1, int w2, int h2)
    {
        return reinterpret_cast<uintptr_t>(new QResizeEvent(QSize(w1, h1), QSize(w2, h2)));
    }

    void nativeResizeEventDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QResizeEvent *>(static_cast<uintptr_t>(ptr));
    }

    int nativeResizeEventWidth(uintptr_t ptr)
    {
        return reinterpret_cast<QResizeEvent *>(static_cast<uintptr_t>(ptr))->size().width();
    }

    int nativeResizeEventHeight(uintptr_t ptr)
    {
        return reinterpret_cast<QResizeEvent *>(static_cast<uintptr_t>(ptr))->size().height();
    }

    int nativeResizeEventOldWidth(uintptr_t ptr)
    {
        return reinterpret_cast<QResizeEvent *>(static_cast<uintptr_t>(ptr))->oldSize().width();
    }

    int nativeResizeEventOldHeight(uintptr_t ptr)
    {
        return reinterpret_cast<QResizeEvent *>(static_cast<uintptr_t>(ptr))->oldSize().height();
    }

    // ---- QMoveEvent ----

    uintptr_t nativeMoveEventCreate(int x, int y, int ox, int oy)
    {
        return reinterpret_cast<uintptr_t>(new QMoveEvent(QPoint(x, y), QPoint(ox, oy)));
    }

    void nativeMoveEventDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QMoveEvent *>(static_cast<uintptr_t>(ptr));
    }

    int nativeMoveEventX(uintptr_t ptr)
    {
        return reinterpret_cast<QMoveEvent *>(static_cast<uintptr_t>(ptr))->pos().x();
    }

    int nativeMoveEventY(uintptr_t ptr)
    {
        return reinterpret_cast<QMoveEvent *>(static_cast<uintptr_t>(ptr))->pos().y();
    }

    int nativeMoveEventOldX(uintptr_t ptr)
    {
        return reinterpret_cast<QMoveEvent *>(static_cast<uintptr_t>(ptr))->oldPos().x();
    }

    int nativeMoveEventOldY(uintptr_t ptr)
    {
        return reinterpret_cast<QMoveEvent *>(static_cast<uintptr_t>(ptr))->oldPos().y();
    }

    // ---- QShowEvent ----

    uintptr_t nativeShowEventCreate()
    {
        return reinterpret_cast<uintptr_t>(new QShowEvent());
    }

    void nativeShowEventDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QShowEvent *>(static_cast<uintptr_t>(ptr));
    }

    // ---- QCloseEvent ----

    uintptr_t nativeCloseEventCreate()
    {
        return reinterpret_cast<uintptr_t>(new QCloseEvent());
    }

    void nativeCloseEventDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QCloseEvent *>(static_cast<uintptr_t>(ptr));
    }

    bool nativeCloseEventIsAccepted(uintptr_t ptr)
    {
        return reinterpret_cast<QCloseEvent *>(static_cast<uintptr_t>(ptr))->isAccepted();
    }

    // ---- QHoverEvent ----

    uintptr_t nativeHoverEventCreate(int x, int y)
    {
        return reinterpret_cast<uintptr_t>(new QHoverEvent(QEvent::HoverMove, QPointF(x, y), QPointF(x, y)));
    }

    void nativeHoverEventDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QHoverEvent *>(static_cast<uintptr_t>(ptr));
    }

    int nativeHoverEventX(uintptr_t ptr)
    {
        return static_cast<int>(reinterpret_cast<QHoverEvent *>(static_cast<uintptr_t>(ptr))->posF().x());
    }

    int nativeHoverEventY(uintptr_t ptr)
    {
        return static_cast<int>(reinterpret_cast<QHoverEvent *>(static_cast<uintptr_t>(ptr))->posF().y());
    }

    // ---- QDrag ----

    uintptr_t nativeDragCreate(uintptr_t widgetPtr)
    {
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));
        return reinterpret_cast<uintptr_t>(new QDrag(widget));
    }

    void nativeDragDelete(uintptr_t ptr)
    {
        delete reinterpret_cast<QDrag *>(static_cast<uintptr_t>(ptr));
    }

    void nativeDragSetMimeData(uintptr_t ptr, uintptr_t mimePtr)
    {
        QMimeData *mime = reinterpret_cast<QMimeData *>(static_cast<uintptr_t>(mimePtr));
        reinterpret_cast<QDrag *>(static_cast<uintptr_t>(ptr))->setMimeData(mime);
    }
}
