#ifndef __PUSH_BUTTON_H_
#define __PUSH_BUTTON_H_

#include <QPushButton>
#include "widget.h"

class CjQtPushButton : public BaseWidget<QPushButton>
{
    // Q_OBJECT
public:
    CjQtPushButton(QWidget *parent = nullptr) : BaseWidget<QPushButton>(parent) {}
};

#endif