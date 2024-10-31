#include "abstract_item_view.h"
#include <QDebug>
#include <QPushButton>
#include <QStandardItemModel>
extern "C"
{
    void nativeAbstractItemViewSetModel(uintptr_t ptr, uintptr_t modelPtr)
    {
        QAbstractItemView *instance = reinterpret_cast<QAbstractItemView *>(static_cast<uintptr_t>(ptr));
        QAbstractItemModel *model = reinterpret_cast<QAbstractItemModel *>(static_cast<uintptr_t>(modelPtr));
        instance->setModel(model);
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

    void nativeAbstractItemViewSetSelectionBehavior(uintptr_t ptr, int behavior)
    {
        QAbstractItemView *instance = reinterpret_cast<QAbstractItemView *>(static_cast<uintptr_t>(ptr));
        return instance->setSelectionBehavior(QAbstractItemView::SelectionBehavior(behavior));
    }

    uintptr_t nativeAbstractItemViewSelectionModel(uintptr_t ptr)
    {
        QAbstractItemView *instance = reinterpret_cast<QAbstractItemView *>(static_cast<uintptr_t>(ptr));
        QItemSelectionModel *model= instance->selectionModel();
        return reinterpret_cast<uintptr_t>(model);
    }

    void nativeAbstractItemViewConnectClicked(uintptr_t ptr, uintptr_t code, nativeConnectCallbackPointer callback)
    {
        QAbstractItemView *instance = reinterpret_cast<QAbstractItemView *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QAbstractItemView::clicked, [=](QModelIndex index)
        {
            QModelIndex *modelIndex=new QModelIndex(index);
            void* voidPtr = reinterpret_cast<void*>(modelIndex);
            callback(code, (void*)voidPtr);

        });
    }
    
    uintptr_t nativeAbstractItemViewCurrentIndex(uintptr_t ptr){
        QAbstractItemView *instance = reinterpret_cast<QAbstractItemView *>(static_cast<uintptr_t>(ptr));
        QModelIndex modelIndex = instance->currentIndex();
        QModelIndex *model = new QModelIndex(modelIndex);
        return reinterpret_cast<uintptr_t>(model);
    }
    void nativeAbstractItemViewSetIndexWidget(uintptr_t ptr,int indexRow,int indexCol,uintptr_t widgetPtr){
        QAbstractItemView *instance = reinterpret_cast<QAbstractItemView *>(static_cast<uintptr_t>(ptr));
        QWidget *widget = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(widgetPtr));

        QAbstractItemModel *model = instance->model();
        QModelIndex modelIndex = model->index(indexRow,indexCol);
        instance->setIndexWidget( modelIndex,widget);
    }
}
