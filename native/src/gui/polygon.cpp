#include <QPolygon>
#include<QRect>

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
    uintptr_t nativePolygonCreateWithRect(int x,int y,int width,int height, bool closed)
    {
        QRect rect(x,y,width,height) ;
        QPolygon *polygon = new QPolygon(rect, closed);
        return reinterpret_cast<uintptr_t>(polygon);
    }
    void nativePolygonDelete(uintptr_t ptr)
    {
        QPolygon *instance = reinterpret_cast<QPolygon *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}
