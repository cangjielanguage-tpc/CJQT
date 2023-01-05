#include <QSize>

extern "C"
{
    long nativeSizeCreate()
    {
        QSize *size = new QSize();
        return reinterpret_cast<long>(size);
    }
    long nativeSizeCreateWithWidth(int width, int height)
    {
        QSize *size = new QSize(width, height);
        return reinterpret_cast<long>(size);
    }
    void nativeSizeDelete(long ptr)
    {
        QSize *instance = reinterpret_cast<QSize *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    int nativeSizeWidth(long ptr)
    {
        QSize *instance = reinterpret_cast<QSize *>(static_cast<uintptr_t>(ptr));
        return instance->width();
    }

    int nativeSizeHeight(long ptr)
    {
        QSize *instance = reinterpret_cast<QSize *>(static_cast<uintptr_t>(ptr));
        return instance->height();
    }

    bool nativeSizeIsNull(long ptr)
    {
        QSize *instance = reinterpret_cast<QSize *>(static_cast<uintptr_t>(ptr));
        return instance->isNull();
    }

    bool nativeSizeIsEmpty(long ptr)
    {
        QSize *instance = reinterpret_cast<QSize *>(static_cast<uintptr_t>(ptr));
        return instance->isEmpty();
    }

    bool nativeSizeIsValid(long ptr)
    {
        QSize *instance = reinterpret_cast<QSize *>(static_cast<uintptr_t>(ptr));
        return instance->isValid();
    }
}