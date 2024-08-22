#include <QStringListModel>

extern "C"
{
    uintptr_t nativeStringListModelCreate(uintptr_t listPtr)
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
        return reinterpret_cast<uintptr_t>(model);
    }

    void nativeStringListModelDelete(uintptr_t ptr)
    {
        QStringListModel *instance = reinterpret_cast<QStringListModel *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativeStringListModelSetStringList(uintptr_t ptr, uintptr_t listPtr)
    {
        QStringListModel *instance = reinterpret_cast<QStringListModel *>(static_cast<uintptr_t>(ptr));
        QStringList *list = reinterpret_cast<QStringList *>(static_cast<uintptr_t>(listPtr));
        instance->setStringList(*list);
    }

    uintptr_t nativeStringListModelStringList(uintptr_t ptr, uintptr_t listPtr)
    {
        QStringListModel *instance = reinterpret_cast<QStringListModel *>(static_cast<uintptr_t>(ptr));
        QStringList list = instance->stringList();
        return reinterpret_cast<uintptr_t>(&list);
    }

    int nativeStringListModelRowCount(uintptr_t ptr, uintptr_t parentPtr)
    {
        QStringListModel *instance = reinterpret_cast<QStringListModel *>(static_cast<uintptr_t>(ptr));
        QModelIndex *parent = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(parentPtr));
        return instance->rowCount(*parent);
    }

    uintptr_t nativeStringListModelData(uintptr_t ptr, uintptr_t parentPtr, int role)
    {
        QStringListModel *instance = reinterpret_cast<QStringListModel *>(static_cast<uintptr_t>(ptr));
        QModelIndex *parent = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(parentPtr));
        QVariant variant = instance->data(*parent, role);
        return reinterpret_cast<uintptr_t>(&variant);
    }
}