#ifndef __STYLED_ITEM_DELEGATE_H_
#define __STYLED_ITEM_DELEGATE_H_
#include <QStyledItemDelegate>
#include "object.h"
#include "data_type.h"

class CjStyledItemDelegate : public QStyledItemDelegate
{
    // Q_OBJECT
public:
    CjStyledItemDelegate(QObject *parent = nullptr) : QStyledItemDelegate(parent) {}

    void paint(QPainter *painter,
                       const QStyleOptionViewItem &option,
                       const QModelIndex &index) const override
    {
        nativeCallbackPointer paintCallback = appConfig->callbackMapGet((char *)"paint", reinterpret_cast<uintptr_t>(this));
        if (paintCallback != nullptr)
        {
            CjDataLongLongLong data = {
                .p1 = reinterpret_cast<uintptr_t>(painter),
                .p2 = reinterpret_cast<uintptr_t>(&option),
                .p3 = reinterpret_cast<uintptr_t>(&index)};
            paintCallback(reinterpret_cast<uintptr_t>(this), (void *)&data);
        } else {
            QStyledItemDelegate::paint(painter, option, index);
        }
    }

    QSize sizeHint(const QStyleOptionViewItem &option,
                           const QModelIndex &index) const override
    {
        nativeCallbackPointer sizeHintCallback = appConfig->callbackMapGet((char *)"sizeHint", reinterpret_cast<uintptr_t>(this));
        if (sizeHintCallback != nullptr)
        {
            CjDataLongLong data = {
                .p1 = reinterpret_cast<uintptr_t>(&option),
                .p2 = reinterpret_cast<uintptr_t>(&index)};
            uintptr_t dataPtr = (uintptr_t)sizeHintCallback(reinterpret_cast<uintptr_t>(this), (void *)&data);
            QSize *instance = reinterpret_cast<QSize *>(static_cast<uintptr_t>(dataPtr));
            return *instance;
        }
        else
        {
            return QStyledItemDelegate::sizeHint(option, index);
        }
    }
};

#endif