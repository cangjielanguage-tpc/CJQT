#include <QIcon>

extern "C"
{
    long nativeIconCreate()
    {
        return reinterpret_cast<long>(new QIcon());
    }

    long nativeIconCreateWithFileName(const char *fileName)
    {
        return reinterpret_cast<long>(new QIcon(fileName));
    }

    long nativeIconCreateWithOtherIcon(long iconPtr)
    {
        QIcon *instance = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(iconPtr));
        return reinterpret_cast<long>(new QIcon(*instance));
    }

    const char *nativeIconGetName(long ptr)
    {
        QIcon *instance = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(ptr));
        QString str = instance->name();
        return qstrdup(str.toUtf8());
    }

    bool nativeIconIsNull(long ptr)
    {
        QIcon *instance = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(ptr));
        return instance->isNull();
    }

    bool nativeIconIsMask(long ptr)
    {
        QIcon *instance = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(ptr));
        return instance->isMask();
    }

    bool nativeIconIsDetached(long ptr)
    {
        QIcon *instance = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(ptr));
        return instance->isDetached();
    }

    void nativeIconDetach(long ptr)
    {
        QIcon *instance = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(ptr));
        instance->detach();
    }

    void nativeIconDelete(long ptr)
    {
        QIcon *instance = reinterpret_cast<QIcon *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }
}