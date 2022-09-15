#include <QGraphicsRectItem>

extern "C"
{
    long nativeGraphicsRectItemCreateWithXYWH(double x, double y, double width, double height, long parentPtr)
    {
        QGraphicsRectItem *item;
        if (parentPtr == 0L)
        {
            item = new QGraphicsRectItem(x, y, width, height);
        }
        else
        {
            QGraphicsItem *parent = reinterpret_cast<QGraphicsItem *>(static_cast<uintptr_t>(parentPtr));
            item = new QGraphicsRectItem(x, y, width, height, parent);
        }
        return reinterpret_cast<long>(item);
    }
    long nativeGraphicsRectItemCreateWithRect(const long rectPtr, long parentPtr)
    {
        QGraphicsRectItem *item;
        QRectF *rect = reinterpret_cast<QRectF *>(static_cast<uintptr_t>(rectPtr));

        if (parentPtr == 0L)
        {
            item = new QGraphicsRectItem(*rect);
        }
        else
        {
            QGraphicsItem *parent = reinterpret_cast<QGraphicsItem *>(static_cast<uintptr_t>(parentPtr));
            item = new QGraphicsRectItem(*rect, parent);
        }
        return reinterpret_cast<long>(item);
    }
    long nativeGraphicsRectItemCreate(long parentPtr)
    {
        QGraphicsRectItem *item;
        if (parentPtr == 0L)
        {
            item = new QGraphicsRectItem();
        }
        else
        {
            QGraphicsItem *parent = reinterpret_cast<QGraphicsItem *>(static_cast<uintptr_t>(parentPtr));
            item = new QGraphicsRectItem(parent);
        }
        return reinterpret_cast<long>(item);
    }
    void nativeGraphicsRectItemDelete(long ptr)
    {
        QGraphicsRectItem *instance = reinterpret_cast<QGraphicsRectItem *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
    long nativeGraphicsRectItemRect(long ptr)
    {
        QGraphicsRectItem *instance = reinterpret_cast<QGraphicsRectItem *>(static_cast<uintptr_t>(ptr));
        QRectF rectF = instance->rect();
        QRectF *p = new QRectF(rectF);
        return reinterpret_cast<long>(p);
    }
    void nativeGraphicsRectItemSetRectWithRect(long ptr, const long rectanglePtr)
    {
        QGraphicsRectItem *instance = reinterpret_cast<QGraphicsRectItem *>(static_cast<uintptr_t>(ptr));
        QRectF *rectangle = reinterpret_cast<QRectF *>(static_cast<uintptr_t>(rectanglePtr));
        instance->setRect(*rectangle);
    }
    void nativeGraphicsRectItemSetRect(long ptr, double x, double y, double width, double height)
    {
        QGraphicsRectItem *instance = reinterpret_cast<QGraphicsRectItem *>(static_cast<uintptr_t>(ptr));
        instance->setRect(x, y, width, height);
    }
}