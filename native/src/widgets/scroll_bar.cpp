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

    void nativeScrollBarSetEvent(long ptr, eventCallback callback)
    {
        CjScrollBar *instance = reinterpret_cast<CjScrollBar *>(static_cast<uintptr_t>(ptr));
        return instance->setEvent(callback);
    }
    void nativeScrollBardoMousePressEvent(long ptr, long eventPtr)
    {
        CjScrollBar *instance = reinterpret_cast<CjScrollBar *>(static_cast<uintptr_t>(ptr));
        QMouseEvent *event = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(eventPtr));
        return instance->doMousePressEvent(event);
    }
}