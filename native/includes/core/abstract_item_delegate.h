#ifndef __ABSTRACT_ITEM_DELEGATE_H_
#define __ABSTRACT_ITEM_DELEGATE_H_
#include <QAbstractItemDelegate>

class CjAbstractItemDelegate : public QAbstractItemDelegate
{
    // Q_OBJECT
public:
    CjAbstractItemDelegate(QObject *parent = nullptr) : QAbstractItemDelegate(parent) {}
};

#endif