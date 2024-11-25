#ifndef __ABSTRACT_SCROLL_H_
#define __ABSTRACT_SCROLL_H_
#include <QAbstractScrollArea>

class CjAbstractScrollArea : public QAbstractScrollArea
{
    Q_OBJECT
public:
    CjAbstractScrollArea(QWidget *parent = nullptr) : QAbstractScrollArea(parent) {}
};

#endif