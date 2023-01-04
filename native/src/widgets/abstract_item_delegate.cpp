#include "abstract_item_delegate.h"

extern "C"
{
    long nativeAbstractItemDelegateCreate()
    {
        CjAbstractItemDelegate *event = new CjAbstractItemDelegate();
        return reinterpret_cast<long>(event);
    }

    void nativeAbstractItemDelegateDelete(long ptr)
    {
        appConfig->callbackMapRemove((char *)"paint", ptr);
        appConfig->callbackMapRemove((char *)"sizeHint", ptr);
        CjAbstractItemDelegate *instance = reinterpret_cast<CjAbstractItemDelegate *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativeAbstractItemDelegateSetPaintCallback(long ptr, nativeCallbackPointer callback)
    {
        appConfig->callbackMapPut((char *)"paint", ptr, callback);
    }

    void nativeAbstractItemDelegateSetSizeHintCallback(long ptr, nativeCallbackPointer callback)
    {
        appConfig->callbackMapPut((char *)"sizeHint", ptr, callback);
    }
}