#include <QGraphicsSceneMouseEvent>

extern "C"
{
    long const nativeGraphicsSceneMouseEventScenePos(long ptr)
    {
        QGraphicsSceneMouseEvent *event = reinterpret_cast<QGraphicsSceneMouseEvent *>(static_cast<uintptr_t>(ptr));
        QPointF pointF = event->scenePos();
        QPointF *p = new QPointF(pointF);
        return reinterpret_cast<long>(p);
    }
    long nativeGraphicsSceneMouseEventScreenPos(long ptr)
    {
        QGraphicsSceneMouseEvent *event = reinterpret_cast<QGraphicsSceneMouseEvent *>(static_cast<uintptr_t>(ptr));
        QPoint point = event->screenPos();
        QPoint *p = new QPoint(point);
        return reinterpret_cast<long>(p);
    }
    long nativeGraphicsSceneMouseEventPos(long ptr)
    {
        QGraphicsSceneMouseEvent *event = reinterpret_cast<QGraphicsSceneMouseEvent *>(static_cast<uintptr_t>(ptr));
        QPointF pointF = event->pos();
        QPointF *p = new QPointF(pointF);
        return reinterpret_cast<long>(p);
    }
    void nativeGraphicsSceneMouseEventDelete(long ptr)
    {
        QGraphicsSceneMouseEvent *instance = reinterpret_cast<QGraphicsSceneMouseEvent *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}