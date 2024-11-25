#ifndef __SCROLL_AREA_H_
#define __SCROLL_AREA_H_

#include <QScrollArea>
#include "widget.h"

class CjQtScrollArea : public QScrollArea
{
    Q_OBJECT
public:
    CjQtScrollArea(QWidget *parent = nullptr) : QScrollArea(parent) {}

protected:
    PAINT_EVENT(QScrollArea::paintEvent(event))

    MOUSE_PRESS_EVENT(QScrollArea::mousePressEvent(event))

    MOUSE_RELEASE_EVENT(QScrollArea::mouseReleaseEvent(event))

    MOUSE_MOVE_EVENT(QScrollArea::mouseMoveEvent(event))

    KEY_PRESS_EVENT(QScrollArea::keyPressEvent(event))
};

#endif