#include "abstract_table_model.h"

extern "C"
{
    uintptr_t nativeAbstractTableModelCreate(uintptr_t ptr)
    {
        QObject *obj = reinterpret_cast<QObject *>(static_cast<uintptr_t>(ptr));
        CjAbstractTableModel *event = new CjAbstractTableModel(obj);
        return reinterpret_cast<uintptr_t>(event);
    }

    void nativeAbstractTableModelDelete(uintptr_t ptr)
    {
        appConfig->callbackMapRemove((char *)"rowCount", ptr);
        appConfig->callbackMapRemove((char *)"columnCount", ptr);
        appConfig->callbackMapRemove((char *)"data", ptr);
        CjAbstractTableModel *instance = reinterpret_cast<CjAbstractTableModel *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    void nativeAbstractTableModelBeginInsertRows(uintptr_t ptr, uintptr_t parentPtr, int first, int last)
    {
        CjAbstractTableModel *instance = reinterpret_cast<CjAbstractTableModel *>(static_cast<uintptr_t>(ptr));
        const QModelIndex *parent = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(parentPtr));
        instance->beginInsertRows(*parent, first, last);
    }

    void nativeAbstractTableModelEndInsertRows(uintptr_t ptr)
    {
        CjAbstractTableModel *instance = reinterpret_cast<CjAbstractTableModel *>(static_cast<uintptr_t>(ptr));
        instance->endInsertRows();
    }

    void nativeAbstractTableModelBeginRemoveRows(uintptr_t ptr, uintptr_t parentPtr, int first, int last)
    {
        CjAbstractTableModel *instance = reinterpret_cast<CjAbstractTableModel *>(static_cast<uintptr_t>(ptr));
        const QModelIndex *parent = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(parentPtr));
        instance->beginRemoveRows(*parent, first, last);
    }

    void nativeAbstractTableModelEndRemoveRows(uintptr_t ptr)
    {
        CjAbstractTableModel *instance = reinterpret_cast<CjAbstractTableModel *>(static_cast<uintptr_t>(ptr));
        instance->endRemoveRows();
    }

    void nativeAbstractTableModelBeginInsertColumns(uintptr_t ptr, uintptr_t parentPtr, int first, int last)
    {
        CjAbstractTableModel *instance = reinterpret_cast<CjAbstractTableModel *>(static_cast<uintptr_t>(ptr));
        const QModelIndex *parent = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(parentPtr));
        instance->beginInsertColumns(*parent, first, last);
    }

    void nativeAbstractTableModelEndInsertColumns(uintptr_t ptr)
    {
        CjAbstractTableModel *instance = reinterpret_cast<CjAbstractTableModel *>(static_cast<uintptr_t>(ptr));
        instance->endInsertColumns();
    }

    void nativeAbstractTableModelBeginRemoveColumns(uintptr_t ptr, uintptr_t parentPtr, int first, int last)
    {
        CjAbstractTableModel *instance = reinterpret_cast<CjAbstractTableModel *>(static_cast<uintptr_t>(ptr));
        const QModelIndex *parent = reinterpret_cast<QModelIndex *>(static_cast<uintptr_t>(parentPtr));
        instance->beginRemoveColumns(*parent, first, last);
    }

    void nativeAbstractTableModelEndRemoveColumns(uintptr_t ptr)
    {
        CjAbstractTableModel *instance = reinterpret_cast<CjAbstractTableModel *>(static_cast<uintptr_t>(ptr));
        instance->endRemoveColumns();
    }

    void nativeAbstractTableModelSetRowCountCallback(uintptr_t ptr, nativeCallbackPointer callback)
    {
        appConfig->callbackMapPut((char *)"rowCount", ptr, callback);
    }

    void nativeAbstractTableModelSetColumnCountCallback(uintptr_t ptr, nativeCallbackPointer callback)
    {
        appConfig->callbackMapPut((char *)"columnCount", ptr, callback);
    }

    void nativeAbstractTableModelSetDataCallback(uintptr_t ptr, nativeCallbackPointer callback)
    {
        appConfig->callbackMapPut((char *)"data", ptr, callback);
    }
}
