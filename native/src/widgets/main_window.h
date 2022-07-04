#ifndef __MAIN_WINDOW_H_
#define __MAIN_WINDOW_H_

#include <QMainWindow>
#include "widget.h"
extern "C"
{
long nativeMainWindowCreate(long appPtr, long parentPtr);
long nativeMainWindowMenuBar(long ptr);
}

class CjQtMainWindow : public QMainWindow
{
    Q_OBJECT
public:
    CjQtMainWindow(QWidget *parent = nullptr) : QMainWindow(parent) {}

protected:
    PAINT_EVENT(QMainWindow::paintEvent(event))

    MOUSE_PRESS_EVENT(QMainWindow::mousePressEvent(event))

    MOUSE_RELEASE_EVENT(QMainWindow::mouseReleaseEvent(event))

    MOUSE_MOVE_EVENT(QMainWindow::mouseMoveEvent(event))

    KEY_PRESS_EVENT
};

#endif