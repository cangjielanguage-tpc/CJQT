#include <QStringList>
#include "native_string.h"

extern "C"
{
    uintptr_t nativeStringListCreate()
    {
        QStringList *event = new QStringList();
        return reinterpret_cast<uintptr_t>(event);
    }

    void nativeStringListDelete(uintptr_t ptr)
    {
        QStringList *instance = reinterpret_cast<QStringList *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativeStringListAppend(uintptr_t ptr, char *data)
    {
        QStringList *instance = reinterpret_cast<QStringList *>(static_cast<uintptr_t>(ptr));
        instance->append(QString(data));
    }

    int nativeStringListCount(uintptr_t ptr)
    {
        QStringList *instance = reinterpret_cast<QStringList *>(static_cast<uintptr_t>(ptr));
        return instance->size();
    }

    char *nativeStringListAt(uintptr_t ptr, int index)
    {
        QStringList *instance = reinterpret_cast<QStringList *>(static_cast<uintptr_t>(ptr));
        return cjqt_to_cstring(instance->at(index));
    }

    bool nativeStringListIsEmpty(uintptr_t ptr)
    {
        QStringList *instance = reinterpret_cast<QStringList *>(static_cast<uintptr_t>(ptr));
        return instance->isEmpty();
    }

    void nativeStringListClear(uintptr_t ptr)
    {
        QStringList *instance = reinterpret_cast<QStringList *>(static_cast<uintptr_t>(ptr));
        instance->clear();
    }
}
