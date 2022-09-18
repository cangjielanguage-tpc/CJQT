#ifndef __TAB_BAR_H_
#define __TAB_BAR_H_

#include <QTabBar>
#include "widget.h"

class CjQtTabBar : public QTabBar
{
    Q_OBJECT
public:
    CjQtTabBar(QWidget *parent = nullptr) : QTabBar(parent) {}

protected:
    PAINT_EVENT(QTabBar::paintEvent(event))

    MOUSE_PRESS_EVENT(QTabBar::mousePressEvent(event))

    MOUSE_RELEASE_EVENT(QTabBar::mouseReleaseEvent(event))

    MOUSE_MOVE_EVENT(QTabBar::mouseMoveEvent(event))

    KEY_PRESS_EVENT(QTabBar::keyPressEvent(event))
};

#endif