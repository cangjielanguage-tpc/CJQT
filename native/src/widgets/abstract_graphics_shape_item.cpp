#include "abstract_graphics_shape_item.h"
#include "object.h"
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
    uintptr_t nativeAbstractGraphicsShapeItemCreate(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
        CjAbstractGraphicsShapeItem *item;
        if (parentPtr == 0L)
        {
            item = new CjAbstractGraphicsShapeItem(0);
        }
    }

    void nativeAbstractGraphicsShapeItemDelete(uintptr_t ptr)
    {
        CjAbstractGraphicsShapeItem *instance = reinterpret_cast<CjAbstractGraphicsShapeItem *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    uintptr_t nativeAbstractGraphicsShapeItemBrush(uintptr_t ptr)
    {
        QAbstractGraphicsShapeItem *instance = reinterpret_cast<QAbstractGraphicsShapeItem *>(static_cast<uintptr_t>(ptr));
        QBrush brush = instance->brush();
        QBrush *p = new QBrush(brush);
        return reinterpret_cast<uintptr_t>(p);
    }
    void nativeAbstractGraphicsShapeItemSetBrush(uintptr_t ptr, const uintptr_t brushPtr)
    {
        QAbstractGraphicsShapeItem *instance = reinterpret_cast<QAbstractGraphicsShapeItem *>(static_cast<uintptr_t>(ptr));
        QBrush *brush = reinterpret_cast<QBrush *>(static_cast<uintptr_t>(brushPtr));
        instance->setBrush(*brush);
    }
    uintptr_t nativeAbstractGraphicsShapeItemPen(uintptr_t ptr)
    {
        QAbstractGraphicsShapeItem *instance = reinterpret_cast<QAbstractGraphicsShapeItem *>(static_cast<uintptr_t>(ptr));
        QPen pen = instance->pen();
        QPen *p = new QPen(pen);
        return reinterpret_cast<uintptr_t>(p);
    }
    void nativeAbstractGraphicsShapeItemSetPen(uintptr_t ptr, const uintptr_t penPtr)
    {
        QAbstractGraphicsShapeItem *instance = reinterpret_cast<QAbstractGraphicsShapeItem *>(static_cast<uintptr_t>(ptr));
        QPen *pen = reinterpret_cast<QPen *>(static_cast<uintptr_t>(penPtr));
        instance->setPen(*pen);
    }
}