#include <QPoint>

extern "C"
{
    uintptr_t nativePointCreateWithXY(int xpos, int ypos)
    {
        QPoint *point = new QPoint(xpos, ypos);
        return reinterpret_cast<uintptr_t>(point);
    }
    uintptr_t nativePointCreate()
    {
        QPoint *point = new QPoint();
        return reinterpret_cast<uintptr_t>(point);
    }

    void nativePointDelete(uintptr_t ptr)
    {
        QPoint *instance = reinterpret_cast<QPoint *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
    int nativePointRx(uintptr_t ptr)
    {
        QPoint *instance = reinterpret_cast<QPoint *>(static_cast<uintptr_t>(ptr));
        return instance->rx();
    }
    int nativePointRy(uintptr_t ptr)
    {
        QPoint *instance = reinterpret_cast<QPoint *>(static_cast<uintptr_t>(ptr));
        return instance->ry();
    }
    int nativePointX(uintptr_t ptr)
    {
        QPoint *instance = reinterpret_cast<QPoint *>(static_cast<uintptr_t>(ptr));
        return instance->x();
    }
    int nativePointY(uintptr_t ptr)
    {
        QPoint *instance = reinterpret_cast<QPoint *>(static_cast<uintptr_t>(ptr));
        return instance->y();
    }
}