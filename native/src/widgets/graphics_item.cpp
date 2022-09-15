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
    long nativeGraphicsItemCreate(long parentPtr)
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
        return reinterpret_cast<long>(item);
    }

    void nativeGraphicsItemDelete(long ptr)
    {
        CjGraphicsItem *instance = reinterpret_cast<CjGraphicsItem *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}