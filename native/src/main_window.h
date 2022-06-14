#ifndef __MAIN_WINDOW_H_
#define __MAIN_WINDOW_H_

#include <QMainWindow>
#include "widget.h"

class CjQtMainWindow : public BaseWidget<QMainWindow>
{
    // Q_OBJECT
public:
    CjQtMainWindow(QWidget *parent = nullptr) : BaseWidget<QMainWindow>(parent) {}
};

#endif