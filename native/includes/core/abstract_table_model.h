#ifndef __ABSTRACT_TABLE_MODEL_H_
#define __ABSTRACT_TABLE_MODEL_H_
#include <QAbstractTableModel>

#include "object.h"
#include "data_type.h"

class CjAbstractTableModel : public QAbstractTableModel
{
public:
    CjAbstractTableModel(QObject *parent = nullptr) : QAbstractTableModel(parent) {}

    void beginInsertRows(const QModelIndex &parent, int first, int last)
    {
        QAbstractTableModel::beginInsertRows(parent, first, last);
    }

    void endInsertRows()
    {
        QAbstractTableModel::endInsertRows();
    }

    void beginRemoveRows(const QModelIndex &parent, int first, int last)
    {
        QAbstractTableModel::beginRemoveRows(parent, first, last);
    }

    void endRemoveRows()
    {
        QAbstractTableModel::endRemoveRows();
    }

    void beginInsertColumns(const QModelIndex &parent, int first, int last)
    {
        QAbstractTableModel::beginInsertColumns(parent, first, last);
    }

    void endInsertColumns()
    {
        QAbstractTableModel::endInsertColumns();
    }

    void beginRemoveColumns(const QModelIndex &parent, int first, int last)
    {
        QAbstractTableModel::beginRemoveColumns(parent, first, last);
    }

    void endRemoveColumns()
    {
        QAbstractTableModel::endRemoveColumns();
    }

    virtual int rowCount(const QModelIndex &parent = QModelIndex()) const override
    {
        nativeCallbackPointer rowCountCallback = appConfig->callbackMapGet((char *)"rowCount", reinterpret_cast<uintptr_t>(this));
        if (rowCountCallback != nullptr)
        {
            return (int)(intptr_t)rowCountCallback(reinterpret_cast<uintptr_t>(this), (void *)reinterpret_cast<uintptr_t>(&parent));
        }
        return 0;
    }

    virtual int columnCount(const QModelIndex &parent = QModelIndex()) const override
    {
        nativeCallbackPointer columnCountCallback = appConfig->callbackMapGet((char *)"columnCount", reinterpret_cast<uintptr_t>(this));
        if (columnCountCallback != nullptr)
        {
            return (int)(intptr_t)columnCountCallback(reinterpret_cast<uintptr_t>(this), (void *)reinterpret_cast<uintptr_t>(&parent));
        }
        return 0;
    }

    virtual QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override
    {
        nativeCallbackPointer dataCallback = appConfig->callbackMapGet((char *)"data", reinterpret_cast<uintptr_t>(this));
        if (dataCallback != nullptr)
        {
            CjDataLongInt data = {
                .p1 = reinterpret_cast<uintptr_t>(&index),
                .p2 = role};
            QVariant *variant = (QVariant *)dataCallback(reinterpret_cast<uintptr_t>(this), (void *)&data);
            return *variant;
        }
        return QVariant();
    }
};

#endif
