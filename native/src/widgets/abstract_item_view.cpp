#include "abstract_item_view.h"

extern "C"
{
    void nativeAbstractItemViewSetModel(uintptr_t ptr, uintptr_t modelPtr)
    {
        QAbstractItemView *instance = reinterpret_cast<QAbstractItemView *>(static_cast<uintptr_t>(ptr));
        QAbstractItemModel *model = reinterpret_cast<QAbstractItemModel *>(static_cast<uintptr_t>(modelPtr));
        return instance->setModel(model);
    }

    uintptr_t nativeAbstractItemViewModel(uintptr_t ptr)
    {
        QAbstractItemView *instance = reinterpret_cast<QAbstractItemView *>(static_cast<uintptr_t>(ptr));
        QAbstractItemModel *model = instance->model();
        return reinterpret_cast<uintptr_t>(model);
    }

    void nativeAbstractItemViewSetItemDelegate(uintptr_t ptr, uintptr_t delegatePtr)
    {
        QAbstractItemView *instance = reinterpret_cast<QAbstractItemView *>(static_cast<uintptr_t>(ptr));
        QAbstractItemDelegate *delegate = reinterpret_cast<QAbstractItemDelegate *>(static_cast<uintptr_t>(delegatePtr));
        return instance->setItemDelegate(delegate);
    }

    uintptr_t nativeAbstractItemViewItemDelegate(uintptr_t ptr)
    {
        QAbstractItemView *instance = reinterpret_cast<QAbstractItemView *>(static_cast<uintptr_t>(ptr));
        QAbstractItemDelegate *delegate = instance->itemDelegate();
        return reinterpret_cast<uintptr_t>(delegate);
    }
}