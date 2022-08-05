#ifndef __DIALOG_H_
#define __DIALOG_H_

#include <QDialog>
#include "widget.h"

class CjQtDialog : public QDialog
{
    Q_OBJECT
public:
    CjQtDialog(QWidget *parent = nullptr) : QDialog(parent) {}

protected:
    PAINT_EVENT(QDialog::paintEvent(event))

    MOUSE_PRESS_EVENT(QDialog::mousePressEvent(event))

    MOUSE_RELEASE_EVENT(QDialog::mouseReleaseEvent(event))

    MOUSE_MOVE_EVENT(QDialog::mouseMoveEvent(event))

    KEY_PRESS_EVENT(QDialog::keyPressEvent(event))
};

#endif