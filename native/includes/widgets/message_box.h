#ifndef __MESSAGE_BOX_H_
#define __MESSAGE_BOX_H_

#include <QMessageBox>
#include "widget.h"

class CjQtMessageBox : public QMessageBox
{
    Q_OBJECT
public:
    CjQtMessageBox(QWidget *parent = nullptr) : QMessageBox(parent) {}

protected:
    PAINT_EVENT(QMessageBox::paintEvent(event))

    MOUSE_PRESS_EVENT(QMessageBox::mousePressEvent(event))

    MOUSE_RELEASE_EVENT(QMessageBox::mouseReleaseEvent(event))

    MOUSE_MOVE_EVENT(QMessageBox::mouseMoveEvent(event))

    KEY_PRESS_EVENT(QMessageBox::keyPressEvent(event))
};

#endif