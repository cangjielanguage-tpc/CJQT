#ifndef __LABEL_H_
#define __LABEL_H_

#include <QLabel>
#include "widget.h"

class CjQtLabel : public BaseWidget<QLabel>
{
    // Q_OBJECT
public:
    CjQtLabel(QWidget *parent = nullptr) : BaseWidget<QLabel>(parent) {}
};

#endif