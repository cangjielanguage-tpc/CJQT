#include <QMouseEvent>

extern "C"
{

    int nativeMouseEventGetX(uintptr_t vptr)
    {
        QMouseEvent *engine = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(vptr));
        return engine->x();
    }

    int nativeMouseEventGetY(uintptr_t vptr)
    {
        QMouseEvent *engine = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(vptr));
        return engine->y();
    }

    int nativeMouseEventGetGlobalX(uintptr_t vptr)
    {
        QMouseEvent *engine = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(vptr));
        return engine->globalX();
    }

    int nativeMouseEventGetGlobalY(uintptr_t vptr)
    {
        QMouseEvent *engine = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(vptr));
        return engine->globalY();
    }

    uintptr_t nativeMouseEventGetPos(uintptr_t vptr)
    {
        QMouseEvent *engine = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(vptr));
        QPoint point = engine->pos();
        QPoint *p = new QPoint(point.x(), point.y());
        return reinterpret_cast<uintptr_t>(p);
    }

    uintptr_t nativeMouseEventGetScreenPos(uintptr_t vptr)
    {
        QMouseEvent *engine = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(vptr));
        QPointF pointF = engine->screenPos();
        return reinterpret_cast<uintptr_t>(&pointF);
    }

    uintptr_t nativeMouseEventGetWindowPos(uintptr_t vptr)
    {
        QMouseEvent *engine = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(vptr));
        QPointF pointF = engine->windowPos();
        return reinterpret_cast<uintptr_t>(&pointF);
    }

    uintptr_t nativeMouseEventGetGlobalPos(uintptr_t vptr)
    {
        QMouseEvent *engine = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(vptr));
        QPoint point = engine->globalPos();
        return reinterpret_cast<uintptr_t>(&point);
    }

    uintptr_t nativeMouseEventGetLocalPos(uintptr_t vptr)
    {
        QMouseEvent *engine = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(vptr));
        return reinterpret_cast<uintptr_t>(&engine->localPos());
    }
}