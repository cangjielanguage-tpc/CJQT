#include "abstract_list_model.h"

extern "C"
{
    uintptr_t nativeAbstractListModelCreate(uintptr_t ptr)
    {

        QObject *obj = reinterpret_cast<QObject *>(static_cast<uintptr_t>(ptr));
        CjAbstractListModel *event = new CjAbstractListModel(obj);
        return reinterpret_cast<uintptr_t>(event);
    }

    void nativeAbstractListModelDelete(uintptr_t ptr)
    {
        appConfig->callbackMapRemove((char *)"rowCount", ptr);
        appConfig->callbackMapRemove((char *)"data", ptr);
        CjAbstractListModel *instance = reinterpret_cast<CjAbstractListModel *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativeAbstractItemModelBeginInsertRows(uintptr_t ptr, uintptr_t parentPtr, int first, int last)
    {
        CjAbstractListModel *instance = reinterpret_cast<CjAbstractListModel *>(static_cast<uintptr_t>(ptr));
        const QModelIndex *parent = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(parentPtr));
        instance->beginInsertRows(*parent, first, last);
    }

    void nativeAbstractItemModelEndInsertRows(uintptr_t ptr)
    {
        CjAbstractListModel *instance = reinterpret_cast<CjAbstractListModel *>(static_cast<uintptr_t>(ptr));
        instance->endInsertRows();
    }

    void nativeAbstractItemModelBeginRemoveRows(uintptr_t ptr, uintptr_t parentPtr, int first, int last)
    {
        CjAbstractListModel *instance = reinterpret_cast<CjAbstractListModel *>(static_cast<uintptr_t>(ptr));
        const QModelIndex *parent = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(parentPtr));
        instance->beginRemoveRows(*parent, first, last);
    }

    void nativeAbstractItemModelEndRemoveRows(uintptr_t ptr)
    {
        CjAbstractListModel *instance = reinterpret_cast<CjAbstractListModel *>(static_cast<uintptr_t>(ptr));
        instance->endRemoveRows();
    }

    void nativeAbstractListModelSetRowCountCallback(uintptr_t ptr, nativeCallbackPointer callback)
    {
        appConfig->callbackMapPut((char *)"rowCount", ptr, callback);
    }

    void nativeAbstractListModelSetDataCallback(uintptr_t ptr, nativeCallbackPointer callback)
    {
        appConfig->callbackMapPut((char *)"data", ptr, callback);
    }
}
