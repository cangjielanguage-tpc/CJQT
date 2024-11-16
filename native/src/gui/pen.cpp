#include <QPen>
#include <QColor>

extern "C"
{
    uintptr_t nativePenCreate(uintptr_t colorPtr, double thickness)
    {
        QColor *color = reinterpret_cast<QColor *>(static_cast<uintptr_t>(colorPtr));
        return reinterpret_cast<uintptr_t>(new QPen(*color, thickness, Qt::SolidLine));
    }
    uintptr_t nativePenCreateWithColor(uintptr_t colorPtr)
    {
        QColor *color = reinterpret_cast<QColor *>(static_cast<uintptr_t>(colorPtr));
        return reinterpret_cast<uintptr_t>(new QPen(*color));
    }
    uintptr_t nativePenCreateWithStyle(int style)
    {
        return reinterpret_cast<uintptr_t>(new QPen(Qt::PenStyle(style)));
    }
    void nativePenDelete(uintptr_t ptr)
    {
        QPen *instance = reinterpret_cast<QPen *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativePenSetWidth(uintptr_t ptr, int width)
    {
        QPen *instance = reinterpret_cast<QPen *>(static_cast<uintptr_t>(ptr));
        instance->setWidth(width);
    }
    void nativePenSetWidthF(uintptr_t ptr, double width)
    {
        QPen *instance = reinterpret_cast<QPen *>(static_cast<uintptr_t>(ptr));
        instance->setWidthF(width);
    }
    void nativePenSetColor(uintptr_t ptr, const uintptr_t colorPtr)
    {
        QPen *instance = reinterpret_cast<QPen *>(static_cast<uintptr_t>(ptr));
        QColor *color = reinterpret_cast<QColor *>(static_cast<uintptr_t>(colorPtr));
        instance->setColor(*color);
    }
}