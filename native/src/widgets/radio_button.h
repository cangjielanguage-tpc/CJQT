#ifndef __CHECK_BOX_H_
#define __CHECK_BOX_H_

#include <QRadioButton>
#include "widget.h"

class CjQtRadioButton : public QRadioButton
{
    // Q_OBJECT
public:
    CjQtRadioButton(QWidget *parent = nullptr) : QRadioButton(parent) {}

protected:
    PAINT_EVENT(QRadioButton::paintEvent(event))

    MOUSE_PRESS_EVENT(QRadioButton::mousePressEvent(event))

    MOUSE_RELEASE_EVENT(QRadioButton::mouseReleaseEvent(event))

    MOUSE_MOVE_EVENT(QRadioButton::mouseMoveEvent(event))

    KEY_PRESS_EVENT
};

#endif