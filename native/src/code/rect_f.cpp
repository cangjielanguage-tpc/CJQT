#include <QRectF>

extern "C"
{
    long nativeRectFCreate()
    {
        QRectF *rectF = new QRectF;
        return reinterpret_cast<long>(rectF);
    }
    long nativeRectFCreateWithRect(long rectPtr)
    {
        QRect *rect = reinterpret_cast<QRect *>(static_cast<uintptr_t>(rectPtr));
        QRectF *rectF = new QRectF(*rect);
        return reinterpret_cast<long>(rectF);
    }
    long nativeRectFCreateWithXYWH(double x, double y, double width, double height)
    {
        QRectF *rectF = new QRectF(x, y, width, height);
        return reinterpret_cast<long>(rectF);
    }
    long nativeRectFCreateWithTwoPoint(const long topLeftPtr, const long bottomRightPtr)
    {
        QPointF *topLeft = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(topLeftPtr));
        QPointF *bottomRight = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(bottomRightPtr));
        QRectF *rectF = new QRectF(*topLeft, *bottomRight);
        return reinterpret_cast<long>(rectF);
    }
    long nativeRectFCreateWithPointAndSize(const long topLeftPtr, const long sizePtr)
    {
        QPointF *topLeft = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(topLeftPtr));
        QSizeF *size = reinterpret_cast<QSizeF *>(static_cast<uintptr_t>(sizePtr));
        QRectF *rectF = new QRectF(*topLeft, *size);
        return reinterpret_cast<long>(rectF);
    }

    void nativeRectFDelete(long ptr)
    {
        QRectF *instance = reinterpret_cast<QRectF *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}