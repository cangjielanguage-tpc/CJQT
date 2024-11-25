#include <QPolygonF>

extern "C"
{
    uintptr_t nativePolygonFCreate()
    {
        QPolygonF *polygon = new QPolygonF();
        return reinterpret_cast<uintptr_t>(polygon);
    }
    uintptr_t nativePolygonFCreateWithSize(int size)
    {
        QPolygonF *polygon = new QPolygonF(size);
        return reinterpret_cast<uintptr_t>(polygon);
    }
    uintptr_t nativePolygonFCreateWithRect(const uintptr_t rectFPtr)
    {
        QRectF *rectF = reinterpret_cast<QRectF *>(static_cast<uintptr_t>(rectFPtr));
        QPolygonF *polygon = new QPolygonF(*rectF);
        return reinterpret_cast<uintptr_t>(polygon);
    }
    uintptr_t nativePolygonFCreateWithPolygon(const uintptr_t polygonPtr)
    {
        QPolygon *polygon = reinterpret_cast<QPolygon *>(static_cast<uintptr_t>(polygonPtr));
        QPolygonF *newPolygon = new QPolygonF(*polygon);
        return reinterpret_cast<uintptr_t>(newPolygon);
    }
    uintptr_t nativePolygonFCreateWithPolygonF(const uintptr_t polygonFPtr)
    {
        QPolygonF *polygonF = reinterpret_cast<QPolygonF *>(static_cast<uintptr_t>(polygonFPtr));
        QPolygonF *newPolygon = new QPolygonF(*polygonF);
        return reinterpret_cast<uintptr_t>(newPolygon);
    }
    void nativePolygonFDelete(uintptr_t ptr)
    {
        QPolygonF *instance = reinterpret_cast<QPolygonF *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
    // Operator <<
    uintptr_t nativePolygonFOperatorLeftMove(uintptr_t ptr, uintptr_t pointPtr)
    {
        QPolygonF *instance = reinterpret_cast<QPolygonF *>(static_cast<uintptr_t>(ptr));
        QPointF *pointF = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(pointPtr));
        instance->operator<<(*pointF);
        return reinterpret_cast<uintptr_t>(instance);
    }
}