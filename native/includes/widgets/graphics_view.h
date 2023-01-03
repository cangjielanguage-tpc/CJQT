#ifndef __GRAPHICS_VIEW_H_
#define __GRAPHICS_VIEW_H_
#include <QGraphicsView>
#include "object.h"

class CjGraphicsView : public QGraphicsView
{
    Q_OBJECT
public:
    CjGraphicsView(QGraphicsScene *scene, QWidget *parent = nullptr) : QGraphicsView(scene, parent) {}
    CjGraphicsView(QWidget *parent = nullptr) : QGraphicsView(parent) {}
    ~CjGraphicsView()
    {
        // appConfig->wheelEventMapRemove(reinterpret_cast<long>(this));
        // appConfig->contextMenuEventMapRemove(reinterpret_cast<long>(this));
        // appConfig->paintEventMapRemove(reinterpret_cast<long>(this));
        // appConfig->mouseMoveEventMapRemove(reinterpret_cast<long>(this));
        // appConfig->mousePressEventMapRemove(reinterpret_cast<long>(this));
        // appConfig->mouseReleaseEventMapRemove(reinterpret_cast<long>(this));
        // appConfig->hideEventMapRemove(reinterpret_cast<long>(this));
    }

public:
    void doContextMenuEvent(QContextMenuEvent *event)
    {
        QGraphicsView::contextMenuEvent(event);
    }
    void doHideEvent(QHideEvent *event)
    {
        QGraphicsView::hideEvent(event);
    }
    void doPaintEvent(QPaintEvent *event)
    {
        QGraphicsView::paintEvent(event);
    }
    void doMouseMoveEvent(QMouseEvent *event)
    {
        QGraphicsView::mouseMoveEvent(event);
    }
    void doMousePressEvent(QMouseEvent *event)
    {
        QGraphicsView::mousePressEvent(event);
    }
    void doMouseReleaseEvent(QMouseEvent *event)
    {
        QGraphicsView::mouseReleaseEvent(event);
    }
    void doWheelEvent(QWheelEvent *event)
    {
        QGraphicsView::wheelEvent(event);
    }

protected:
    CONTEXT_MENU_EVENT(QGraphicsView::contextMenuEvent(event))

    HIDE_EVENT(QGraphicsView::hideEvent(event))

    PAINT_EVENT(QGraphicsView::paintEvent(event))

    MOUSE_PRESS_EVENT(QGraphicsView::mousePressEvent(event))

    MOUSE_RELEASE_EVENT(QGraphicsView::mouseReleaseEvent(event))

    MOUSE_MOVE_EVENT(QGraphicsView::mouseMoveEvent(event))

    WHEEL_EVENT(QGraphicsView::wheelEvent(event))
};

#endif