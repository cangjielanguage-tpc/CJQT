#ifndef __CHECK_BOX_H_
#define __CHECK_BOX_H_

#include <QCheckBox>
#include "widget.h"

class CjQtCheckBox : public QCheckBox
{
    // Q_OBJECT
public:
    CjQtCheckBox(QWidget *parent = nullptr) : QCheckBox(parent) {}

protected:
    PAINT_EVENT(QCheckBox::paintEvent(event))

    MOUSE_PRESS_EVENT(QCheckBox::mousePressEvent(event))

    MOUSE_RELEASE_EVENT(QCheckBox::mouseReleaseEvent(event))

    MOUSE_MOVE_EVENT(QCheckBox::mouseMoveEvent(event))

    KEY_PRESS_EVENT(QCheckBox::keyPressEvent(event))
};

#endif