#include <styled_item_delegate.h>

extern "C"
{
    uintptr_t nativeStyledItemDelegateCreate()
    {
        APPLICATION_CREATE
        CjStyledItemDelegate *event = new CjStyledItemDelegate();
        return reinterpret_cast<uintptr_t>(event);
    }

    void nativeStyledItemDelegateDelete(uintptr_t ptr)
    {
        appConfig->callbackMapRemove((char *)"paint", ptr);
        appConfig->callbackMapRemove((char *)"sizeHint", ptr);
        CjStyledItemDelegate *instance = reinterpret_cast<CjStyledItemDelegate *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativeStyledItemDelegateSetPaintCallback(uintptr_t ptr, nativeCallbackPointer callback)
    {
        appConfig->callbackMapPut((char *)"paint", ptr, callback);
    }

    void nativeStyledItemDelegateSetSizeHintCallback(uintptr_t ptr, nativeCallbackPointer callback)
    {
        appConfig->callbackMapPut((char *)"sizeHint", ptr, callback);
    }
}