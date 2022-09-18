#include <QPointF>

extern "C"
{
    long nativePointFCreate(double xpos, double ypos)
    {
        QPointF *pointF = new QPointF(xpos, ypos);
        return reinterpret_cast<long>(pointF);
    }
    long nativePointFCreateWithPoint(const long pointPtr)
    {
        QPoint *point = reinterpret_cast<QPoint *>(static_cast<uintptr_t>(pointPtr));
        QPointF *pointF = new QPointF(*point);
        return reinterpret_cast<long>(pointF);
    }
    void nativePointFDelete(long ptr)
    {
        QPointF *instance = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    bool nativePointFIsNull(long ptr)
    {
        QPointF *instance = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(ptr));
        return instance->isNull();
    }
    double nativePointFManhattanLength(long ptr)
    {
        QPointF *instance = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(ptr));
        return instance->manhattanLength();
    }
    double nativePointFRx(long ptr)
    {
        QPointF *instance = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(ptr));
        return instance->rx();
    }
    double nativePointFRy(long ptr)
    {
        QPointF *instance = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(ptr));
        return instance->ry();
    }
    void nativePointFSetX(long ptr, double x)
    {
        QPointF *instance = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(ptr));
        instance->setX(x);
    }
    void nativePointFSetY(long ptr, double y)
    {
        QPointF *instance = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(ptr));
        instance->setY(y);
    }
    long nativePointFToPoint(long ptr)
    {
        QPointF *instance = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(ptr));
        QPoint point = instance->toPoint();
        QPoint *p = new QPoint(point);
        return reinterpret_cast<long>(p);
    }
    long nativePointFTransposed(long ptr)
    {
        QPointF *instance = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(ptr));
        QPointF pointF = instance->transposed();
        QPointF *p = new QPointF(pointF);
        return reinterpret_cast<long>(p);
    }
    double nativePointFX(long ptr)
    {
        QPointF *instance = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(ptr));
        return instance->x();
    }
    double nativePointFY(long ptr)
    {
        QPointF *instance = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(ptr));
        return instance->y();
    }
}