#include <QBrush>
#include <QColor>

extern "C"
{
    uintptr_t nativeBrushCreate(quint32 colorPtr)
    {
//         QBrush *brush;
        // if (colorPtr == 0L)
        // {
        //     brush = new QBrush();
        // }
        // else
        // {
            QColor *color = new QColor(colorPtr);
            QBrush *brush = new QBrush(*color);
        // }
        return reinterpret_cast<uintptr_t>(brush);
    }
    uintptr_t nativeBrushCreateWithBrush(const uintptr_t brushPtr)
    {

        QBrush *oldBrush = reinterpret_cast<QBrush *>(static_cast<uintptr_t>(brushPtr));
        QBrush *brush = new QBrush(*oldBrush);
        return reinterpret_cast<uintptr_t>(brush);
    }
    uintptr_t nativeBrushCreateWithPixmap(const uintptr_t pixmapPtr)
    {
        QPixmap *pix = reinterpret_cast<QPixmap *>(static_cast<uintptr_t>(pixmapPtr));
        return reinterpret_cast<uintptr_t>(new QBrush(*pix));
    }
    void nativeBrushDelete(uintptr_t ptr)
    {
        QBrush *instance = reinterpret_cast<QBrush *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}