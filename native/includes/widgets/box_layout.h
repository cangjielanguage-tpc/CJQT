#ifndef __BOX_LAYOUT_H_
#define __BOX_LAYOUT_H_

#include <QBoxLayout>
#include "layout.h"

class CjQtBoxLayout : public QBoxLayout
{
    // Q_OBJECT
public:
    CjQtBoxLayout(QWidget *parent = nullptr) : QBoxLayout(Direction::LeftToRight , parent) {}

protected:

    // KEY_PRESS_EVENT(QBoxLayout::keyPressEvent(event))
};

#endif