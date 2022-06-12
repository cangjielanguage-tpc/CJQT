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
        const QPoint point = engine->pos();
        return reinterpret_cast<long>(&point);
    }

    long nativeMouseEventGetScreenPos(long vptr)
    {
        QMouseEvent *engine = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(vptr));
        return reinterpret_cast<long>(&engine->screenPos());
    }

    long nativeMouseEventGetWindowPos(long vptr)
    {
        QMouseEvent *engine = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(vptr));
        return reinterpret_cast<long>(&engine->windowPos());
    }

    long nativeMouseEventGetGlobalPos(long vptr)
    {
        QMouseEvent *engine = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(vptr));
        const QPoint point = engine->globalPos();
        return reinterpret_cast<long>(&point);
    }

    long nativeMouseEventGetLocalPos(long vptr)
    {
        QMouseEvent *engine = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(vptr));
        return reinterpret_cast<long>(&engine->localPos());
    }
}