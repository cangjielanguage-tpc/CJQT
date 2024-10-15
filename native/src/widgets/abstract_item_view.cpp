#include "abstract_item_view.h"
#include <QDebug>
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

    void nativeAbstractItemViewSetSelectionBehavior(uintptr_t ptr, int behavior)
    {
        QAbstractItemView *instance = reinterpret_cast<QAbstractItemView *>(static_cast<uintptr_t>(ptr));
        return instance->setSelectionBehavior(QAbstractItemView::SelectionBehavior(behavior));
    }


    void nativeAbstractItemViewConnectClicked(uintptr_t ptr, uintptr_t code, nativeConnectCallbackPointer callback)
    {
        QAbstractItemView *instance = reinterpret_cast<QAbstractItemView *>(static_cast<uintptr_t>(ptr));
        QObject::connect(instance, &QAbstractItemView::clicked, [=](QModelIndex index)
        {

//            QModelIndex *p=new QModelIndex(index);

//            callback(code, (void *)p);

            QModelIndex *modelIndex=new QModelIndex(index);
//            qDebug()<<"^^^^^^^^^^^^"<<(void *)reinterpret_cast<uintptr_t>(modelIndex)<<endl;
//            qDebug()<<"^^^^^^^^^^^^"<<reinterpret_cast<void *>(modelIndex)<<endl;
//            return reinterpret_cast<uintptr_t>(p);
//            callback(code,  (void *)&index);
//            uintptr_t p=reinterpret_cast<uintptr_t>(modelIndex);
//            uintptr_t *value=&p;
//            qDebug()<<reinterpret_cast<void*>(modelIndex)<<endl;
            void* voidPtr = reinterpret_cast<void*>(modelIndex);
//            println(voidPtr)
            callback(code, (void*)voidPtr);

        });
    }
}
