#include <QSize>

extern "C"
{
    long nativeSizeCreate()
    {
        QSize *size = new QSize();
        return reinterpret_cast<long>(size);
    }
    long nativeSizeCreateWithWidth(int width, int height)
    {
        QSize *size = new QSize(width, height);
        return reinterpret_cast<long>(size);
    }
    void nativeSizeDelete(long ptr)
    {
        QSize *instance = reinterpret_cast<QSize *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}