#ifndef __GROUP_BOX_H_
#define __GROUP_BOX_H_

#include <QGroupBox>
#include "widget.h"

class CjQtGroupBox : public QGroupBox
{
    // Q_OBJECT
public:
    CjQtGroupBox(QWidget *parent = nullptr) : QGroupBox(parent) {}

protected:
    PAINT_EVENT(QGroupBox::paintEvent(event))

    MOUSE_PRESS_EVENT(QGroupBox::mousePressEvent(event))

    MOUSE_RELEASE_EVENT(QGroupBox::mouseReleaseEvent(event))

    MOUSE_MOVE_EVENT(QGroupBox::mouseMoveEvent(event))

    KEY_PRESS_EVENT(QGroupBox::keyPressEvent(event))
};

#endif