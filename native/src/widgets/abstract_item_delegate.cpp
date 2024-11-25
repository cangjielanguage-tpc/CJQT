#include "abstract_item_delegate.h"

extern "C"
{
    uintptr_t nativeAbstractItemDelegateCreate()
    {
        CjAbstractItemDelegate *event = new CjAbstractItemDelegate();
        return reinterpret_cast<uintptr_t>(event);
    }

    void nativeAbstractItemDelegateDelete(uintptr_t ptr)
    {
        appConfig->callbackMapRemove((char *)"paint", ptr);
        appConfig->callbackMapRemove((char *)"sizeHint", ptr);
        CjAbstractItemDelegate *instance = reinterpret_cast<CjAbstractItemDelegate *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativeAbstractItemDelegateSetPaintCallback(uintptr_t ptr, nativeCallbackPointer callback)
    {
        appConfig->callbackMapPut((char *)"paint", ptr, callback);
    }

    void nativeAbstractItemDelegateSetSizeHintCallback(uintptr_t ptr, nativeCallbackPointer callback)
    {
        appConfig->callbackMapPut((char *)"sizeHint", ptr, callback);
    }
}