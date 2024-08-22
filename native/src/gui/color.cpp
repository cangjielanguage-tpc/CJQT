#include <QColor>

extern "C"
{
    uintptr_t nativeColorCreate(int r, int g, int b, int a)
    {
        return reinterpret_cast<uintptr_t>(new QColor(r, g, b, a));
    }

    void nativeColorDelete(uintptr_t ptr)
    {
        QColor *instance = reinterpret_cast<QColor *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}