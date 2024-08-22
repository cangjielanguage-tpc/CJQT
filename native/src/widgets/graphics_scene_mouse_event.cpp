#include <QGraphicsSceneMouseEvent>

extern "C"
{
    uintptr_t const nativeGraphicsSceneMouseEventScenePos(uintptr_t ptr)
    {
        QGraphicsSceneMouseEvent *event = reinterpret_cast<QGraphicsSceneMouseEvent *>(static_cast<uintptr_t>(ptr));
        QPointF pointF = event->scenePos();
        QPointF *p = new QPointF(pointF);
        return reinterpret_cast<uintptr_t>(p);
    }
    uintptr_t nativeGraphicsSceneMouseEventScreenPos(uintptr_t ptr)
    {
        QGraphicsSceneMouseEvent *event = reinterpret_cast<QGraphicsSceneMouseEvent *>(static_cast<uintptr_t>(ptr));
        QPoint point = event->screenPos();
        QPoint *p = new QPoint(point);
        return reinterpret_cast<uintptr_t>(p);
    }
    uintptr_t nativeGraphicsSceneMouseEventPos(uintptr_t ptr)
    {
        QGraphicsSceneMouseEvent *event = reinterpret_cast<QGraphicsSceneMouseEvent *>(static_cast<uintptr_t>(ptr));
        QPointF pointF = event->pos();
        QPointF *p = new QPointF(pointF);
        return reinterpret_cast<uintptr_t>(p);
    }
    void nativeGraphicsSceneMouseEventDelete(uintptr_t ptr)
    {
        QGraphicsSceneMouseEvent *instance = reinterpret_cast<QGraphicsSceneMouseEvent *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}