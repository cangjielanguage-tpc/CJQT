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
    PAINT_EVENT(QPushButton::paintEvent)

    MOUSE_PRESS_EVENT(QPushButton::mousePressEvent)

    MOUSE_RELEASE_EVENT(QPushButton::mouseReleaseEvent)

    MOUSE_MOVE_EVENT(QPushButton::mouseMoveEvent)

    KEY_PRESS_EVENT
};

#endif