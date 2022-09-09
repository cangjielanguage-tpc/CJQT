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
    long nativeScrollBarCreateWithOrietation(int orientation, long parentPtr)
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
    // set event
    void nativeScrollBarSetPaintEvent(long ptr, nativeEventCallback callback)
    {
        appConfig->paintEventMapPut(ptr, callback);
    }
    void nativeScrollBarSetHideEvent(long ptr, nativeEventCallback callback)
    {
        appConfig->hideEventMapPut(ptr, callback);
    }
    void nativeScrollBarSetMouseMoveEvent(long ptr, nativeEventCallback callback)
    {
        appConfig->mouseMoveEventMapPut(ptr, callback);
    }
    void nativeScrollBarSetMousePressEvent(long ptr, nativeEventCallback callback)
    {
        appConfig->mousePressEventMapPut(ptr, callback);
    }
    void nativeScrollBarSetMouseReleaseEvent(long ptr, nativeEventCallback callback)
    {
        appConfig->mouseReleaseEventMapPut(ptr, callback);
    }
    void nativeScrollBarSetWheelEvent(long ptr, nativeEventCallback callback)
    {
        appConfig->wheelEventMapPut(ptr, callback);
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
}