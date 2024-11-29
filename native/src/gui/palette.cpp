#include <QPalette>

extern "C"
{
    uintptr_t nativePaletteCreate()
    {
        return reinterpret_cast<uintptr_t>(new QPalette());
    }

    uintptr_t nativePaletteCreateForColor(uintptr_t colorPtr)
    {
        QColor color = QColor(colorPtr);
        return reinterpret_cast<uintptr_t>(new QPalette(color));
    }

    uintptr_t nativePaletteCreateForPalette(uintptr_t palettePtr)
    {
        QPalette *palette = reinterpret_cast<QPalette *>(static_cast<uintptr_t>(palettePtr));
        return reinterpret_cast<uintptr_t>(new QPalette(*palette));
    }

    void nativePaletteSetColor(uintptr_t ptr, int colorRole, quint32 colorPtr)
    {
        QPalette *instance = reinterpret_cast<QPalette *>(static_cast<uintptr_t>(ptr));
        QColor color = QColor(colorPtr);
        instance->setColor(QPalette::ColorRole(colorRole), color);
    }

    void nativePaletteDelete(uintptr_t ptr)
    {
        QPalette *instance = reinterpret_cast<QPalette *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}
