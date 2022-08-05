#ifndef __TEXT_EDIT_H_
#define __TEXT_EDIT_H_

#include <QTextEdit>
#include "widget.h"

class CjTextEdit : public QTextEdit
{
    Q_OBJECT
public:
    CjTextEdit(QWidget *parent = nullptr) : QTextEdit(parent) {}

protected:
    PAINT_EVENT(QTextEdit::paintEvent(event))

    MOUSE_PRESS_EVENT(QTextEdit::mousePressEvent(event))

    MOUSE_RELEASE_EVENT(QTextEdit::mouseReleaseEvent(event))

    MOUSE_MOVE_EVENT(QTextEdit::mouseMoveEvent(event))

    KEY_PRESS_EVENT(QTextEdit::keyPressEvent(event))
};

#endif