#include <QPolygon>

extern "C"
{
    long nativePolygonCreate()
    {
        QPolygon *polygon = new QPolygon();
        return reinterpret_cast<long>(polygon);
    }
    long nativePolygonCreateWithSize(int size)
    {
        QPolygon *polygon = new QPolygon(size);
        return reinterpret_cast<long>(polygon);
    }
    long nativePolygonCreateWithRect(const long rectPtr, bool closed)
    {
        QRect *rect = reinterpret_cast<QRect *>(static_cast<uintptr_t>(rectPtr));
        QPolygon *polygon = new QPolygon(*rect, closed);
        return reinterpret_cast<long>(polygon);
    }
    void nativePolygonDelete(long ptr)
    {
        QPolygon *instance = reinterpret_cast<QPolygon *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}