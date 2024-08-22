#include "graphics_item.h"
QRectF CjGraphicsItem::boundingRect() const
{
    return QRectF(0, 0, 0, 0);
};
void CjGraphicsItem::paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget)
{
    painter;
    option;
    widget;
    return;
};
extern "C"
{
    uintptr_t nativeGraphicsItemCreate(uintptr_t parentPtr)
    {
        CjGraphicsItem *item;
        if (parentPtr == 0L)
        {
            item = new CjGraphicsItem();
        }
        else
        {
            QGraphicsItem *parent = reinterpret_cast<QGraphicsItem *>(static_cast<uintptr_t>(parentPtr));
            item = new CjGraphicsItem(parent);
        }
        return reinterpret_cast<uintptr_t>(item);
    }

    void nativeGraphicsItemDelete(uintptr_t ptr)
    {
        CjGraphicsItem *instance = reinterpret_cast<CjGraphicsItem *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}