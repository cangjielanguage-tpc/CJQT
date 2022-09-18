#include <QPoint>

extern "C"
{
    long nativePointCreateWithXY(int xpos, int ypos)
    {
        QPoint *point = new QPoint(xpos, ypos);
        return reinterpret_cast<long>(point);
    }
    long nativePointCreate()
    {
        QPoint *point = new QPoint();
        return reinterpret_cast<long>(point);
    }

    void nativePointDelete(long ptr)
    {
        QPoint *instance = reinterpret_cast<QPoint *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
    int nativePointRx(long ptr)
    {
        QPoint *instance = reinterpret_cast<QPoint *>(static_cast<uintptr_t>(ptr));
        return instance->rx();
    }
    int nativePointRy(long ptr)
    {
        QPoint *instance = reinterpret_cast<QPoint *>(static_cast<uintptr_t>(ptr));
        return instance->ry();
    }
    int nativePointX(long ptr)
    {
        QPoint *instance = reinterpret_cast<QPoint *>(static_cast<uintptr_t>(ptr));
        return instance->x();
    }
    int nativePointY(long ptr)
    {
        QPoint *instance = reinterpret_cast<QPoint *>(static_cast<uintptr_t>(ptr));
        return instance->y();
    }
}