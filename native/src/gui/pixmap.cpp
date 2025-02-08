#include <QPixmap>

extern "C"
{
    uintptr_t nativePixmapCreate(const char *filepath)
    {
        QPixmap *pixmap = new QPixmap();
        int r = pixmap->load(filepath);
        if (r)
            return reinterpret_cast<uintptr_t>(pixmap);
        else
            return 0;
    }
    uintptr_t nativePixmapCreateWithWH(int w, int h)
    {
        QPixmap *pixmap = new QPixmap(w, h);
        return reinterpret_cast<uintptr_t>(pixmap);
    }
    int nativePixmapGetWidth(uintptr_t ptr)
    {
        QPixmap *instance = reinterpret_cast<QPixmap *>(static_cast<uintptr_t>(ptr));
        return instance->width();
    }
    int nativePixmapGetHeight(uintptr_t ptr)
    {
        QPixmap *instance = reinterpret_cast<QPixmap *>(static_cast<uintptr_t>(ptr));
        return instance->height();
    }

    void nativePixmapDelete(uintptr_t ptr)
    {
        QPixmap *instance = reinterpret_cast<QPixmap *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
    void nativePixmapFill(uintptr_t ptr, const quint32 colorPtr)
    {
        QPixmap *instance = reinterpret_cast<QPixmap *>(static_cast<uintptr_t>(ptr));
        QColor color = QColor(colorPtr);
        instance->fill(color);
    }
}