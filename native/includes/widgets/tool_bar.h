#ifndef __TOOL_BAR_H_
#define __TOOL_BAR_H_

#include <QToolBar>
#include "widget.h"

class CjQtToolBar : public QToolBar
{
    Q_OBJECT
public:
    CjQtToolBar(QWidget *parent = nullptr) : QToolBar(parent) {}

protected:
    PAINT_EVENT(QToolBar::paintEvent(event))

    MOUSE_PRESS_EVENT(QToolBar::mousePressEvent(event))

    MOUSE_RELEASE_EVENT(QToolBar::mouseReleaseEvent(event))

    MOUSE_MOVE_EVENT(QToolBar::mouseMoveEvent(event))

    KEY_PRESS_EVENT(QToolBar::keyPressEvent(event))
};

#endif