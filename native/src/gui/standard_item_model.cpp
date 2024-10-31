#include "standard_item_model.h"

extern "C"
{
    uintptr_t nativeStandardItemModelCreate(uintptr_t parentPtr){
        QStandardItemModel *itemModel;
        if (parentPtr == 0L)
        {
            itemModel = new QStandardItemModel();
        }
        else
        {
            QObject *parent = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
            itemModel = new QStandardItemModel(parent);
        }
        return reinterpret_cast<uintptr_t>(itemModel);
    }

    uintptr_t nativeStandardItemModelCreateRC(int rows,int columns,uintptr_t parentPtr){
        QStandardItemModel *itemModel;
        if (parentPtr == 0L)
        {
            itemModel = new QStandardItemModel(rows,columns);
        }
        else
        {
            QObject *parent = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
            itemModel = new QStandardItemModel(rows,columns,parent);
        }
//        QStandardItem *item=new QStandardItem("123");
//        itemModel->setItem(0,0,item);
        return reinterpret_cast<uintptr_t>(itemModel);

    }
    void nativeStandardItemModelDelete(uintptr_t ptr){
        QStandardItemModel *parent = reinterpret_cast<QStandardItemModel *>(static_cast<uintptr_t>(ptr));
        delete parent;
    }
    
    uintptr_t nativeStandardItemModelItem(uintptr_t ptr,int row,int column){
        QStandardItemModel *model = reinterpret_cast<QStandardItemModel *>(static_cast<uintptr_t>(ptr));
        QStandardItem *item=model->item(row,column);
        return reinterpret_cast<uintptr_t>(item);
    }
    void nativeStandardItemModelSetItem(uintptr_t ptr,int rows,int columns,uintptr_t itemPtr){
        QStandardItem *item = reinterpret_cast<QStandardItem *>(static_cast<uintptr_t>(itemPtr));
        QStandardItemModel *model = reinterpret_cast<QStandardItemModel *>(static_cast<uintptr_t>(ptr));
        model->setItem(rows,columns,item);
    }

    void nativeStandardItemModelSetHorizontalHeaderLabels(uintptr_t ptr,uintptr_t labelsPtr){
        QStandardItemModel *model = reinterpret_cast<QStandardItemModel *>(static_cast<uintptr_t>(ptr));
        QStringList *labels = reinterpret_cast<QStringList *>(static_cast<uintptr_t>(labelsPtr));
        model->setHorizontalHeaderLabels(*labels);
    }

    void nativeStandardItemModelSetVerticalHeaderLabels(uintptr_t ptr,uintptr_t labelsPtr){
        QStandardItemModel *model = reinterpret_cast<QStandardItemModel *>(static_cast<uintptr_t>(ptr));
        QStringList *labels = reinterpret_cast<QStringList *>(static_cast<uintptr_t>(labelsPtr));
        model->setVerticalHeaderLabels(*labels);
    }

    uintptr_t nativeStandardItemModelRemoveColumn(uintptr_t ptr,int column )
    {

        QStandardItemModel *itemModel = reinterpret_cast<QStandardItemModel *>(static_cast<uintptr_t>(ptr));
        itemModel->removeColumn(column);
    };

    uintptr_t nativeStandardItemModelRemoveColumns(uintptr_t ptr,int column,int count )
    {

        QStandardItemModel *itemModel = reinterpret_cast<QStandardItemModel *>(static_cast<uintptr_t>(ptr));
        itemModel->removeColumns(column,count);
    };
    uintptr_t nativeStandardItemModelRemoveRow(uintptr_t ptr,int row )
    {

        QStandardItemModel *itemModel = reinterpret_cast<QStandardItemModel *>(static_cast<uintptr_t>(ptr));
        itemModel->removeRow(row);
    };
    uintptr_t nativeStandardItemModelRemoveRows(uintptr_t ptr,int row,int count )
    {

        QStandardItemModel *itemModel = reinterpret_cast<QStandardItemModel *>(static_cast<uintptr_t>(ptr));
        itemModel->removeRows(row,count);
    };
    
    void nativeStandardItemModelAppendRowItems(uintptr_t ptr,uintptr_t itemsPtr){

        QStandardItemModel *model = reinterpret_cast<QStandardItemModel *>(static_cast<uintptr_t>(ptr));
        QStringList *strs = reinterpret_cast<QStringList *>(static_cast<uintptr_t>(itemsPtr));
        QList<QStandardItem*> items;
        for(const QString& str:*strs){
            QStandardItem* item=new QStandardItem(str);
            items.append(item);
        }
        model->appendRow(items);
        
    };
    
    void nativeStandardItemModelAppendRow(uintptr_t ptr,uintptr_t itemPtr){

        QStandardItemModel *model = reinterpret_cast<QStandardItemModel *>(static_cast<uintptr_t>(ptr));
        QStandardItem *item = reinterpret_cast<QStandardItem *>(static_cast<uintptr_t>(itemPtr));
        model->appendRow(item);
        
    };
    void nativeStandardItemModelAppendColumn(uintptr_t ptr,uintptr_t itemsPtr){
        QStandardItemModel *model = reinterpret_cast<QStandardItemModel *>(static_cast<uintptr_t>(ptr));
        QStringList *strs = reinterpret_cast<QStringList *>(static_cast<uintptr_t>(itemsPtr));
        QList<QStandardItem*> items;
        for(const QString& str:*strs){
            QStandardItem* item=new QStandardItem(str);
            items.append(item);
        }
        model->appendColumn(items);
    };
    void nativeStandardItemModelInsertRow(uintptr_t ptr,int row,uintptr_t itemsPtr) {
        QStandardItemModel *model = reinterpret_cast<QStandardItemModel *>(static_cast<uintptr_t>(ptr));
        QStringList *strs = reinterpret_cast<QStringList *>(static_cast<uintptr_t>(itemsPtr));
        QList<QStandardItem*> items;
        for(const QString& str:*strs){
            QStandardItem* item=new QStandardItem(str);
            items.append(item);
        }
        model->insertRow(row,items);
    };
    void nativeStandardItemModelInsertColumn(uintptr_t ptr,int column,uintptr_t itemsPtr){
        QStandardItemModel *model = reinterpret_cast<QStandardItemModel *>(static_cast<uintptr_t>(ptr));
        QStringList *strs = reinterpret_cast<QStringList *>(static_cast<uintptr_t>(itemsPtr));
        QList<QStandardItem*> items;
        for(const QString& str:*strs){
            QStandardItem* item=new QStandardItem(str);
            items.append(item);
        }
        model->insertColumn(column,items);
    };
    uintptr_t nativeStandardItemModelItemFromIndex(uintptr_t ptr,uintptr_t indexPtr){
        QStandardItemModel *model = reinterpret_cast<QStandardItemModel *>(static_cast<uintptr_t>(ptr));
        QModelIndex *modelIndex = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(indexPtr));
        QStandardItem *item=model->itemFromIndex(*modelIndex);
        return reinterpret_cast<uintptr_t>(item);

    };
}
