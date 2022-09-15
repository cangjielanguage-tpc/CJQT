#include "abstract_graphics_shape_item.h"
#include <QBrush>
#include <QPen>
QRectF CjAbstractGraphicsShapeItem::boundingRect() const
{
    return QRectF(0, 0, 0, 0);
};
void CjAbstractGraphicsShapeItem::paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget)
{
    painter;
    option;
    widget;
    return;
};
extern "C"
{
    long nativeAbstractGraphicsShapeItemCreate(long parentPtr)
    {
        CjAbstractGraphicsShapeItem *item;
        if (parentPtr == 0L)
        {
            item = new CjAbstractGraphicsShapeItem(0);
        }
    }

    void nativeAbstractGraphicsShapeItemDelete(long ptr)
    {
        CjAbstractGraphicsShapeItem *instance = reinterpret_cast<CjAbstractGraphicsShapeItem *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    long nativeAbstractGraphicsShapeItemBrush(long ptr)
    {
        QAbstractGraphicsShapeItem *instance = reinterpret_cast<QAbstractGraphicsShapeItem *>(static_cast<uintptr_t>(ptr));
        QBrush brush = instance->brush();
        QBrush *p = new QBrush(brush);
        return reinterpret_cast<long>(p);
    }
    void nativeAbstractGraphicsShapeItemSetBrush(long ptr, const long brushPtr)
    {
        QAbstractGraphicsShapeItem *instance = reinterpret_cast<QAbstractGraphicsShapeItem *>(static_cast<uintptr_t>(ptr));
        QBrush *brush = reinterpret_cast<QBrush *>(static_cast<uintptr_t>(brushPtr));
        instance->setBrush(*brush);
    }
    long nativeAbstractGraphicsShapeItemPen(long ptr)
    {
        QAbstractGraphicsShapeItem *instance = reinterpret_cast<QAbstractGraphicsShapeItem *>(static_cast<uintptr_t>(ptr));
        QPen pen = instance->pen();
        QPen *p = new QPen(pen);
        return reinterpret_cast<long>(p);
    }
    void nativeAbstractGraphicsShapeItemSetPen(long ptr, const long penPtr)
    {
        QAbstractGraphicsShapeItem *instance = reinterpret_cast<QAbstractGraphicsShapeItem *>(static_cast<uintptr_t>(ptr));
        QPen *pen = reinterpret_cast<QPen *>(static_cast<uintptr_t>(penPtr));
        instance->setPen(*pen);
    }
}