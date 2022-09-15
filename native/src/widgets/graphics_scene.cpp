#include "graphics_scene.h"

extern "C"
{
    long nativeGraphicsSceneCreate(double x, double y, double width, double heigh, long parentPtr)
    {
        CjGraphicsScene *graphicsScene;
        if (parentPtr == 0L)
        {
            graphicsScene = new CjGraphicsScene(x, y, width, heigh);
        }
        else
        {
            QObject *parent = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
            graphicsScene = new CjGraphicsScene(x, y, width, heigh, parent);
        }
        return reinterpret_cast<long>(graphicsScene);
    }
    long nativeGraphicsSceneCreateWithRectF(const long rectFPtr, long parentPtr)
    {
        CjGraphicsScene *graphicsScene;
        QRectF *rectF = reinterpret_cast<QRectF *>(static_cast<uintptr_t>(rectFPtr));
        if (parentPtr == 0L)
        {
            graphicsScene = new CjGraphicsScene(*rectF);
        }
        else
        {
            QObject *parent = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
            graphicsScene = new CjGraphicsScene(*rectF, parent);
        }
        return reinterpret_cast<long>(graphicsScene);
    }
    long nativeGraphicsSceneCreateWithParent(long parentPtr)
    {
        CjGraphicsScene *graphicsScene;
        if (parentPtr == 0L)
        {
            graphicsScene = new CjGraphicsScene();
        }
        else
        {
            QObject *parent = reinterpret_cast<QObject *>(static_cast<uintptr_t>(parentPtr));
            graphicsScene = new CjGraphicsScene(parent);
        }
        return reinterpret_cast<long>(graphicsScene);
    }
    void nativeGraphicsSceneDelete(long ptr)
    {
        CjGraphicsScene *instance = reinterpret_cast<CjGraphicsScene *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    long nativeGraphicsSceneScenRect(long ptr)
    {
        QGraphicsScene *scene = reinterpret_cast<QGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QRectF rectF = scene->sceneRect();
        QRectF *p = new QRectF(rectF);
        return reinterpret_cast<long>(p);
    }
    void nativeGraphicsSceneSetScenRectWithRect(long ptr, const long rectFPtr)
    {
        QGraphicsScene *scene = reinterpret_cast<QGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QRectF *rectF = reinterpret_cast<QRectF *>(static_cast<uintptr_t>(rectFPtr));
        scene->setSceneRect(*rectF);
    }
    void nativeGraphicsSceneSetScenRect(long ptr, double x, double y, double w, double h)
    {
        QGraphicsScene *scene = reinterpret_cast<QGraphicsScene *>(static_cast<uintptr_t>(ptr));
        scene->setSceneRect(x, y, w, h);
    }
    long nativeGraphicsSceneBackgroundBrush(long ptr)
    {
        QGraphicsScene *scene = reinterpret_cast<QGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QBrush brush = scene->backgroundBrush();
        QBrush *p = new QBrush(brush);
        return reinterpret_cast<long>(p);
    }
    void nativeGraphicsSceneSetBackgroundBrush(long ptr, const long brushPtr)
    {
        QGraphicsScene *scene = reinterpret_cast<QGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QBrush *brush = reinterpret_cast<QBrush *>(static_cast<uintptr_t>(brushPtr));
        scene->setBackgroundBrush(*brush);
    }
    void nativeGraphicsSceneAddItem(long ptr, const long itemPtr)
    {
        QGraphicsScene *scene = reinterpret_cast<QGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QGraphicsItem *item = reinterpret_cast<QGraphicsItem *>(static_cast<uintptr_t>(itemPtr));
        scene->addItem(item);
    }

    // Graphics Event

    void nativeGraphicsSceneContextMenuEvent(long ptr, long eventPtr)
    {
        CjGraphicsScene *instance = reinterpret_cast<CjGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QGraphicsSceneContextMenuEvent *event = reinterpret_cast<QGraphicsSceneContextMenuEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doContextMenuEvent(event);
    }
    void nativeGraphicsSceneDragEnterEvent(long ptr, long eventPtr)
    {
        CjGraphicsScene *instance = reinterpret_cast<CjGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QGraphicsSceneDragDropEvent *event = reinterpret_cast<QGraphicsSceneDragDropEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doDragEnterEvent(event);
    }
    void nativeGraphicsSceneDragLeaveEvent(long ptr, long eventPtr)
    {
        CjGraphicsScene *instance = reinterpret_cast<CjGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QGraphicsSceneDragDropEvent *event = reinterpret_cast<QGraphicsSceneDragDropEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doDragLeaveEvent(event);
    }
    void nativeGraphicsSceneDragMoveEvent(long ptr, long eventPtr)
    {
        CjGraphicsScene *instance = reinterpret_cast<CjGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QGraphicsSceneDragDropEvent *event = reinterpret_cast<QGraphicsSceneDragDropEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doDragMoveEvent(event);
    }
    void nativeGraphicsSceneDropEvent(long ptr, long eventPtr)
    {
        CjGraphicsScene *instance = reinterpret_cast<CjGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QGraphicsSceneDragDropEvent *event = reinterpret_cast<QGraphicsSceneDragDropEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doDropEvent(event);
    }
    void nativeGraphicsSceneFocusOutEvent(long ptr, long eventPtr)
    {
        CjGraphicsScene *instance = reinterpret_cast<CjGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QFocusEvent *event = reinterpret_cast<QFocusEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doFocusOutEvent(event);
    }
    void nativeGraphicsSceneHelpEvent(long ptr, long eventPtr)
    {
        CjGraphicsScene *instance = reinterpret_cast<CjGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QGraphicsSceneHelpEvent *event = reinterpret_cast<QGraphicsSceneHelpEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doHelpEvent(event);
    }
    void nativeGraphicsSceneInputMethodEvent(long ptr, long eventPtr)
    {
        CjGraphicsScene *instance = reinterpret_cast<CjGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QInputMethodEvent *event = reinterpret_cast<QInputMethodEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doInputMethodEvent(event);
    }
    void nativeGraphicsSceneMouseDoubleClickEvent(long ptr, long eventPtr)
    {
        CjGraphicsScene *instance = reinterpret_cast<CjGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QGraphicsSceneMouseEvent *event = reinterpret_cast<QGraphicsSceneMouseEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doMouseDoubleClickEvent(event);
    }
    void nativeGraphicsSceneMouseMoveEvent(long ptr, long eventPtr)
    {
        CjGraphicsScene *instance = reinterpret_cast<CjGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QGraphicsSceneMouseEvent *event = reinterpret_cast<QGraphicsSceneMouseEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doMouseMoveEvent(event);
    }
    void nativeGraphicsSceneMousePressEvent(long ptr, long eventPtr)
    {
        CjGraphicsScene *instance = reinterpret_cast<CjGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QGraphicsSceneMouseEvent *event = reinterpret_cast<QGraphicsSceneMouseEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doMousePressEvent(event);
    }
    void nativeGraphicsSceneMouseReleaseEvent(long ptr, long eventPtr)
    {
        CjGraphicsScene *instance = reinterpret_cast<CjGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QGraphicsSceneMouseEvent *event = reinterpret_cast<QGraphicsSceneMouseEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doMouseReleaseEvent(event);
    }
    void nativeGraphicsSceneKeyPressEvent(long ptr, long eventPtr)
    {
        CjGraphicsScene *instance = reinterpret_cast<CjGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QKeyEvent *event = reinterpret_cast<QKeyEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doKeyPressEvent(event);
    }
    void nativeGraphicsSceneKeyReleaseEvent(long ptr, long eventPtr)
    {
        CjGraphicsScene *instance = reinterpret_cast<CjGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QKeyEvent *event = reinterpret_cast<QKeyEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doKeyReleaseEvent(event);
    }
    void nativeGraphicsSceneWheelEvent(long ptr, long eventPtr)
    {
        CjGraphicsScene *instance = reinterpret_cast<CjGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QGraphicsSceneWheelEvent *event = reinterpret_cast<QGraphicsSceneWheelEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doWheelEvent(event);
    }
    // Set  Graphics Event

    void nativeGraphicsSceneSetContextMenuEvent(long ptr, nativeEventCallback callback)
    {
        appConfig->contextMenuEventMapPut(ptr, callback);
    }
    void nativeGraphicsSceneSetDragEnterEvent(long ptr, nativeEventCallback callback)
    {
        appConfig->dragEnterEventMapPut(ptr, callback);
    }
    void nativeGraphicsSceneSetDragLeaveEvent(long ptr, nativeEventCallback callback)
    {
        appConfig->dragLeaveEventMapPut(ptr, callback);
    }
    void nativeGraphicsSceneSetDragMoveEvent(long ptr, nativeEventCallback callback)
    {
        appConfig->dragMoveEventMapPut(ptr, callback);
    }
    void nativeGraphicsSceneSetDropEvent(long ptr, nativeEventCallback callback)
    {
        appConfig->dropEventMapPut(ptr, callback);
    }
    void nativeGraphicsSceneSetFocusOutEvent(long ptr, nativeEventCallback callback)
    {
        appConfig->focusOutEventMapPut(ptr, callback);
    }
    void nativeGraphicsSceneSetHelpEvent(long ptr, nativeEventCallback callback)
    {
        appConfig->helpEventMapPut(ptr, callback);
    }
    void nativeGraphicsSceneSetInputMethodEvent(long ptr, nativeEventCallback callback)
    {
        appConfig->inputMethodEventMapPut(ptr, callback);
    }
    void nativeGraphicsSceneSetMouseDoubleClickEvent(long ptr, nativeEventCallback callback)
    {
        appConfig->mouseDoubleClickEventMapPut(ptr, callback);
    }
    void nativeGraphicsSceneSetMouseMoveEvent(long ptr, nativeEventCallback callback)
    {
        appConfig->mouseMoveEventMapPut(ptr, callback);
    }
    void nativeGraphicsSceneSetMousePressEvent(long ptr, nativeEventCallback callback)
    {
        appConfig->mousePressEventMapPut(ptr, callback);
    }
    void nativeGraphicsSceneSetMouseReleaseEvent(long ptr, nativeEventCallback callback)
    {
        appConfig->mouseReleaseEventMapPut(ptr, callback);
    }
    void nativeGraphicsSceneSetKeyPressEvent(long ptr, nativeEventCallback callback)
    {
        appConfig->keyPressEventMapPut(ptr, callback);
    }
    void nativeGraphicsSceneSetKeyReleaseEvent(long ptr, nativeEventCallback callback)
    {
        appConfig->keyReleaseEventMapPut(ptr, callback);
    }
    void nativeGraphicsSceneSetWheelEvent(long ptr, nativeEventCallback callback)
    {
        appConfig->wheelEventMapPut(ptr, callback);
    }
}