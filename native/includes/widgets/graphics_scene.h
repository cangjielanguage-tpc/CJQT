#ifndef __GRAPHICS_SCENE_H_
#define __GRAPHICS_SCENE_H_
#include <QGraphicsScene>
#include "object.h"

class CjGraphicsScene : public QGraphicsScene
{
    Q_OBJECT
public:
    CjGraphicsScene(qreal x, qreal y, qreal width, qreal height, QObject *parent = nullptr) : QGraphicsScene(x, y, width, height, parent) {}
    CjGraphicsScene(const QRectF &sceneRect, QObject *parent = nullptr) : QGraphicsScene(sceneRect, parent) {}
    CjGraphicsScene(QObject *parent = nullptr) : QGraphicsScene(parent)
    {
        appConfig->contextMenuEventMapRemove(reinterpret_cast<long>(this));
        appConfig->dragEnterEventMapRemove(reinterpret_cast<long>(this));
        appConfig->dragLeaveEventMapRemove(reinterpret_cast<long>(this));
        appConfig->dragMoveEventMapRemove(reinterpret_cast<long>(this));
        appConfig->dropEventMapRemove(reinterpret_cast<long>(this));
        appConfig->focusOutEventMapRemove(reinterpret_cast<long>(this));
        appConfig->helpEventMapRemove(reinterpret_cast<long>(this));
        appConfig->inputMethodEventMapRemove(reinterpret_cast<long>(this));
        appConfig->mouseDoubleClickEventMapRemove(reinterpret_cast<long>(this));

        appConfig->callbackMapRemove((char *)"graphicsMouseMoveEvent", reinterpret_cast<long>(this));
        appConfig->callbackMapRemove((char *)"graphicsMousePressEvent", reinterpret_cast<long>(this));
        appConfig->callbackMapRemove((char *)"graphicsMouseReleaseEvent", reinterpret_cast<long>(this));
        appConfig->callbackMapRemove((char *)"graphicsKeyPressEvent", reinterpret_cast<long>(this));

        appConfig->keyReleaseEventMapRemove(reinterpret_cast<long>(this));
        appConfig->wheelEventMapRemove(reinterpret_cast<long>(this));
    }

public:
    void doContextMenuEvent(QGraphicsSceneContextMenuEvent *event)
    {
        QGraphicsScene::contextMenuEvent(event);
    }
    void doDragEnterEvent(QGraphicsSceneDragDropEvent *event)
    {
        QGraphicsScene::dragEnterEvent(event);
    }
    void doDragLeaveEvent(QGraphicsSceneDragDropEvent *event)
    {
        QGraphicsScene::dragLeaveEvent(event);
    }
    void doDragMoveEvent(QGraphicsSceneDragDropEvent *event)
    {
        QGraphicsScene::dragMoveEvent(event);
    }
    void doDropEvent(QGraphicsSceneDragDropEvent *event)
    {
        QGraphicsScene::dropEvent(event);
    }
    void doFocusOutEvent(QFocusEvent *event)
    {
        QGraphicsScene::focusOutEvent(event);
    }
    void doHelpEvent(QGraphicsSceneHelpEvent *event)
    {
        QGraphicsScene::helpEvent(event);
    }
    void doInputMethodEvent(QInputMethodEvent *event)
    {
        QGraphicsScene::inputMethodEvent(event);
    }
    void doMouseDoubleClickEvent(QGraphicsSceneMouseEvent *event)
    {
        QGraphicsScene::mouseDoubleClickEvent(event);
    }
    void doMouseMoveEvent(QGraphicsSceneMouseEvent *event)
    {
        QGraphicsScene::mouseMoveEvent(event);
    }
    void doMousePressEvent(QGraphicsSceneMouseEvent *event)
    {
        QGraphicsScene::mousePressEvent(event);
    }
    void doMouseReleaseEvent(QGraphicsSceneMouseEvent *event)
    {
        QGraphicsScene::mouseReleaseEvent(event);
    }
    void doKeyPressEvent(QKeyEvent *event)
    {
        QGraphicsScene::keyPressEvent(event);
    }
    void doKeyReleaseEvent(QKeyEvent *event)
    {
        QGraphicsScene::keyReleaseEvent(event);
    }
    void doWheelEvent(QGraphicsSceneWheelEvent *event)
    {
        QGraphicsScene::wheelEvent(event);
    }

protected:
    GRAPHICS_CONTEXT_MENU_EVENT(QGraphicsScene::contextMenuEvent(event));
    GRAPHICS_DRAG_ENTER_EVENT(QGraphicsScene::dragEnterEvent(event));
    GRAPHICS_DRAG_LEAVE_EVENT(QGraphicsScene::dragLeaveEvent(event));
    GRAPHICS_DRAG_MOVE_EVENT(QGraphicsScene::dragMoveEvent(event));
    GRAPHICS_DROP_EVENT(QGraphicsScene::dropEvent(event));
    FOCUS_OUT_EVENT(QGraphicsScene::focusOutEvent(event));
    GRAPHICS_HELP_EVENT(QGraphicsScene::helpEvent(event));
    INPUT_METHOD_EVENT(QGraphicsScene::inputMethodEvent(event));
    GRAPHICS_MOUSE_DOUBLE_CLICK_EVENT(QGraphicsScene::mouseDoubleClickEvent(event));
    GRAPHICS_MOUSE_PRESS_EVENT(QGraphicsScene::mousePressEvent(event));
    GRAPHICS_MOUSE_RELEASE_EVENT(QGraphicsScene::mouseReleaseEvent(event));
    GRAPHICS_MOUSE_MOVE_EVENT(QGraphicsScene::mouseMoveEvent(event));
    KEY_PRESS_EVENT(QGraphicsScene::keyPressEvent(event));
    KEY_RELEASE_EVENT(QGraphicsScene::keyReleaseEvent(event));
    GRAPHICS_WHEEL_EVENT(QGraphicsScene::wheelEvent(event));
};

#endif