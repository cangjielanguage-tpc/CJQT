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
        appConfig->rowCountMapRemove(ptr);
        appConfig->dataMapRemove(ptr);
        CjAbstractListModel *instance = reinterpret_cast<CjAbstractListModel *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    //void beginInsertRows(const QModelIndex &parent, int first, int last);
    //void endInsertRows();

    //void beginRemoveRows(const QModelIndex &parent, int first, int last);
    //void endRemoveRows();

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

    void nativeAbstractListModelSetRowCountCallback(long ptr, nativeRowCountCallback callback)
    {
        appConfig->rowCountMapPut(ptr, callback);
    }

    void nativeAbstractListModelSetDataCallback(long ptr, nativeDataCallback callback)
    {
        appConfig->dataMapPut(ptr, callback);
    }
}