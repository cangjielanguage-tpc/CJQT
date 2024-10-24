#include <QModelIndex>

extern "C"
{
    uintptr_t nativeModelIndexCreate()
    {
        QModelIndex *event = new QModelIndex();
        return reinterpret_cast<uintptr_t>(event);
    }

    void nativeModelIndexDelete(uintptr_t ptr)
    {
        QModelIndex *instance = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    int nativeModelIndexRow(uintptr_t ptr)
    {
        QModelIndex *instance = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(ptr));
        return instance->row();
    }

    int nativeModelIndexColumn(uintptr_t ptr)
    {
        QModelIndex *instance = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(ptr));
        return instance->column();
    }

    uintptr_t nativeModelIndexParent(uintptr_t ptr)
    {
        QModelIndex *instance = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(ptr));
        QModelIndex parent = instance->parent();
        return reinterpret_cast<uintptr_t>(&parent);
    }

    uintptr_t nativeModelIndexSibling(uintptr_t ptr, int row, int column)
    {
        QModelIndex *instance = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(ptr));
        QModelIndex sibling = instance->sibling(row, column);
        return reinterpret_cast<uintptr_t>(&sibling);
    }

    uintptr_t nativeModelIndexSiblingAtColumn(uintptr_t ptr, int column)
    {
        QModelIndex *instance = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(ptr));
        QModelIndex sibling = instance->siblingAtColumn(column);
        return reinterpret_cast<uintptr_t>(&sibling);
    }

    uintptr_t nativeModelIndexSiblingAtRow(uintptr_t ptr, int row)
    {
        QModelIndex *instance = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(ptr));
        QModelIndex sibling = instance->siblingAtRow(row);
        return reinterpret_cast<uintptr_t>(&sibling);
    }

    bool nativeModelIndexIsValid(uintptr_t ptr)
    {
        QModelIndex *instance = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(ptr));
        return instance->isValid();
    }

    uintptr_t nativeModelIndexModel(uintptr_t ptr)
    {
        QModelIndex *instance = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(ptr));
        const QAbstractItemModel *model = instance->model();
        return reinterpret_cast<uintptr_t>(model);
    }

}
