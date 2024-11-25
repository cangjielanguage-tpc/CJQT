#include <QSize>

extern "C"
{
    uintptr_t nativeSizeCreate()
    {
        QSize *size = new QSize();
        return reinterpret_cast<uintptr_t>(size);
    }
    uintptr_t nativeSizeCreateWithWidth(int width, int height)
    {
        QSize *size = new QSize(width, height);
        return reinterpret_cast<uintptr_t>(size);
    }
    void nativeSizeDelete(uintptr_t ptr)
    {
        QSize *instance = reinterpret_cast<QSize *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    int nativeSizeWidth(uintptr_t ptr)
    {
        QSize *instance = reinterpret_cast<QSize *>(static_cast<uintptr_t>(ptr));
        return instance->width();
    }

    int nativeSizeHeight(uintptr_t ptr)
    {
        QSize *instance = reinterpret_cast<QSize *>(static_cast<uintptr_t>(ptr));
        return instance->height();
    }

    bool nativeSizeIsNull(uintptr_t ptr)
    {
        QSize *instance = reinterpret_cast<QSize *>(static_cast<uintptr_t>(ptr));
        return instance->isNull();
    }

    bool nativeSizeIsEmpty(uintptr_t ptr)
    {
        QSize *instance = reinterpret_cast<QSize *>(static_cast<uintptr_t>(ptr));
        return instance->isEmpty();
    }

    bool nativeSizeIsValid(uintptr_t ptr)
    {
        QSize *instance = reinterpret_cast<QSize *>(static_cast<uintptr_t>(ptr));
        return instance->isValid();
    }
}