#include <QBrush>
#include <QColor>

extern "C"
{
    long nativeBrushCreate(long colorPtr)
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
    long nativeBrushCreateWithBrush(const long brushPtr)
    {

        QBrush *oldBrush = reinterpret_cast<QBrush *>(static_cast<uintptr_t>(brushPtr));
        QBrush *brush = new QBrush(*oldBrush);
        return reinterpret_cast<long>(brush);
    }
    long nativeBrushCreateWithPixmap(const long pixmapPtr)
    {
        QPixmap *pix = reinterpret_cast<QPixmap *>(static_cast<uintptr_t>(pixmapPtr));
        return reinterpret_cast<long>(new QBrush(*pix));
    }
    void nativeBrushDelete(long ptr)
    {
        QBrush *instance = reinterpret_cast<QBrush *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}