#ifndef __ABSTRACT_ITEM_DELEGATE_H_
#define __ABSTRACT_ITEM_DELEGATE_H_
#include <QAbstractItemDelegate>
#include "object.h"
#include "data_type.h"

class CjAbstractItemDelegate : public QAbstractItemDelegate
{
    // Q_OBJECT
public:
    CjAbstractItemDelegate(QObject *parent = nullptr) : QAbstractItemDelegate(parent) {}

    virtual void paint(QPainter *painter,
                       const QStyleOptionViewItem &option,
                       const QModelIndex &index) const override
    {
        nativeCallbackPointer paintCallback = appConfig->callbackMapGet((char *)"paint", reinterpret_cast<long>(this));
        if (paintCallback != nullptr)
        {
            CjDataLongLongLong data = {
                .p1 = reinterpret_cast<long>(painter),
                .p2 = reinterpret_cast<long>(&option),
                .p3 = reinterpret_cast<long>(&index)};
            paintCallback(reinterpret_cast<long>(this), (void *)&data);
        }
    }

    virtual QSize sizeHint(const QStyleOptionViewItem &option,
                           const QModelIndex &index) const override
    {
        nativeCallbackPointer sizeHintCallback = appConfig->callbackMapGet((char *)"sizeHint", reinterpret_cast<long>(this));
        if (sizeHintCallback != nullptr)
        {
            CjDataLongLong data = {
                .p1 = reinterpret_cast<long>(&option),
                .p2 = reinterpret_cast<long>(&index)};
            long dataPtr = (long)sizeHintCallback(reinterpret_cast<long>(this), (void *)&data);
            QSize *instance = reinterpret_cast<QSize *>(static_cast<uintptr_t>(dataPtr));
            return *instance;
        }
        else
        {
            return QSize();
        }
    }
};

#endif