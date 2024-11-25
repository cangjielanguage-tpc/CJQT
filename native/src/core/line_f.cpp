#include <QLineF>

extern "C"
{
    uintptr_t nativeLineFCreateWithLine(const uintptr_t linePtr)
    {
        QLine *line = reinterpret_cast<QLine *>(static_cast<uintptr_t>(linePtr));
        QLineF *lineF = new QLineF(*line);
        return reinterpret_cast<uintptr_t>(lineF);
    }
    uintptr_t nativeLineFCreateWithXY(double x1, double y1, double x2, double y2)
    {
        QLineF *lineF = new QLineF(x1, y1, x2, y2);
        return reinterpret_cast<uintptr_t>(lineF);
    }
    uintptr_t nativeLineFCreateWithTwoPoint(const uintptr_t pointF1Ptr, const uintptr_t pointF2Ptr)
    {
        QPointF *pointF1 = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(pointF1Ptr));
        QPointF *pointF2 = reinterpret_cast<QPointF *>(static_cast<uintptr_t>(pointF2Ptr));
        QLineF *lineF = new QLineF(*pointF1, *pointF2);
        return reinterpret_cast<uintptr_t>(lineF);
    }
    uintptr_t nativeLineFCreate()
    {
        QLineF *lineF = new QLineF();
        return reinterpret_cast<uintptr_t>(lineF);
    }

    void nativeLineFDelete(uintptr_t ptr)
    {
        QLineF *instance = reinterpret_cast<QLineF *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}