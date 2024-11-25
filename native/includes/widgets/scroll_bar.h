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
    ~CjScrollBar()
    {
        // appConfig->wheelEventMapRemove(reinterpret_cast<uintptr_t>(this));
        // appConfig->contextMenuEventMapRemove(reinterpret_cast<uintptr_t>(this));
        // appConfig->paintEventMapRemove(reinterpret_cast<uintptr_t>(this));
        // appConfig->mouseMoveEventMapRemove(reinterpret_cast<uintptr_t>(this));
        // appConfig->mousePressEventMapRemove(reinterpret_cast<uintptr_t>(this));
        // appConfig->mouseReleaseEventMapRemove(reinterpret_cast<uintptr_t>(this));
        // appConfig->hideEventMapRemove(reinterpret_cast<uintptr_t>(this));
    }

public:
    void doContextMenuEvent(QContextMenuEvent *event)
    {
        QScrollBar::contextMenuEvent(event);
    }
    void doHideEvent(QHideEvent *event)
    {
        QScrollBar::hideEvent(event);
    }
    void doPaintEvent(QPaintEvent *event)
    {
        QScrollBar::paintEvent(event);
    }
    void doMouseMoveEvent(QMouseEvent *event)
    {
        QScrollBar::mouseMoveEvent(event);
    }
    void doMousePressEvent(QMouseEvent *event)
    {
        QScrollBar::mousePressEvent(event);
    }
    void doMouseReleaseEvent(QMouseEvent *event)
    {
        QScrollBar::mouseReleaseEvent(event);
    }
    void doWheelEvent(QWheelEvent *event)
    {
        QScrollBar::wheelEvent(event);
    }
    void doSliderChange(QAbstractSlider::SliderChange change)
    {
        QScrollBar::sliderChange(change);
    }

protected:
    CONTEXT_MENU_EVENT(QScrollBar::contextMenuEvent(event))

    HIDE_EVENT(QScrollBar::hideEvent(event))

    PAINT_EVENT(QScrollBar::paintEvent(event))

    MOUSE_PRESS_EVENT(QScrollBar::mousePressEvent(event))

    MOUSE_RELEASE_EVENT(QScrollBar::mouseReleaseEvent(event))

    MOUSE_MOVE_EVENT(QScrollBar::mouseMoveEvent(event))

    WHEEL_EVENT(QScrollBar::wheelEvent(event))
};

#endif