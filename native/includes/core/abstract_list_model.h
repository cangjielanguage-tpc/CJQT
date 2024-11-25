#ifndef __ABSTRACT_LIST_MODEL_H_
#define __ABSTRACT_LIST_MODEL_H_
#include <QAbstractListModel>

#include "object.h"
#include "data_type.h"

class CjAbstractListModel : public QAbstractListModel
{
    // Q_OBJECT
public:
    CjAbstractListModel(QObject *parent = nullptr) : QAbstractListModel(parent) {}

    void beginInsertRows(const QModelIndex &parent, int first, int last)
    {
        QAbstractListModel::beginInsertRows(parent, first, last);
    }

    void endInsertRows()
    {
        QAbstractListModel::endInsertRows();
    }

    void beginRemoveRows(const QModelIndex &parent, int first, int last)
    {
        QAbstractListModel::beginRemoveRows(parent, first, last);
    }

    void endRemoveRows()
    {
        QAbstractListModel::endRemoveRows();
    }

    virtual int rowCount(const QModelIndex &parent = QModelIndex()) const override
    {
        nativeCallbackPointer rowCountCallback = appConfig->callbackMapGet((char *)"rowCount", reinterpret_cast<uintptr_t>(this));
        if (rowCountCallback != nullptr)
        {
            return (int)(intptr_t)rowCountCallback(reinterpret_cast<uintptr_t>(this), (void *)reinterpret_cast<uintptr_t>(&parent));
        }
        else
        {
            return 0;
        }
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
        else
        {
            return QVariant(); 
        }
    }
};

#endif