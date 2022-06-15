#include <QBrush>
#include <QColor>

extern "C"
{
    long nativeBrushCreate(long colorPtr, int thickness)
    {
        QBrush *brush;
        if (colorPtr == 0L)
        {
            brush = new QBrush();
        }
        else
        {
            QColor *color = reinterpret_cast<QColor *>(static_cast<uintptr_t>(colorPtr));
            brush = new QBrush(*color);
        }
        return reinterpret_cast<long>(brush);
    }

    void nativeBrushDelete(long ptr)
    {
        QBrush *instance = reinterpret_cast<QBrush *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}