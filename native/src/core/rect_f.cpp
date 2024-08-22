#include <QRectF>

extern "C"
{
    uintptr_t nativeRectFCreate()
    {
        QRectF *rectF = new QRectF;
        return reinterpret_cast<uintptr_t>(rectF);
    }
    uintptr_t nativeRectFCreateWithRect(uintptr_t rectPtr)
    {
        QRect *rect = reinterpret_cast<QRect *>(static_cast<uintptr_t>(rectPtr));
        QRectF *rectF = new QRectF(*rect);
        return reinterpret_cast<uintptr_t>(rectF);
    }
    uintptr_t nativeRectFCreateWithXYWH(double x, double y, double width, double height)
    {
        QRectF *rectF = new QRectF(x, y, width, height);
        return reinterpret_cast<uintptr_t>(rectF);
    }
    uintptr_t nativeRectFCreateWithTwoPoint(const uintptr_t topLeftPtr, const uintptr_t bottomRightPtr)
    {
        QPointF *topLeft = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(topLeftPtr));
        QPointF *bottomRight = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(bottomRightPtr));
        QRectF *rectF = new QRectF(*topLeft, *bottomRight);
        return reinterpret_cast<uintptr_t>(rectF);
    }
    uintptr_t nativeRectFCreateWithPointAndSize(const uintptr_t topLeftPtr, const uintptr_t sizePtr)
    {
        QPointF *topLeft = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(topLeftPtr));
        QSizeF *size = reinterpret_cast<QSizeF *>(static_cast<uintptr_t>(sizePtr));
        QRectF *rectF = new QRectF(*topLeft, *size);
        return reinterpret_cast<uintptr_t>(rectF);
    }

    void nativeRectFDelete(uintptr_t ptr)
    {
        QRectF *instance = reinterpret_cast<QRectF *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}