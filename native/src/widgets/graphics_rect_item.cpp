#include <QGraphicsRectItem>

extern "C"
{
    uintptr_t nativeGraphicsRectItemCreateWithXYWH(double x, double y, double width, double height, uintptr_t parentPtr)
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
        return reinterpret_cast<uintptr_t>(item);
    }
    uintptr_t nativeGraphicsRectItemCreateWithRect(qreal x,qreal y,qreal width,qreal height, uintptr_t parentPtr)
    {
        QGraphicsRectItem *item;
        QRectF rect(x,y,width,height);

        if (parentPtr == 0L)
        {
            item = new QGraphicsRectItem(rect);
        }
        else
        {
            QGraphicsItem *parent = reinterpret_cast<QGraphicsItem *>(static_cast<uintptr_t>(parentPtr));
            item = new QGraphicsRectItem(rect, parent);
        }
        return reinterpret_cast<uintptr_t>(item);
    }
    uintptr_t nativeGraphicsRectItemCreate(uintptr_t parentPtr)
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
        return reinterpret_cast<uintptr_t>(item);
    }
    void nativeGraphicsRectItemDelete(uintptr_t ptr)
    {
        QGraphicsRectItem *instance = reinterpret_cast<QGraphicsRectItem *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
    uintptr_t nativeGraphicsRectItemRect(uintptr_t ptr)
    {
        QGraphicsRectItem *instance = reinterpret_cast<QGraphicsRectItem *>(static_cast<uintptr_t>(ptr));
        QRectF rectF = instance->rect();
        QRectF *p = new QRectF(rectF);
        return reinterpret_cast<uintptr_t>(p);
    }
    void nativeGraphicsRectItemSetRectWithRect(uintptr_t ptr, const uintptr_t rectanglePtr)
    {
        QGraphicsRectItem *instance = reinterpret_cast<QGraphicsRectItem *>(static_cast<uintptr_t>(ptr));
        QRectF *rectangle = reinterpret_cast<QRectF *>(static_cast<uintptr_t>(rectanglePtr));
        instance->setRect(*rectangle);
    }
    void nativeGraphicsRectItemSetRect(uintptr_t ptr, double x, double y, double width, double height)
    {
        QGraphicsRectItem *instance = reinterpret_cast<QGraphicsRectItem *>(static_cast<uintptr_t>(ptr));
        instance->setRect(x, y, width, height);
    }
}
