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
    PAINT_EVENT(QMessageBox::paintEvent)

    MOUSE_PRESS_EVENT(QMessageBox::mousePressEvent)

    MOUSE_RELEASE_EVENT(QMessageBox::mouseReleaseEvent)

    MOUSE_MOVE_EVENT(QMessageBox::mouseMoveEvent)

    KEY_PRESS_EVENT
};

#endif