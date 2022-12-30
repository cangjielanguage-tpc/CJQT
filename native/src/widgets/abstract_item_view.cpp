#include "abstract_item_view.h"

extern "C"
{
    void nativeAbstractItemViewSetModel(long ptr, long modelPtr)
    {
        QAbstractItemView *instance = reinterpret_cast<QAbstractItemView *>(static_cast<uintptr_t>(ptr));
        QAbstractItemModel *model = reinterpret_cast<QAbstractItemModel *>(static_cast<uintptr_t>(modelPtr));
        return instance->setModel(model);
    }

    long nativeAbstractItemViewModel(long ptr)
    {
        QAbstractItemView *instance = reinterpret_cast<QAbstractItemView *>(static_cast<uintptr_t>(ptr));
        QAbstractItemModel *model = instance->model();
        return reinterpret_cast<long>(model);
    }

    void nativeAbstractItemViewSetItemDelegate(long ptr, long delegatePtr)
    {
        QAbstractItemView *instance = reinterpret_cast<QAbstractItemView *>(static_cast<uintptr_t>(ptr));
        QAbstractItemDelegate *delegate = reinterpret_cast<QAbstractItemDelegate *>(static_cast<uintptr_t>(delegatePtr));
        return instance->setItemDelegate(delegate);
    }

    long nativeAbstractItemViewItemDelegate(long ptr)
    {
        QAbstractItemView *instance = reinterpret_cast<QAbstractItemView *>(static_cast<uintptr_t>(ptr));
        QAbstractItemDelegate *delegate = instance->itemDelegate();
        return reinterpret_cast<long>(delegate);
    }
}