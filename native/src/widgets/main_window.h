#ifndef __MAIN_WINDOW_H_
#define __MAIN_WINDOW_H_

#include <QMainWindow>
#include "widget.h"

class CjQtMainWindow : public QMainWindow
{
    Q_OBJECT
public:
    CjQtMainWindow(QWidget *parent = nullptr) : QMainWindow(parent) {}

protected:
    PAINT_EVENT(QMainWindow::paintEvent)

    MOUSE_PRESS_EVENT(QMainWindow::mousePressEvent)

    MOUSE_RELEASE_EVENT(QMainWindow::mouseReleaseEvent)

    MOUSE_MOVE_EVENT(QMainWindow::mouseMoveEvent)

    KEY_PRESS_EVENT
};

#endif