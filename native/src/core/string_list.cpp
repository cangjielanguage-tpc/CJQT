#include <QStringList>

extern "C"
{
    long nativeStringListCreate()
    {
        QStringList *event = new QStringList();
        return reinterpret_cast<long>(event);
    }

    void nativeStringListDelete(long ptr)
    {
        QStringList *instance = reinterpret_cast<QStringList *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativeStringListAppend(long ptr, char *data)
    {
        QStringList *instance = reinterpret_cast<QStringList *>(static_cast<uintptr_t>(ptr));
        instance->append(QString(data));
    }
}