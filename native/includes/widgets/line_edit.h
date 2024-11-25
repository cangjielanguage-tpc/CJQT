#ifndef __LINE_EDIT_H_
#define __LINE_EDIT_H_

#include <QLineEdit>
#include "widget.h"
#include "object.h"

class CjLineEdit : public QLineEdit
{
    Q_OBJECT
public:
    CjLineEdit(QWidget *parent = nullptr) : QLineEdit(parent) {}
    CjLineEdit(const QString &contents, QWidget *parent = nullptr) : QLineEdit(contents, parent) {}

protected:
    PAINT_EVENT(QLineEdit::paintEvent(event))

    MOUSE_PRESS_EVENT(QLineEdit::mousePressEvent(event))

    MOUSE_RELEASE_EVENT(QLineEdit::mouseReleaseEvent(event))

    MOUSE_MOVE_EVENT(QLineEdit::mouseMoveEvent(event))

    KEY_PRESS_EVENT(QLineEdit::keyPressEvent(event))
};

#endif