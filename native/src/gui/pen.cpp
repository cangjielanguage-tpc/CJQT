#include <QPen>
#include <QColor>

extern "C"
{
    long nativePenCreate(long colorPtr, int thickness)
    {
        QColor *color = reinterpret_cast<QColor *>(static_cast<uintptr_t>(colorPtr));
        return reinterpret_cast<long>(new QPen(*color, thickness, Qt::SolidLine));
    }
    long nativePenCreateWithColor(long colorPtr)
    {
        QColor *color = reinterpret_cast<QColor *>(static_cast<uintptr_t>(colorPtr));
        return reinterpret_cast<long>(new QPen(*color));
    }
    long nativePenCreateWithStyle(int style)
    {
        return reinterpret_cast<long>(new QPen(Qt::PenStyle(style)));
    }
    void nativePenDelete(long ptr)
    {
        QPen *instance = reinterpret_cast<QPen *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativePenSetWidth(long ptr, int width)
    {
        QPen *instance = reinterpret_cast<QPen *>(static_cast<uintptr_t>(ptr));
        instance->setWidth(width);
    }
    void nativePenSetWidthF(long ptr, double width)
    {
        QPen *instance = reinterpret_cast<QPen *>(static_cast<uintptr_t>(ptr));
        instance->setWidthF(width);
    }
    void nativePenSetColor(long ptr, const long colorPtr)
    {
        QPen *instance = reinterpret_cast<QPen *>(static_cast<uintptr_t>(ptr));
        QColor *color = reinterpret_cast<QColor *>(static_cast<uintptr_t>(colorPtr));
        instance->setColor(*color);
    }
}