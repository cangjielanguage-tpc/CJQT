#include <QTransform>

extern "C"
{
    long nativeTransformCreateWithTwoVector(double m11, double m12, double m21, double m22, double dx, double dy)
    {
        QTransform *transform = new QTransform(m11, m12, m21, m22, dx, dy);
        return reinterpret_cast<long>(transform);
    }
    long nativeTransformCreateWithThirdVector(double m11, double m12, double m13, double m21, double m22, double m23, double m31, double m32, double m33)
    {
        QTransform *transform = new QTransform(m11, m12, m13, m21, m22, m23, m31, m32, m33);
        return reinterpret_cast<long>(transform);
    }
    long nativeTransformCreate()
    {
        QTransform *transform = new QTransform();
        return reinterpret_cast<long>(transform);
    }
    void nativeTransformDelete(long ptr)
    {
        QTransform *instance = reinterpret_cast<QTransform *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}