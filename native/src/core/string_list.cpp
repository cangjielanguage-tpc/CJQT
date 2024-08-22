#include <QStringList>

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
}