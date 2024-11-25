#include <QIcon>

extern "C"
{
    uintptr_t nativeIconCreate()
    {
        return reinterpret_cast<uintptr_t>(new QIcon());
    }

    uintptr_t nativeIconCreateWithFileName(const char *fileName)
    {
        return reinterpret_cast<uintptr_t>(new QIcon(fileName));
    }

    uintptr_t nativeIconCreateWithOtherIcon(uintptr_t iconPtr)
    {
        QIcon *instance = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(iconPtr));
        return reinterpret_cast<uintptr_t>(new QIcon(*instance));
    }

    const char *nativeIconGetName(uintptr_t ptr)
    {
        QIcon *instance = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(ptr));
        QString str = instance->name();
        return qstrdup(str.toUtf8());
    }

    bool nativeIconIsNull(uintptr_t ptr)
    {
        QIcon *instance = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(ptr));
        return instance->isNull();
    }

    bool nativeIconIsMask(uintptr_t ptr)
    {
        QIcon *instance = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(ptr));
        return instance->isMask();
    }

    bool nativeIconIsDetached(uintptr_t ptr)
    {
        QIcon *instance = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(ptr));
        return instance->isDetached();
    }

    void nativeIconDetach(uintptr_t ptr)
    {
        QIcon *instance = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(ptr));
        instance->detach();
    }

    void nativeIconDelete(uintptr_t ptr)
    {
        QIcon *instance = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}