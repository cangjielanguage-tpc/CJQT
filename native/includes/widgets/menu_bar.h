#ifndef __MENU_BAR_H_
#define __MENU_BAR_H_

#include <QMenuBar>
#include "widget.h"

extern "C"
{
    long nativeMenuBarAddMenuStr(long ptr, const char *menu);
}

class CjQtMenuBar : public QMenuBar
{
    Q_OBJECT
public:
    CjQtMenuBar(QWidget *parent = nullptr) : QMenuBar(parent) {}

protected:
    PAINT_EVENT(QMenuBar::paintEvent(event))

    MOUSE_PRESS_EVENT(QMenuBar::mousePressEvent(event))

    MOUSE_RELEASE_EVENT(QMenuBar::mouseReleaseEvent(event))

    MOUSE_MOVE_EVENT(QMenuBar::mouseMoveEvent(event))

    KEY_PRESS_EVENT(QMenuBar::keyPressEvent(event))
};

#endif