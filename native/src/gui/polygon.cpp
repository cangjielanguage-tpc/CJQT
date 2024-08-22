#include <QPolygon>

extern "C"
{
    uintptr_t nativePolygonCreate()
    {
        QPolygon *polygon = new QPolygon();
        return reinterpret_cast<uintptr_t>(polygon);
    }
    uintptr_t nativePolygonCreateWithSize(int size)
    {
        QPolygon *polygon = new QPolygon(size);
        return reinterpret_cast<uintptr_t>(polygon);
    }
    uintptr_t nativePolygonCreateWithRect(const uintptr_t rectPtr, bool closed)
    {
        QRect *rect = reinterpret_cast<QRect *>(static_cast<uintptr_t>(rectPtr));
        QPolygon *polygon = new QPolygon(*rect, closed);
        return reinterpret_cast<uintptr_t>(polygon);
    }
    void nativePolygonDelete(uintptr_t ptr)
    {
        QPolygon *instance = reinterpret_cast<QPolygon *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}