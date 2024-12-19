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
    uintptr_t nativeGraphicsEllipseItemCreateWithRect(qreal x,qreal y,qreal width,qreal height, uintptr_t parentPtr)
    {
        QGraphicsEllipseItem *item;
        QRectF rect(x,y,width,height) ;

        if (parentPtr == 0L)
        {
            item = new QGraphicsEllipseItem(rect);
        }
        else
        {
            QGraphicsItem *parent = reinterpret_cast<QGraphicsItem *>(static_cast<uintptr_t>(parentPtr));
            item = new QGraphicsEllipseItem(rect, parent);
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
    QRectF nativeGraphicsEllipseItemRect(uintptr_t ptr)
    {
        QGraphicsEllipseItem *instance = reinterpret_cast<QGraphicsEllipseItem *>(static_cast<uintptr_t>(ptr));
       // QRectF rectF = instance->rect();
        // QRectF *p = new QRectF(rectF);
        return instance->rect();
    }
    void nativeGraphicsEllipseItemSetRectWithRect(uintptr_t ptr, qreal x,qreal y,qreal width,qreal height)
    {
        QGraphicsEllipseItem *instance = reinterpret_cast<QGraphicsEllipseItem *>(static_cast<uintptr_t>(ptr));
        QRectF rectangle(x,y,width,height);
        instance->setRect(rectangle);
    }
    void nativeGraphicsEllipseItemSetRect(uintptr_t ptr, double x, double y, double width, double height)
    {
        QGraphicsEllipseItem *instance = reinterpret_cast<QGraphicsEllipseItem *>(static_cast<uintptr_t>(ptr));
        instance->setRect(x, y, width, height);
    }
}
