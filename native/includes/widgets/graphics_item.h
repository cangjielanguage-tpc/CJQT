#ifndef __GRAPHICS_ITEM_H_
#define __GRAPHICS_ITEM_H_
#include <QGraphicsItem>
#include "object.h"
class CjGraphicsItem : public QGraphicsItem
{

public:
    CjGraphicsItem(QGraphicsItem *parent = nullptr) : QGraphicsItem(parent) {}
    ~CjGraphicsItem(){};

public:
    QRectF boundingRect() const;
    void paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget = nullptr);

public:
    void doContextMenuEvent(QGraphicsSceneContextMenuEvent *event)
    {
        QGraphicsItem::contextMenuEvent(event);
    }
    void doMouseMoveEvent(QGraphicsSceneMouseEvent *event)
    {
        QGraphicsItem::mouseMoveEvent(event);
    }
    void doMousePressEvent(QGraphicsSceneMouseEvent *event)
    {
        QGraphicsItem::mousePressEvent(event);
    }
    void doMouseReleaseEvent(QGraphicsSceneMouseEvent *event)
    {
        QGraphicsItem::mouseReleaseEvent(event);
    }
    void doWheelEvent(QGraphicsSceneWheelEvent *event)
    {
        QGraphicsItem::wheelEvent(event);
    }
};

#endif