#include "abstract_list_model.h"

extern "C"
{
    long nativeAbstractListModelCreate()
    {
        CjAbstractListModel *event = new CjAbstractListModel();
        return reinterpret_cast<long>(event);
    }

    void nativeAbstractListModelDelete(long ptr)
    {
        appConfig->callbackMapRemove((char *)"rowCount", ptr);
        appConfig->callbackMapRemove((char *)"data", ptr);
        CjAbstractListModel *instance = reinterpret_cast<CjAbstractListModel *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativeAbstractItemModelBeginInsertRows(long ptr, long parentPtr, int first, int last)
    {
        CjAbstractListModel *instance = reinterpret_cast<CjAbstractListModel *>(static_cast<uintptr_t>(ptr));
        const QModelIndex *parent = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(parentPtr));
        instance->beginInsertRows(*parent, first, last);
    }

    void nativeAbstractItemModelEndInsertRows(long ptr)
    {
        CjAbstractListModel *instance = reinterpret_cast<CjAbstractListModel *>(static_cast<uintptr_t>(ptr));
        instance->endInsertRows();
    }

    void nativeAbstractItemModelBeginRemoveRows(long ptr, long parentPtr, int first, int last)
    {
        CjAbstractListModel *instance = reinterpret_cast<CjAbstractListModel *>(static_cast<uintptr_t>(ptr));
        const QModelIndex *parent = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(parentPtr));
        instance->beginRemoveRows(*parent, first, last);
    }

    void nativeAbstractItemModelEndRemoveRows(long ptr)
    {
        CjAbstractListModel *instance = reinterpret_cast<CjAbstractListModel *>(static_cast<uintptr_t>(ptr));
        instance->endRemoveRows();
    }

    void nativeAbstractListModelSetRowCountCallback(long ptr, nativeCallbackPointer callback)
    {
        appConfig->callbackMapPut((char *)"rowCount", ptr, callback);
    }

    void nativeAbstractListModelSetDataCallback(long ptr, nativeCallbackPointer callback)
    {
        appConfig->callbackMapPut((char *)"data", ptr, callback);
    }
}