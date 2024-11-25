#include "abstract_item_model.h"
#include<QModelIndex>
#include<QDebug>

extern "C"
{
  uintptr_t nativeAbstractItemModelIndex(uintptr_t ptr,int row,int column,uintptr_t parent)
  {

      QAbstractItemModel *obj = reinterpret_cast<QAbstractItemModel *>(static_cast<uintptr_t>(ptr));
      QModelIndex *p =new QModelIndex();
      if(parent>0){
        p = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(parent));
      }
      QModelIndex model = obj->index(row,column, *p);
      uintptr_t a= reinterpret_cast<uintptr_t>(&model);
      qDebug()<<"cpp:a:"<<a<<endl;
      return a;
  }

  uintptr_t nativeAbstractItemModelData(uintptr_t ptr,uintptr_t index, int role = Qt::DisplayRole)
  {
      QAbstractItemModel *instance = reinterpret_cast<QAbstractItemModel *>(static_cast<uintptr_t>(ptr));
      QModelIndex *modelIndex = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(index));
      QVariant data = instance->data(*modelIndex, role);
      uintptr_t a=  reinterpret_cast<uintptr_t>(&data);
      qDebug()<<"cpp:b:"<<a<<endl;
      return a;
  }
}
