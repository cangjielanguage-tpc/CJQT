#include <QSizeF>

extern "C"
{
    long nativeSizeFCreate()
    {
        QSizeF *sizeF = new QSizeF();
        return reinterpret_cast<long>(sizeF);
    }
    long nativeSizeFCreateWithWH(double width, double height)
    {
        QSizeF *pointF = new QSizeF(width, height);
        return reinterpret_cast<long>(pointF);
    }
    long nativeSizeFCreateWithSize(const long sizePtr)
    {
        QSize *size = reinterpret_cast<QSize *>(static_cast<uintptr_t>(sizePtr));
        QSizeF *sizeF = new QSizeF(*size);
        return reinterpret_cast<long>(sizeF);
    }
    void nativeSizeFDelete(long ptr)
    {
        QSizeF *instance = reinterpret_cast<QSizeF *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}