#include <QColor>

extern "C"
{
    long nativeColorCreate(int r, int g, int b, int a)
    {
        return reinterpret_cast<long>(new QColor(r, g, b, a));
    }

    void nativeColorDelete(long ptr)
    {
        QColor *instance = reinterpret_cast<QColor *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}