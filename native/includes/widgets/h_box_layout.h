#ifndef __H_BOX_LAYOUT_H_
#define __H_BOX_LAYOUT_H_

#include <QHBoxLayout>
#include "layout.h"

class CjQtHBoxLayout : public QHBoxLayout
{
    // Q_OBJECT
public:
    CjQtHBoxLayout(QWidget *parent = nullptr) : QHBoxLayout(parent) {}

protected:
    // KEY_PRESS_EVENT
};

#endif