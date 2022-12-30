#include <QModelIndex>

extern "C"
{
    long nativeModelIndexCreate()
    {
        QModelIndex *event = new QModelIndex();
        return reinterpret_cast<long>(event);
    }

    void nativeModelIndexDelete(long ptr)
    {
        QModelIndex *instance = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    int nativeModelIndexRow(long ptr)
    {
        QModelIndex *instance = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(ptr));
        return instance->row();
    }

    int nativeModelIndexColumn(long ptr)
    {
        QModelIndex *instance = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(ptr));
        return instance->column();
    }

    long nativeModelIndexParent(long ptr)
    {
        QModelIndex *instance = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(ptr));
        QModelIndex parent = instance->parent();
        return reinterpret_cast<long>(&parent);
    }

    long nativeModelIndexSibling(long ptr, int row, int column)
    {
        QModelIndex *instance = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(ptr));
        QModelIndex sibling = instance->sibling(row, column);
        return reinterpret_cast<long>(&sibling);
    }

    long nativeModelIndexSiblingAtColumn(long ptr, int column)
    {
        QModelIndex *instance = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(ptr));
        QModelIndex sibling = instance->siblingAtColumn(column);
        return reinterpret_cast<long>(&sibling);
    }

    long nativeModelIndexSiblingAtRow(long ptr, int row)
    {
        QModelIndex *instance = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(ptr));
        QModelIndex sibling = instance->siblingAtRow(row);
        return reinterpret_cast<long>(&sibling);
    }

    long nativeModelIndexData(long ptr, int role = Qt::DisplayRole)
    {
        QModelIndex *instance = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(ptr));
        QVariant data = instance->data(Qt::ItemDataRole(role));
        return reinterpret_cast<long>(&data);
    }

    bool nativeModelIndexIsValid(long ptr)
    {
        QModelIndex *instance = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(ptr));
        return instance->isValid();
    }

    long nativeModelIndexModel(long ptr)
    {
        QModelIndex *instance = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(ptr));
        const QAbstractItemModel *model = instance->model();
        return reinterpret_cast<long>(model);
    }

}