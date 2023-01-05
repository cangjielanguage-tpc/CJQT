#include <QStringListModel>

extern "C"
{
    long nativeStringListModelCreate(long listPtr)
    {
        QStringListModel *model;
        if (listPtr == 0L)
        {
            model = new QStringListModel();
        }
        else
        {
            QStringList *list = reinterpret_cast<QStringList *>(static_cast<uintptr_t>(listPtr));
            model = new QStringListModel(*list);
        }
        return reinterpret_cast<long>(model);
    }

    void nativeStringListModelDelete(long ptr)
    {
        QStringListModel *instance = reinterpret_cast<QStringListModel *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativeStringListModelSetStringList(long ptr, long listPtr)
    {
        QStringListModel *instance = reinterpret_cast<QStringListModel *>(static_cast<uintptr_t>(ptr));
        QStringList *list = reinterpret_cast<QStringList *>(static_cast<uintptr_t>(listPtr));
        instance->setStringList(*list);
    }

    long nativeStringListModelStringList(long ptr, long listPtr)
    {
        QStringListModel *instance = reinterpret_cast<QStringListModel *>(static_cast<uintptr_t>(ptr));
        QStringList list = instance->stringList();
        return reinterpret_cast<long>(&list);
    }

    int nativeStringListModelRowCount(long ptr, long parentPtr)
    {
        QStringListModel *instance = reinterpret_cast<QStringListModel *>(static_cast<uintptr_t>(ptr));
        QModelIndex *parent = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(parentPtr));
        return instance->rowCount(*parent);
    }

    long nativeStringListModelData(long ptr, long parentPtr, int role)
    {
        QStringListModel *instance = reinterpret_cast<QStringListModel *>(static_cast<uintptr_t>(ptr));
        QModelIndex *parent = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(parentPtr));
        QVariant variant = instance->data(*parent, role);
        return reinterpret_cast<long>(&variant);
    }
}