#ifndef __FONT_DIALOG_H_
#define __FONT_DIALOG_H_

#include <QFontDialog>
#include "widget.h"

class CjQtFontDialog : public QFontDialog
{
    Q_OBJECT
public:
    CjQtFontDialog(QWidget *parent = nullptr) : QFontDialog(parent) {}

protected:
    PAINT_EVENT(QFontDialog::paintEvent(event))

    MOUSE_PRESS_EVENT(QFontDialog::mousePressEvent(event))

    MOUSE_RELEASE_EVENT(QFontDialog::mouseReleaseEvent(event))

    MOUSE_MOVE_EVENT(QFontDialog::mouseMoveEvent(event))

    KEY_PRESS_EVENT(QFontDialog::keyPressEvent(event))
};

#endif