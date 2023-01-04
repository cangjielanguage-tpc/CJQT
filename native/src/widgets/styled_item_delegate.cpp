#include <styled_item_delegate.h>

extern "C"
{
    long nativeStyledItemDelegateCreate()
    {
        CjStyledItemDelegate *event = new CjStyledItemDelegate();
        return reinterpret_cast<long>(event);
    }

    void nativeStyledItemDelegateDelete(long ptr)
    {
        appConfig->callbackMapRemove((char *)"paint", ptr);
        appConfig->callbackMapRemove((char *)"sizeHint", ptr);
        CjStyledItemDelegate *instance = reinterpret_cast<CjStyledItemDelegate *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativeStyledItemDelegateSetPaintCallback(long ptr, nativeCallbackPointer callback)
    {
        appConfig->callbackMapPut((char *)"paint", ptr, callback);
    }

    void nativeStyledItemDelegateSetSizeHintCallback(long ptr, nativeCallbackPointer callback)
    {
        appConfig->callbackMapPut((char *)"sizeHint", ptr, callback);
    }
}