#include "scroll_bar.h"

extern "C"
{
    long nativeScrollBarCreate(long parentPtr)
    {
        CjScrollBar *bar;
        if (parentPtr == 0L)
        {
            bar = new CjScrollBar();
        }
        else
        {

            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            bar = new CjScrollBar(parent);
        }
        return reinterpret_cast<long>(bar);
    }
    long nativeScrollBarCreateWithOrietation(short orientation, long parentPtr)
    {
        CjScrollBar *bar;
        if (parentPtr == 0L)
        {
            bar = new CjScrollBar(Qt::Orientation(orientation));
        }
        else
        {

            QWidget *parent = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
            bar = new CjScrollBar(Qt::Orientation(orientation), parent);
        }
        return reinterpret_cast<long>(bar);
    }

    void nativeScrollBarDelete(long ptr)
    {
        CjScrollBar *instance = reinterpret_cast<CjScrollBar *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
    bool nativeScrollBarEvent(long ptr, long eventPtr)
    {
        CjScrollBar *instance = reinterpret_cast<CjScrollBar *>(static_cast<uintptr_t>(ptr));
        QEvent *event = reinterpret_cast<QEvent *>(static_cast<uintptr_t>(eventPtr));
        return instance->event(event);
    }
    long nativeScrollBarSizeHint(long ptr)
    {
        CjScrollBar *instance = reinterpret_cast<CjScrollBar *>(static_cast<uintptr_t>(ptr));
        QSize size = instance->sizeHint();
        QSize *p = new QSize(size);
        return reinterpret_cast<long>(p);
    }
    // do event
    void nativeScrollBarPaintEvent(long ptr, long eventPtr)
    {
        CjScrollBar *instance = reinterpret_cast<CjScrollBar *>(static_cast<uintptr_t>(ptr));
        QPaintEvent *event = reinterpret_cast<QPaintEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doPaintEvent(event);
    }
    void nativeScrollBarHideEvent(long ptr, long eventPtr)
    {
        CjScrollBar *instance = reinterpret_cast<CjScrollBar *>(static_cast<uintptr_t>(ptr));
        QHideEvent *event = reinterpret_cast<QHideEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doHideEvent(event);
    }
    void nativeScrollBarMouseMoveEvent(long ptr, long eventPtr)
    {
        CjScrollBar *instance = reinterpret_cast<CjScrollBar *>(static_cast<uintptr_t>(ptr));
        QMouseEvent *event = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doMouseMoveEvent(event);
    }
    void nativeScrollBarMousePressEvent(long ptr, long eventPtr)
    {
        CjScrollBar *instance = reinterpret_cast<CjScrollBar *>(static_cast<uintptr_t>(ptr));
        QMouseEvent *event = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doMousePressEvent(event);
    }
    void nativeScrollBarMouseReleaseEvent(long ptr, long eventPtr)
    {
        CjScrollBar *instance = reinterpret_cast<CjScrollBar *>(static_cast<uintptr_t>(ptr));
        QMouseEvent *event = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doMouseReleaseEvent(event);
    }
    void nativeScrollBarWheelEvent(long ptr, long eventPtr)
    {
        CjScrollBar *instance = reinterpret_cast<CjScrollBar *>(static_cast<uintptr_t>(ptr));
        QWheelEvent *event = reinterpret_cast<QWheelEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doWheelEvent(event);
    }
    void nativeScrollBarContextMenuEvent(long ptr, long eventPtr)
    {
        CjScrollBar *instance = reinterpret_cast<CjScrollBar *>(static_cast<uintptr_t>(ptr));
        QContextMenuEvent *event = reinterpret_cast<QContextMenuEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doContextMenuEvent(event);
    }
}