#include <QPen>
#include <QColor>

extern "C"
{
    long nativePenCreate(long colorPtr, int thickness)
    {
        QColor *color = reinterpret_cast<QColor *>(static_cast<uintptr_t>(colorPtr));
        return reinterpret_cast<long>(new QPen(*color, thickness, Qt::SolidLine));
    }

    void nativePenDelete(long ptr)
    {
        QPen *instance = reinterpret_cast<QPen *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}