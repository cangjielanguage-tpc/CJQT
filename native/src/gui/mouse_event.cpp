#include <QMouseEvent>
#include <QDebug>
#include <QPoint>

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

    QPoint nativeMouseEventGetPos(uintptr_t vptr)
    {
        QMouseEvent *engine = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(vptr));
//        QPoint point = engine->pos();
        // QPoint *p = Point(point.x(), point.y());
        return engine->pos();
    }

    QPointF nativeMouseEventGetScreenPos(uintptr_t vptr)
    {
        QMouseEvent *engine = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(vptr));
//        QPointF pointF = engine->screenPos();
        // QPointF *p = new PointF(pointF.x(), pointF.y());
        return engine->screenPos();
    }

    QPointF nativeMouseEventGetWindowPos(uintptr_t vptr)
    {
        QMouseEvent *engine = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(vptr));
//        QPointF pointF = engine->windowPos();
        // QPointF *p = new QPointF(pointF.x(), pointF.y());
        return engine->windowPos();
    }

    QPoint nativeMouseEventGetGlobalPos(uintptr_t vptr)
    {
        QMouseEvent *engine = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(vptr));
//        QPoint point = engine->globalPos();
        // QPoint *p = new QPoint(point.x(), point.y());
        return  engine->globalPos();
    }

    QPointF nativeMouseEventGetLocalPos(uintptr_t vptr)
    {
        QMouseEvent *engine = reinterpret_cast<QMouseEvent *>(static_cast<uintptr_t>(vptr));
//        QPointF point = engine->localPos();
        // QPointF *p = new QPointF(point.x(), point.y());
        // qDebug()<<"x:"<<point.x()<<"y:"<<point.y()<<endl;
        return engine->localPos();
    }
}
