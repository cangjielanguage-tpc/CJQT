#ifndef __FILE_DIALOG_H_
#define __FILE_DIALOG_H_

#include <QFileDialog>
#include "widget.h"

class CjQtFileDialog : public QFileDialog
{
    Q_OBJECT
public:
    CjQtFileDialog(QWidget *parent = nullptr) : QFileDialog(parent) {}

protected:
    PAINT_EVENT(QFileDialog::paintEvent(event))

    MOUSE_PRESS_EVENT(QFileDialog::mousePressEvent(event))

    MOUSE_RELEASE_EVENT(QFileDialog::mouseReleaseEvent(event))

    MOUSE_MOVE_EVENT(QFileDialog::mouseMoveEvent(event))

    KEY_PRESS_EVENT
};

#endif