#include <QPolygonF>

extern "C"
{
    long nativePolygonFCreate()
    {
        QPolygonF *polygon = new QPolygonF();
        return reinterpret_cast<long>(polygon);
    }
    long nativePolygonFCreateWithSize(int size)
    {
        QPolygonF *polygon = new QPolygonF(size);
        return reinterpret_cast<long>(polygon);
    }
    long nativePolygonFCreateWithRect(const long rectFPtr)
    {
        QRectF *rectF = reinterpret_cast<QRectF *>(static_cast<uintptr_t>(rectFPtr));
        QPolygonF *polygon = new QPolygonF(*rectF);
        return reinterpret_cast<long>(polygon);
    }
    long nativePolygonFCreateWithPolygon(const long polygonPtr)
    {
        QPolygon *polygon = reinterpret_cast<QPolygon *>(static_cast<uintptr_t>(polygonPtr));
        QPolygonF *newPolygon = new QPolygonF(*polygon);
        return reinterpret_cast<long>(newPolygon);
    }
    long nativePolygonFCreateWithPolygonF(const long polygonFPtr)
    {
        QPolygonF *polygonF = reinterpret_cast<QPolygonF *>(static_cast<uintptr_t>(polygonFPtr));
        QPolygonF *newPolygon = new QPolygonF(*polygonF);
        return reinterpret_cast<long>(newPolygon);
    }
    void nativePolygonFDelete(long ptr)
    {
        QPolygonF *instance = reinterpret_cast<QPolygonF *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
    // Operator <<
    long nativePolygonFOperatorLeftMove(long ptr, long pointPtr)
    {
        QPolygonF *instance = reinterpret_cast<QPolygonF *>(static_cast<uintptr_t>(ptr));
        QPointF *pointF = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(pointPtr));
        instance->operator<<(*pointF);
        return reinterpret_cast<long>(instance);
    }
}