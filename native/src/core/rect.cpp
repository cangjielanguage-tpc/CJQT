#include <QRect>

extern "C"
{
    long nativeRectCreate(int x, int y, int width, int height)
    {
        QRect *rect = new QRect(x, y, width, height);
        return reinterpret_cast<long>(rect);
    }
    void nativeRectDelete(long ptr)
    {
        QRect *instance = reinterpret_cast<QRect *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}