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
    PAINT_EVENT(QMenu::paintEvent)

    MOUSE_PRESS_EVENT(QMenu::mousePressEvent)

    MOUSE_RELEASE_EVENT(QMenu::mouseReleaseEvent)

    MOUSE_MOVE_EVENT(QMenu::mouseMoveEvent)

    KEY_PRESS_EVENT
};

#endif