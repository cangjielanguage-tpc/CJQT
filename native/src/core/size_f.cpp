#include <QSizeF>

extern "C"
{
    uintptr_t nativeSizeFCreate()
    {
        QSizeF *sizeF = new QSizeF();
        return reinterpret_cast<uintptr_t>(sizeF);
    }
    uintptr_t nativeSizeFCreateWithWH(double width, double height)
    {
        QSizeF *pointF = new QSizeF(width, height);
        return reinterpret_cast<uintptr_t>(pointF);
    }
    uintptr_t nativeSizeFCreateWithSize(const uintptr_t sizePtr)
    {
        QSize *size = reinterpret_cast<QSize *>(static_cast<uintptr_t>(sizePtr));
        QSizeF *sizeF = new QSizeF(*size);
        return reinterpret_cast<uintptr_t>(sizeF);
    }
    void nativeSizeFDelete(uintptr_t ptr)
    {
        QSizeF *instance = reinterpret_cast<QSizeF *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}