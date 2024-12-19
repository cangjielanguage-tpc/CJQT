#include "scroll_bar.h"

extern "C"
{
    uintptr_t nativeScrollBarCreate(uintptr_t parentPtr)
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
        return reinterpret_cast<uintptr_t>(bar);
    }
    uintptr_t nativeScrollBarCreateWithOrietation(short orientation, uintptr_t parentPtr)
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
        return reinterpret_cast<uintptr_t>(bar);
    }

    void nativeScrollBarDelete(uintptr_t ptr)
    {
        CjScrollBar *instance = reinterpret_cast<CjScrollBar *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
    bool nativeScrollBarEvent(uintptr_t ptr, uintptr_t eventPtr)
    {
        CjScrollBar *instance = reinterpret_cast<CjScrollBar *>(static_cast<uintptr_t>(ptr));
        QEvent *event = reinterpret_cast<QEvent *>(static_cast<uintptr_t>(eventPtr));
        return instance->event(event);
    }
    QSize nativeScrollBarSizeHint(uintptr_t ptr)
    {
        CjScrollBar *instance = reinterpret_cast<CjScrollBar *>(static_cast<uintptr_t>(ptr));
        // QSize size = instance->sizeHint();
        // QSize *p = new QSize(size);
        return instance->sizeHint();
    }
    // do event
    void nativeScrollBarPaintEvent(uintptr_t ptr, uintptr_t eventPtr)
    {
        CjScrollBar *instance = reinterpret_cast<CjScrollBar *>(static_cast<uintptr_t>(ptr));
        QPaintEvent *event = reinterpret_cast<QPaintEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doPaintEvent(event);
    }
    void nativeScrollBarHideEvent(uintptr_t ptr, uintptr_t eventPtr)
    {
        CjScrollBar *instance = reinterpret_cast<CjScrollBar *>(static_cast<uintptr_t>(ptr));
        QHideEvent *event = reinterpret_cast<QHideEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doHideEvent(event);
    }
    void nativeScrollBarMouseMoveEvent(uintptr_t ptr, uintptr_t eventPtr)
    {
        CjScrollBar *instance = reinterpret_cast<CjScrollBar *>(static_cast<uintptr_t>(ptr));
        QMouseEvent *event = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doMouseMoveEvent(event);
    }
    void nativeScrollBarMousePressEvent(uintptr_t ptr, uintptr_t eventPtr)
    {
        CjScrollBar *instance = reinterpret_cast<CjScrollBar *>(static_cast<uintptr_t>(ptr));
        QMouseEvent *event = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doMousePressEvent(event);
    }
    void nativeScrollBarMouseReleaseEvent(uintptr_t ptr, uintptr_t eventPtr)
    {
        CjScrollBar *instance = reinterpret_cast<CjScrollBar *>(static_cast<uintptr_t>(ptr));
        QMouseEvent *event = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doMouseReleaseEvent(event);
    }
    void nativeScrollBarWheelEvent(uintptr_t ptr, uintptr_t eventPtr)
    {
        CjScrollBar *instance = reinterpret_cast<CjScrollBar *>(static_cast<uintptr_t>(ptr));
        QWheelEvent *event = reinterpret_cast<QWheelEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doWheelEvent(event);
    }
    void nativeScrollBarContextMenuEvent(uintptr_t ptr, uintptr_t eventPtr)
    {
        CjScrollBar *instance = reinterpret_cast<CjScrollBar *>(static_cast<uintptr_t>(ptr));
        QContextMenuEvent *event = reinterpret_cast<QContextMenuEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doContextMenuEvent(event);
    }
}