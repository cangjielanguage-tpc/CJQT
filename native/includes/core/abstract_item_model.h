#ifndef __ABSTRACT_ITEM_MODEL_H_
#define __ABSTRACT_ITEM_MODEL_H_
#include <QAbstractItemModel>

class CjAbstractItemModel : public QAbstractItemModel
{
    // Q_OBJECT
public:
    CjAbstractItemModel(QObject *parent = nullptr) : QAbstractItemModel(parent) {}
};

#endif