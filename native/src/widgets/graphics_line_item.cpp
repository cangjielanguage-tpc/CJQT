#include <QGraphicsLineItem>
#include <QPen>
extern "C"
{
    uintptr_t nativeGraphicsLineItemCreateWithParent(uintptr_t parentPtr)
    {
        QGraphicsLineItem *item;
        if (parentPtr == 0L)
        {
            item = new QGraphicsLineItem();
        }
        else
        {
            QGraphicsItem *parent = reinterpret_cast<QGraphicsItem *>(static_cast<uintptr_t>(parentPtr));
            item = new QGraphicsLineItem(parent);
        }
        return reinterpret_cast<uintptr_t>(item);
    }
    uintptr_t nativeGraphicsLineItemCreate(double x1, double y1, double x2, double y2, uintptr_t parentPtr)
    {
        QGraphicsLineItem *item;
        if (parentPtr == 0L)
        {
            item = new QGraphicsLineItem(x1, y1, x2, y2);
        }
        else
        {
            QGraphicsItem *parent = reinterpret_cast<QGraphicsItem *>(static_cast<uintptr_t>(parentPtr));
            item = new QGraphicsLineItem(x1, y1, x2, y2, parent);
        }
        return reinterpret_cast<uintptr_t>(item);
    }
    uintptr_t nativeGraphicsLineItemCreateWithLine(const uintptr_t lineFPtr, uintptr_t parentPtr)
    {
        QGraphicsLineItem *item;
        QLineF *lineF = reinterpret_cast<QLineF *>(static_cast<uintptr_t>(lineFPtr));
        if (parentPtr == 0L)
        {
            item = new QGraphicsLineItem(*lineF);
        }
        else
        {
            QGraphicsItem *parent = reinterpret_cast<QGraphicsItem *>(static_cast<uintptr_t>(parentPtr));
            item = new QGraphicsLineItem(*lineF, parent);
        }
        return reinterpret_cast<uintptr_t>(item);
    }
    void nativeGraphicsLineItemDelete(uintptr_t ptr)
    {
        QGraphicsLineItem *instance = reinterpret_cast<QGraphicsLineItem *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
    uintptr_t nativeGraphicsLineItemLine(uintptr_t ptr)
    {
        QGraphicsLineItem *instance = reinterpret_cast<QGraphicsLineItem *>(static_cast<uintptr_t>(ptr));
        QLineF lineF = instance->line();
        QLineF *p = new QLineF(lineF);
        return reinterpret_cast<uintptr_t>(p);
    }
    uintptr_t nativeGraphicsLineItemPen(uintptr_t ptr)
    {
        QGraphicsLineItem *instance = reinterpret_cast<QGraphicsLineItem *>(static_cast<uintptr_t>(ptr));
        QPen pen = instance->pen();
        QPen *p = new QPen(pen);
        return reinterpret_cast<uintptr_t>(p);
    }
    void nativeGraphicsLineItemSetLineWithLine(uintptr_t ptr, const uintptr_t lineFPtr)
    {
        QGraphicsLineItem *instance = reinterpret_cast<QGraphicsLineItem *>(static_cast<uintptr_t>(ptr));
        QLineF *lineF = reinterpret_cast<QLineF *>(static_cast<uintptr_t>(lineFPtr));
        instance->setLine(*lineF);
    }
    void nativeGraphicsLineItemSetLine(uintptr_t ptr, double x1, double y1, double x2, double y2)
    {
        QGraphicsLineItem *instance = reinterpret_cast<QGraphicsLineItem *>(static_cast<uintptr_t>(ptr));
        instance->setLine(x1, y1, x2, y2);
    }
    void nativeGraphicsLineItemSetPen(uintptr_t ptr, const uintptr_t penPtr)
    {
        QGraphicsLineItem *instance = reinterpret_cast<QGraphicsLineItem *>(static_cast<uintptr_t>(ptr));
        QPen *pen = reinterpret_cast<QPen *>(static_cast<uintptr_t>(penPtr));
        instance->setPen(*pen);
    }
}