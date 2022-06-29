#ifndef __MENU_BAR_H_
#define __MENU_BAR_H_

#include <QMenuBar>
#include "widget.h"

class CjQtMenuBar : public QMenuBar
{
    Q_OBJECT
public:
    CjQtMenuBar(QWidget *parent = nullptr) : QMenuBar(parent) {}

protected:
    PAINT_EVENT(QMenuBar::paintEvent)

    MOUSE_PRESS_EVENT(QMenuBar::mousePressEvent)

    MOUSE_RELEASE_EVENT(QMenuBar::mouseReleaseEvent)

    MOUSE_MOVE_EVENT(QMenuBar::mouseMoveEvent)

    KEY_PRESS_EVENT
};

#endif