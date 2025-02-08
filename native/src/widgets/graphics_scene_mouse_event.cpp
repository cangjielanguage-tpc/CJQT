#include <QGraphicsSceneMouseEvent>

extern "C"
{
    QPointF nativeGraphicsSceneMouseEventScenePos(uintptr_t ptr)
    {
        QGraphicsSceneMouseEvent *event = reinterpret_cast<QGraphicsSceneMouseEvent *>(static_cast<uintptr_t>(ptr));
     //   QPointF pointF = event->scenePos();
        // QPointF *p = new QPointF(pointF);
        return event->scenePos();
    }
    QPoint nativeGraphicsSceneMouseEventScreenPos(uintptr_t ptr)
    {
        QGraphicsSceneMouseEvent *event = reinterpret_cast<QGraphicsSceneMouseEvent *>(static_cast<uintptr_t>(ptr));
      //  QPoint point = event->screenPos();
        // QPoint *p = new QPoint(point);
        return event->screenPos();
    }
    QPointF nativeGraphicsSceneMouseEventPos(uintptr_t ptr)
    {
        QGraphicsSceneMouseEvent *event = reinterpret_cast<QGraphicsSceneMouseEvent *>(static_cast<uintptr_t>(ptr));
    //    QPointF pointF = event->pos();
        // QPointF *p = new QPointF(pointF);
        return  event->pos();
    }
    void nativeGraphicsSceneMouseEventDelete(uintptr_t ptr)
    {
        QGraphicsSceneMouseEvent *instance = reinterpret_cast<QGraphicsSceneMouseEvent *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}
