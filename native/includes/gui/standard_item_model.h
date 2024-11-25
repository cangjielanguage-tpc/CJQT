#ifndef STANDARD_ITEM_MODEL_H
#define STANDARD_ITEM_MODEL_H
#include <QStandardItemModel>

class CjStandardItemModel : public QStandardItemModel
{
    Q_OBJECT
public:
    CjStandardItemModel(QObject *parent = nullptr) : QStandardItemModel(parent) {}
};

#endif // STANDARD_ITEM_MODEL_H
