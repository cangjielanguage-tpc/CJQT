#include <QGraphicsLineItem>
#include <QPen>
extern "C"
{
    long nativeGraphicsLineItemCreateWithParent(long parentPtr)
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
        return reinterpret_cast<long>(item);
    }
    long nativeGraphicsLineItemCreate(double x1, double y1, double x2, double y2, long parentPtr)
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
        return reinterpret_cast<long>(item);
    }
    long nativeGraphicsLineItemCreateWithLine(const long lineFPtr, long parentPtr)
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
        return reinterpret_cast<long>(item);
    }
    void nativeGraphicsLineItemDelete(long ptr)
    {
        QGraphicsLineItem *instance = reinterpret_cast<QGraphicsLineItem *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
    long nativeGraphicsLineItemLine(long ptr)
    {
        QGraphicsLineItem *instance = reinterpret_cast<QGraphicsLineItem *>(static_cast<uintptr_t>(ptr));
        QLineF lineF = instance->line();
        QLineF *p = new QLineF(lineF);
        return reinterpret_cast<long>(p);
    }
    long nativeGraphicsLineItemPen(long ptr)
    {
        QGraphicsLineItem *instance = reinterpret_cast<QGraphicsLineItem *>(static_cast<uintptr_t>(ptr));
        QPen pen = instance->pen();
        QPen *p = new QPen(pen);
        return reinterpret_cast<long>(p);
    }
    void nativeGraphicsLineItemSetLineWithLine(long ptr, const long lineFPtr)
    {
        QGraphicsLineItem *instance = reinterpret_cast<QGraphicsLineItem *>(static_cast<uintptr_t>(ptr));
        QLineF *lineF = reinterpret_cast<QLineF *>(static_cast<uintptr_t>(lineFPtr));
        instance->setLine(*lineF);
    }
    void nativeGraphicsLineItemSetLine(long ptr, double x1, double y1, double x2, double y2)
    {
        QGraphicsLineItem *instance = reinterpret_cast<QGraphicsLineItem *>(static_cast<uintptr_t>(ptr));
        instance->setLine(x1, y1, x2, y2);
    }
    void nativeGraphicsLineItemSetPen(long ptr, const long penPtr)
    {
        QGraphicsLineItem *instance = reinterpret_cast<QGraphicsLineItem *>(static_cast<uintptr_t>(ptr));
        QPen *pen = reinterpret_cast<QPen *>(static_cast<uintptr_t>(penPtr));
        instance->setPen(*pen);
    }
}