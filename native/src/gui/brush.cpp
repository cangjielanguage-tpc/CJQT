#include <QBrush>
#include <QColor>
#include <QGradient>
#include <QDebug>

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
            QColor color(colorPtr);
            QBrush *brush = new QBrush(color);
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
    uintptr_t nativeBrushCreateWithGradient(uintptr_t gradientPtr)
    {
        QGradient *gradient = reinterpret_cast<QGradient *>(static_cast<uintptr_t>(gradientPtr));
        return reinterpret_cast<uintptr_t>(new QBrush(*gradient));
    }
    void nativeBrushDelete(uintptr_t ptr)
    {
        QBrush *instance = reinterpret_cast<QBrush *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
    void nativeBrushSetColor(uintptr_t ptr,quint32 colorPtr)
    {
        QBrush *instance = reinterpret_cast<QBrush *>(static_cast<uintptr_t>(ptr));
        QColor color(colorPtr);
        instance->setColor(color);
    }

    quint32 nativeBrushColor(uintptr_t ptr)
    {
        QBrush *instance = reinterpret_cast<QBrush *>(ptr);
        return instance ->color().rgba();
    }
}
