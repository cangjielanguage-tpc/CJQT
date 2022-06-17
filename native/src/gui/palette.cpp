#include <QPalette>

extern "C"
{
    long nativePaletteCreate()
    {
        return reinterpret_cast<long>(new QPalette());
    }

    long nativePaletteCreateForColor(long colorPtr)
    {
        QColor *color = reinterpret_cast<QColor *>(static_cast<uintptr_t>(colorPtr));
        return reinterpret_cast<long>(new QPalette(*color));
    }

    long nativePaletteCreateForPalette(long palettePtr)
    {
        QPalette *palette = reinterpret_cast<QPalette *>(static_cast<uintptr_t>(palettePtr));
        return reinterpret_cast<long>(new QPalette(*palette));
    }

    void nativePaletteDelete(long ptr)
    {
        QPalette *instance = reinterpret_cast<QPalette *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}