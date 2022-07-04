#ifndef __PUSH_BUTTON_H_
#define __PUSH_BUTTON_H_

#include <QPushButton>
#include "widget.h"

class CjQtPushButton : public QPushButton
{
    Q_OBJECT
public:
    CjQtPushButton(QWidget *parent = nullptr) : QPushButton(parent) {}

protected:
    PAINT_EVENT(QPushButton::paintEvent(event))

    MOUSE_PRESS_EVENT(QPushButton::mousePressEvent(event))

    MOUSE_RELEASE_EVENT(QPushButton::mouseReleaseEvent(event))

    MOUSE_MOVE_EVENT(QPushButton::mouseMoveEvent(event))

    KEY_PRESS_EVENT
};

#endif