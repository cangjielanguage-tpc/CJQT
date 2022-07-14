#ifndef __V_BOX_LAYOUT_H_
#define __V_BOX_LAYOUT_H_

#include <QVBoxLayout>
#include "layout.h"

class CjQtVBoxLayout : public QVBoxLayout
{
    // Q_OBJECT
public:
    CjQtVBoxLayout(QWidget *parent = nullptr) : QVBoxLayout(parent) {}

protected:
    KEY_PRESS_EVENT
};

#endif