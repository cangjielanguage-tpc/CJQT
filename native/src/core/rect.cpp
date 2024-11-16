#include <QRect>

extern "C"
{
    uintptr_t nativeRectCreate(int x, int y, int width, int height)
    {
        QRect *rect = new QRect(x, y, width, height);
        return reinterpret_cast<uintptr_t>(rect);
    }
    void nativeRectDelete(uintptr_t ptr)
    {
        QRect *instance = reinterpret_cast<QRect *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
    int nativeRectWidth(uintptr_t ptr)
    {
        QRect *instance = reinterpret_cast<QRect *>(static_cast<uintptr_t>(ptr));
        return instance->width();
    }
    int nativeRectHeight(uintptr_t ptr)
    {
        QRect *instance = reinterpret_cast<QRect *>(static_cast<uintptr_t>(ptr));
        return instance->height();
    }
    int nativeRectX(uintptr_t ptr)
    {
        QRect *instance = reinterpret_cast<QRect *>(static_cast<uintptr_t>(ptr));
        return instance->x();
    }
    int nativeRectY(uintptr_t ptr)
    {
        QRect *instance = reinterpret_cast<QRect *>(static_cast<uintptr_t>(ptr));
        return instance->y();
    }
}
