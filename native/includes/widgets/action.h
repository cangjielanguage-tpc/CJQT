#ifndef __ACTION_H_
#define __ACTION_H_

#include <QAction>
#include "widget.h"

class CjQtAction : public QAction
{
    // Q_OBJECT
public:
    CjQtAction(QWidget *parent = nullptr) : QAction(parent) {}

protected:
    // PAINT_EVENT(QWidget::paintEvent)

    // MOUSE_PRESS_EVENT(QAction::mousePressEvent)

    // MOUSE_RELEASE_EVENT(QAction::mouseReleaseEvent)

    // MOUSE_MOVE_EVENT(QAction::mouseMoveEvent)

    // KEY_PRESS_EVENT(QAction::keyPressEvent(event))
};

#endif