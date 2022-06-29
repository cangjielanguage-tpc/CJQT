#ifndef __LABEL_H_
#define __LABEL_H_

#include <QLabel>
#include "widget.h"

class CjQtLabel : public QLabel
{
    // Q_OBJECT
public:
    CjQtLabel(QWidget *parent = nullptr) : QLabel(parent) {}

protected:
    PAINT_EVENT(QLabel::paintEvent)

    MOUSE_PRESS_EVENT(QLabel::mousePressEvent)

    MOUSE_RELEASE_EVENT(QLabel::mouseReleaseEvent)

    MOUSE_MOVE_EVENT(QLabel::mouseMoveEvent)

    KEY_PRESS_EVENT
};

#endif