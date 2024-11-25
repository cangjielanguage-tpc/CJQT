#ifndef __MENU_H_
#define __MENU_H_

#include <QMenu>
#include "widget.h"

class CjQtMenu : public QMenu
{
    Q_OBJECT
public:
    CjQtMenu(QWidget *parent = nullptr) : QMenu(parent) {}

protected:
    PAINT_EVENT(QMenu::paintEvent(event))

    MOUSE_PRESS_EVENT(QMenu::mousePressEvent(event))

    MOUSE_RELEASE_EVENT(QMenu::mouseReleaseEvent(event))

    MOUSE_MOVE_EVENT(QMenu::mouseMoveEvent(event))

    KEY_PRESS_EVENT(QMenu::keyPressEvent(event))
};

#endif