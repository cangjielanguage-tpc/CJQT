#include <QGraphicsEllipseItem>

extern "C"
{
    uintptr_t nativeGraphicsEllipseItemCreateWithXYWH(double x, double y, double width, double height, uintptr_t parentPtr)
    {
        QGraphicsEllipseItem *item;
        if (parentPtr == 0L)
        {
            item = new QGraphicsEllipseItem(x, y, width, height);
        }
        else
        {
            QGraphicsItem *parent = reinterpret_cast<QGraphicsItem *>(static_cast<uintptr_t>(parentPtr));
            item = new QGraphicsEllipseItem(x, y, width, height, parent);
        }
        return reinterpret_cast<uintptr_t>(item);
    }
    uintptr_t nativeGraphicsEllipseItemCreateWithRect(const uintptr_t rectPtr, uintptr_t parentPtr)
    {
        QGraphicsEllipseItem *item;
        QRectF *rect = reinterpret_cast<QRectF *>(static_cast<uintptr_t>(rectPtr));

        if (parentPtr == 0L)
        {
            item = new QGraphicsEllipseItem(*rect);
        }
        else
        {
            QGraphicsItem *parent = reinterpret_cast<QGraphicsItem *>(static_cast<uintptr_t>(parentPtr));
            item = new QGraphicsEllipseItem(*rect, parent);
        }
        return reinterpret_cast<uintptr_t>(item);
    }
    uintptr_t nativeGraphicsEllipseItemCreate(uintptr_t parentPtr)
    {
        QGraphicsEllipseItem *item;
        if (parentPtr == 0L)
        {
            item = new QGraphicsEllipseItem();
        }
        else
        {
            QGraphicsItem *parent = reinterpret_cast<QGraphicsItem *>(static_cast<uintptr_t>(parentPtr));
            item = new QGraphicsEllipseItem(parent);
        }
        return reinterpret_cast<uintptr_t>(item);
    }
    void nativeGraphicsEllipseItemDelete(uintptr_t ptr)
    {
        QGraphicsEllipseItem *instance = reinterpret_cast<QGraphicsEllipseItem *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
    uintptr_t nativeGraphicsEllipseItemRect(uintptr_t ptr)
    {
        QGraphicsEllipseItem *instance = reinterpret_cast<QGraphicsEllipseItem *>(static_cast<uintptr_t>(ptr));
        QRectF rectF = instance->rect();
        QRectF *p = new QRectF(rectF);
        return reinterpret_cast<uintptr_t>(p);
    }
    void nativeGraphicsEllipseItemSetRectWithRect(uintptr_t ptr, const uintptr_t rectanglePtr)
    {
        QGraphicsEllipseItem *instance = reinterpret_cast<QGraphicsEllipseItem *>(static_cast<uintptr_t>(ptr));
        QRectF *rectangle = reinterpret_cast<QRectF *>(static_cast<uintptr_t>(rectanglePtr));
        instance->setRect(*rectangle);
    }
    void nativeGraphicsEllipseItemSetRect(uintptr_t ptr, double x, double y, double width, double height)
    {
        QGraphicsEllipseItem *instance = reinterpret_cast<QGraphicsEllipseItem *>(static_cast<uintptr_t>(ptr));
        instance->setRect(x, y, width, height);
    }
}
