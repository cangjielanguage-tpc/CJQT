#ifndef __DIALOG_BUTTON_BOX_H_
#define __DIALOG_BUTTON_BOX_H_

#include <QDialogButtonBox>
#include "widget.h"
extern "C"
{
uintptr_t nativeDialogButtonBoxCreate(uintptr_t parentPtr);
void nativeDialogButtonBoxDelete(uintptr_t ptr);
}


class CjQtDialogButtonBox : public QDialogButtonBox
{
    Q_OBJECT
public:
    CjQtDialogButtonBox(QWidget *parent = nullptr) : QDialogButtonBox(parent) {}

protected:
    PAINT_EVENT(QDialogButtonBox::paintEvent(event))

    MOUSE_PRESS_EVENT(QDialogButtonBox::mousePressEvent(event))

    MOUSE_RELEASE_EVENT(QDialogButtonBox::mouseReleaseEvent(event))

    MOUSE_MOVE_EVENT(QDialogButtonBox::mouseMoveEvent(event))

    KEY_PRESS_EVENT(QDialogButtonBox::keyPressEvent(event))
};

#endif
