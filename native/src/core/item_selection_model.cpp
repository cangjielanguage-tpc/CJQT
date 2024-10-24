#include "abstract_item_model.h"
#include<QItemSelectionModel>
#include<QDebug>
#include "object.h"

extern "C"
{
  bool nativeItemSelectionModelHasSelection(uintptr_t ptr)
  {

      QItemSelectionModel *obj = reinterpret_cast<QItemSelectionModel *>(static_cast<uintptr_t>(ptr));
      bool b= obj->hasSelection();
      qDebug()<<"cpp:b:"<<b<<endl;
      return b;
  }

}
