#ifndef __SCROLL_BAR_H_
#define __SCROLL_BAR_H_
#include <QScrollBar>
#include "object.h"

typedef bool (*eventCallback)(long, long);

class CjScrollBar : public QScrollBar
{
    Q_OBJECT
public:
    CjScrollBar(QWidget *parent = nullptr) : QScrollBar(parent) {}
    CjScrollBar(Qt::Orientation orientation, QWidget *parent = nullptr) : QScrollBar(orientation, parent) {}

    void doHideEvent(QHideEvent *event)
    {
        return QScrollBar::hideEvent(event);
    }
    void doPaintEvent(QPaintEvent *event)
    {
        return QScrollBar::paintEvent(event);
    }
    void doMouseMoveEvent(QMouseEvent *event)
    {
        return QScrollBar::mouseMoveEvent(event);
    }
    void doMousePressEvent(QMouseEvent *event)
    {
        return QScrollBar::mousePressEvent(event);
    }
    void doMouseReleaseEvent(QMouseEvent *event)
    {
        return QScrollBar::mouseReleaseEvent(event);
    }
    void doWheelEvent(QWheelEvent *event)
    {
        return QScrollBar::wheelEvent(event);
    }

protected:
    HIDE_EVENT(QScrollBar::hideEvent(event))

    PAINT_EVENT(QScrollBar::paintEvent(event))

    MOUSE_PRESS_EVENT(QScrollBar::mousePressEvent(event))

    MOUSE_RELEASE_EVENT(QScrollBar::mouseReleaseEvent(event))

    MOUSE_MOVE_EVENT(QScrollBar::mouseMoveEvent(event))

    WHEEL_EVENT(QScrollBar::wheelEvent(event))
};

#endif