#ifndef __STATUS_BAR_H_
#define __STATUS_BAR_H_

#include <QStatusBar>
#include "widget.h"

extern "C"
{
    uintptr_t nativeMenuBarAddMenuStr(uintptr_t ptr, const char *menu);
}

class CjQtStatusBar : public QStatusBar
{
    Q_OBJECT
public:
    CjQtStatusBar(QWidget *parent = nullptr) : QStatusBar(parent) {}

protected:
    PAINT_EVENT(QStatusBar::paintEvent(event))

    MOUSE_PRESS_EVENT(QStatusBar::mousePressEvent(event))

    MOUSE_RELEASE_EVENT(QStatusBar::mouseReleaseEvent(event))

    MOUSE_MOVE_EVENT(QStatusBar::mouseMoveEvent(event))

    KEY_PRESS_EVENT(QStatusBar::keyPressEvent(event))
};

#endif