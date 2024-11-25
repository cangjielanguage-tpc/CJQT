#ifndef __ABSTRACT_GRAPHICS_SHAPE_ITEM_H_
#define __ABSTRACT_GRAPHICS_SHAPE_ITEM_H_
#include <QAbstractGraphicsShapeItem>

class CjAbstractGraphicsShapeItem : public QAbstractGraphicsShapeItem
{

public:
    CjAbstractGraphicsShapeItem(QGraphicsItem *parent = nullptr) : QAbstractGraphicsShapeItem(parent) {}

public:
    QRectF boundingRect() const;
    void paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget = nullptr);
};

#endif