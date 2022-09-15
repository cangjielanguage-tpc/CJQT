#include <QMouseEvent>

extern "C"
{

    int nativeMouseEventGetX(long vptr)
    {
        QMouseEvent *engine = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(vptr));
        return engine->x();
    }

    int nativeMouseEventGetY(long vptr)
    {
        QMouseEvent *engine = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(vptr));
        return engine->y();
    }

    int nativeMouseEventGetGlobalX(long vptr)
    {
        QMouseEvent *engine = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(vptr));
        return engine->globalX();
    }

    int nativeMouseEventGetGlobalY(long vptr)
    {
        QMouseEvent *engine = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(vptr));
        return engine->globalY();
    }

    long nativeMouseEventGetPos(long vptr)
    {
        QMouseEvent *engine = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(vptr));
        QPoint point = engine->pos();
        QPoint *p = new QPoint(point.x(), point.y());
        return reinterpret_cast<long>(p);
    }

    long nativeMouseEventGetScreenPos(long vptr)
    {
        QMouseEvent *engine = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(vptr));
        QPointF pointF = engine->screenPos();
        return reinterpret_cast<long>(&pointF);
    }

    long nativeMouseEventGetWindowPos(long vptr)
    {
        QMouseEvent *engine = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(vptr));
        QPointF pointF = engine->windowPos();
        return reinterpret_cast<long>(&pointF);
    }

    long nativeMouseEventGetGlobalPos(long vptr)
    {
        QMouseEvent *engine = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(vptr));
        QPoint point = engine->globalPos();
        return reinterpret_cast<long>(&point);
    }

    long nativeMouseEventGetLocalPos(long vptr)
    {
        QMouseEvent *engine = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(vptr));
        return reinterpret_cast<long>(&engine->localPos());
    }
}