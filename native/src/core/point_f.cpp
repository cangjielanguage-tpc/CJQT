#include <QPointF>

extern "C"
{
    uintptr_t nativePointFCreate(double xpos, double ypos)
    {
        QPointF *pointF = new QPointF(xpos, ypos);
        return reinterpret_cast<uintptr_t>(pointF);
    }
    uintptr_t nativePointFCreateWithPoint(const uintptr_t pointPtr)
    {
        QPoint *point = reinterpret_cast<QPoint *>(static_cast<uintptr_t>(pointPtr));
        QPointF *pointF = new QPointF(*point);
        return reinterpret_cast<uintptr_t>(pointF);
    }
    void nativePointFDelete(uintptr_t ptr)
    {
        QPointF *instance = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    bool nativePointFIsNull(uintptr_t ptr)
    {
        QPointF *instance = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(ptr));
        return instance->isNull();
    }
    double nativePointFManhattanLength(uintptr_t ptr)
    {
        QPointF *instance = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(ptr));
        return instance->manhattanLength();
    }
    double nativePointFRx(uintptr_t ptr)
    {
        QPointF *instance = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(ptr));
        return instance->rx();
    }
    double nativePointFRy(uintptr_t ptr)
    {
        QPointF *instance = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(ptr));
        return instance->ry();
    }
    void nativePointFSetX(uintptr_t ptr, double x)
    {
        QPointF *instance = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(ptr));
        instance->setX(x);
    }
    void nativePointFSetY(uintptr_t ptr, double y)
    {
        QPointF *instance = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(ptr));
        instance->setY(y);
    }
    uintptr_t nativePointFToPoint(uintptr_t ptr)
    {
        QPointF *instance = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(ptr));
        QPoint point = instance->toPoint();
        QPoint *p = new QPoint(point);
        return reinterpret_cast<uintptr_t>(p);
    }
    uintptr_t nativePointFTransposed(uintptr_t ptr)
    {
        QPointF *instance = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(ptr));
        QPointF pointF = instance->transposed();
        QPointF *p = new QPointF(pointF);
        return reinterpret_cast<uintptr_t>(p);
    }
    double nativePointFX(uintptr_t ptr)
    {
        QPointF *instance = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(ptr));
        return instance->x();
    }
    double nativePointFY(uintptr_t ptr)
    {
        QPointF *instance = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(ptr));
        return instance->y();
    }
}