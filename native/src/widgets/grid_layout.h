#ifndef __LABEL_H_
#define __LABEL_H_

#include <QGridLayout>
#include "widget.h"

class CjQtGridLayout : public BaseWidget<QGridLayout>
{
    // Q_OBJECT
public:
    CjQtGridLayout(QWidget *parent = nullptr) : BaseWidget<QGridLayout>(parent) {}
};

#endif