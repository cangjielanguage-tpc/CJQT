#include <QHeaderView>
#include "object.h"

extern "C"
{
   uintptr_t nativeHeaderViewCreate(int orientation,uintptr_t parentPtr)
   {
       QWidget *instance = reinterpret_cast<QWidget *>(static_cast<uintptr_t>(parentPtr));
       QHeaderView *header= new QHeaderView(Qt::Orientation(orientation),instance);

       return reinterpret_cast<uintptr_t>(header);
   }
   uintptr_t nativeHeaderViewDelete(uintptr_t parentPtr){
       QHeaderView *instance = reinterpret_cast<QHeaderView *>(static_cast<uintptr_t>(parentPtr));
       delete instance;
   }

   void nativeHeaderViewSetSectionResizeMode(uintptr_t ptr,int index,int resizeMode){
       QHeaderView *instance = reinterpret_cast<QHeaderView *>(static_cast<uintptr_t>(ptr));
       instance->setSectionResizeMode(index,QHeaderView::ResizeMode(resizeMode));

   }
   void nativeHeaderViewResizeSection(uintptr_t ptr,int index,int size){
       QHeaderView *instance = reinterpret_cast<QHeaderView *>(static_cast<uintptr_t>(ptr));
       instance->resizeSection(index,size);

   }

}
