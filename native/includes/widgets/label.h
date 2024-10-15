#ifndef __LABEL_H_
#define __LABEL_H_

#include <QLabel>
#include "widget.h"

class CjQtLabel : public QLabel
{
    // Q_OBJECT
public:
    CjQtLabel(QWidget *parent = nullptr) : QLabel(parent) {}
    CjQtLabel(const QString &text,QWidget *parent = nullptr) : QLabel(text,parent) {}

protected:
    PAINT_EVENT(QLabel::paintEvent(event))

    MOUSE_PRESS_EVENT(QLabel::mousePressEvent(event))

    MOUSE_RELEASE_EVENT(QLabel::mouseReleaseEvent(event))

    MOUSE_MOVE_EVENT(QLabel::mouseMoveEvent(event))

    KEY_PRESS_EVENT(QLabel::keyPressEvent(event))
};

#endif
