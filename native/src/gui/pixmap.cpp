#include <QPixmap>

extern "C"
{
    long nativePixmapCreate(const char *filepath)
    {
        QPixmap *pixmap = new QPixmap();
        int r = pixmap->load(filepath);
        if (r)
            return reinterpret_cast<long>(pixmap);
        else
            return 0;
    }

    int nativePixmapGetWidth(long ptr)
    {
        QPixmap *instance = reinterpret_cast<QPixmap *>(static_cast<uintptr_t>(ptr));
        return instance->width();
    }
    int nativePixmapGetHeight(long ptr)
    {
        QPixmap *instance = reinterpret_cast<QPixmap *>(static_cast<uintptr_t>(ptr));
        return instance->height();
    }

    void nativePixmapDelete(long ptr)
    {
        QPixmap *instance = reinterpret_cast<QPixmap *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}