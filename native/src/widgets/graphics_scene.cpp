#include "graphics_scene.h"

extern "C"
{
    uintptr_t nativeGraphicsSceneCreate(double x, double y, double width, double heigh, uintptr_t parentPtr)
    {
        APPLICATION_CREATE
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
        return reinterpret_cast<uintptr_t>(graphicsScene);
    }
    uintptr_t nativeGraphicsSceneCreateWithRectF(const uintptr_t rectFPtr, uintptr_t parentPtr)
    {
        APPLICATION_CREATE
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
        return reinterpret_cast<uintptr_t>(graphicsScene);
    }
    uintptr_t nativeGraphicsSceneCreateWithParent(uintptr_t parentPtr)
    {
        APPLICATION_CREATE
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
        return reinterpret_cast<uintptr_t>(graphicsScene);
    }
    void nativeGraphicsSceneDelete(uintptr_t ptr)
    {
        CjGraphicsScene *instance = reinterpret_cast<CjGraphicsScene *>(static_cast<uintptr_t>(ptr));
        delete instance;
    }

    QRectF nativeGraphicsSceneScenRect(uintptr_t ptr)
    {
        QGraphicsScene *scene = reinterpret_cast<QGraphicsScene *>(static_cast<uintptr_t>(ptr));
      //  QRectF rectF = scene->sceneRect();
        // QRectF *p = new QRectF(rectF);
        return scene->sceneRect();
    }
    void nativeGraphicsSceneSetScenRectWithRect(uintptr_t ptr, const uintptr_t rectFPtr)
    {
        QGraphicsScene *scene = reinterpret_cast<QGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QRectF *rectF = reinterpret_cast<QRectF *>(static_cast<uintptr_t>(rectFPtr));
        scene->setSceneRect(*rectF);
    }
    void nativeGraphicsSceneSetScenRect(uintptr_t ptr, double x, double y, double w, double h)
    {
        QGraphicsScene *scene = reinterpret_cast<QGraphicsScene *>(static_cast<uintptr_t>(ptr));
        scene->setSceneRect(x, y, w, h);
    }
    uintptr_t nativeGraphicsSceneBackgroundBrush(uintptr_t ptr)
    {
        QGraphicsScene *scene = reinterpret_cast<QGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QBrush brush = scene->backgroundBrush();
        QBrush *p = new QBrush(brush);
        return reinterpret_cast<uintptr_t>(p);
    }
    void nativeGraphicsSceneSetBackgroundBrush(uintptr_t ptr, const uintptr_t brushPtr)
    {
        QGraphicsScene *scene = reinterpret_cast<QGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QBrush *brush = reinterpret_cast<QBrush *>(static_cast<uintptr_t>(brushPtr));
        scene->setBackgroundBrush(*brush);
    }
    void nativeGraphicsSceneAddItem(uintptr_t ptr, const uintptr_t itemPtr)
    {
        QGraphicsScene *scene = reinterpret_cast<QGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QGraphicsItem *item = reinterpret_cast<QGraphicsItem *>(static_cast<uintptr_t>(itemPtr));
        scene->addItem(item);
    }

    // Graphics Event

    void nativeGraphicsSceneContextMenuEvent(uintptr_t ptr, uintptr_t eventPtr)
    {
        CjGraphicsScene *instance = reinterpret_cast<CjGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QGraphicsSceneContextMenuEvent *event = reinterpret_cast<QGraphicsSceneContextMenuEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doContextMenuEvent(event);
    }
    void nativeGraphicsSceneDragEnterEvent(uintptr_t ptr, uintptr_t eventPtr)
    {
        CjGraphicsScene *instance = reinterpret_cast<CjGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QGraphicsSceneDragDropEvent *event = reinterpret_cast<QGraphicsSceneDragDropEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doDragEnterEvent(event);
    }
    void nativeGraphicsSceneDragLeaveEvent(uintptr_t ptr, uintptr_t eventPtr)
    {
        CjGraphicsScene *instance = reinterpret_cast<CjGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QGraphicsSceneDragDropEvent *event = reinterpret_cast<QGraphicsSceneDragDropEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doDragLeaveEvent(event);
    }
    void nativeGraphicsSceneDragMoveEvent(uintptr_t ptr, uintptr_t eventPtr)
    {
        CjGraphicsScene *instance = reinterpret_cast<CjGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QGraphicsSceneDragDropEvent *event = reinterpret_cast<QGraphicsSceneDragDropEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doDragMoveEvent(event);
    }
    void nativeGraphicsSceneDropEvent(uintptr_t ptr, uintptr_t eventPtr)
    {
        CjGraphicsScene *instance = reinterpret_cast<CjGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QGraphicsSceneDragDropEvent *event = reinterpret_cast<QGraphicsSceneDragDropEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doDropEvent(event);
    }
    void nativeGraphicsSceneFocusOutEvent(uintptr_t ptr, uintptr_t eventPtr)
    {
        CjGraphicsScene *instance = reinterpret_cast<CjGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QFocusEvent *event = reinterpret_cast<QFocusEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doFocusOutEvent(event);
    }
    void nativeGraphicsSceneHelpEvent(uintptr_t ptr, uintptr_t eventPtr)
    {
        CjGraphicsScene *instance = reinterpret_cast<CjGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QGraphicsSceneHelpEvent *event = reinterpret_cast<QGraphicsSceneHelpEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doHelpEvent(event);
    }
    void nativeGraphicsSceneInputMethodEvent(uintptr_t ptr, uintptr_t eventPtr)
    {
        CjGraphicsScene *instance = reinterpret_cast<CjGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QInputMethodEvent *event = reinterpret_cast<QInputMethodEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doInputMethodEvent(event);
    }
    void nativeGraphicsSceneMouseDoubleClickEvent(uintptr_t ptr, uintptr_t eventPtr)
    {
        CjGraphicsScene *instance = reinterpret_cast<CjGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QGraphicsSceneMouseEvent *event = reinterpret_cast<QGraphicsSceneMouseEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doMouseDoubleClickEvent(event);
    }
    void nativeGraphicsSceneMouseMoveEvent(uintptr_t ptr, uintptr_t eventPtr)
    {
        CjGraphicsScene *instance = reinterpret_cast<CjGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QGraphicsSceneMouseEvent *event = reinterpret_cast<QGraphicsSceneMouseEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doMouseMoveEvent(event);
    }
    void nativeGraphicsSceneMousePressEvent(uintptr_t ptr, uintptr_t eventPtr)
    {
        CjGraphicsScene *instance = reinterpret_cast<CjGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QGraphicsSceneMouseEvent *event = reinterpret_cast<QGraphicsSceneMouseEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doMousePressEvent(event);
    }
    void nativeGraphicsSceneMouseReleaseEvent(uintptr_t ptr, uintptr_t eventPtr)
    {
        CjGraphicsScene *instance = reinterpret_cast<CjGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QGraphicsSceneMouseEvent *event = reinterpret_cast<QGraphicsSceneMouseEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doMouseReleaseEvent(event);
    }
    void nativeGraphicsSceneKeyPressEvent(uintptr_t ptr, uintptr_t eventPtr)
    {
        CjGraphicsScene *instance = reinterpret_cast<CjGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QKeyEvent *event = reinterpret_cast<QKeyEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doKeyPressEvent(event);
    }
    void nativeGraphicsSceneKeyReleaseEvent(uintptr_t ptr, uintptr_t eventPtr)
    {
        CjGraphicsScene *instance = reinterpret_cast<CjGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QKeyEvent *event = reinterpret_cast<QKeyEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doKeyReleaseEvent(event);
    }
    void nativeGraphicsSceneWheelEvent(uintptr_t ptr, uintptr_t eventPtr)
    {
        CjGraphicsScene *instance = reinterpret_cast<CjGraphicsScene *>(static_cast<uintptr_t>(ptr));
        QGraphicsSceneWheelEvent *event = reinterpret_cast<QGraphicsSceneWheelEvent *>(static_cast<uintptr_t>(eventPtr));
        instance->doWheelEvent(event);
    }
    // Set  Graphics Event

    void nativeGraphicsSceneSetContextMenuEvent(uintptr_t ptr, nativeEventCallback callback)
    {
        appConfig->contextMenuEventMapPut(ptr, callback);
    }
    void nativeGraphicsSceneSetDragEnterEvent(uintptr_t ptr, nativeEventCallback callback)
    {
        appConfig->dragEnterEventMapPut(ptr, callback);
    }
    void nativeGraphicsSceneSetDragLeaveEvent(uintptr_t ptr, nativeEventCallback callback)
    {
        appConfig->dragLeaveEventMapPut(ptr, callback);
    }
    void nativeGraphicsSceneSetDragMoveEvent(uintptr_t ptr, nativeEventCallback callback)
    {
        appConfig->dragMoveEventMapPut(ptr, callback);
    }
    void nativeGraphicsSceneSetDropEvent(uintptr_t ptr, nativeEventCallback callback)
    {
        appConfig->dropEventMapPut(ptr, callback);
    }
    void nativeGraphicsSceneSetFocusOutEvent(uintptr_t ptr, nativeEventCallback callback)
    {
        appConfig->focusOutEventMapPut(ptr, callback);
    }
    void nativeGraphicsSceneSetHelpEvent(uintptr_t ptr, nativeEventCallback callback)
    {
        appConfig->helpEventMapPut(ptr, callback);
    }
    void nativeGraphicsSceneSetInputMethodEvent(uintptr_t ptr, nativeEventCallback callback)
    {
        appConfig->inputMethodEventMapPut(ptr, callback);
    }
    void nativeGraphicsSceneSetMouseDoubleClickEvent(uintptr_t ptr, nativeEventCallback callback)
    {
        appConfig->mouseDoubleClickEventMapPut(ptr, callback);
    }
    void nativeGraphicsSceneSetMouseMoveEvent(uintptr_t ptr, nativeCallbackPointer callback)
    {
        appConfig->callbackMapPut((char *)"graphicsMouseMoveEvent", ptr, callback);
    }
    void nativeGraphicsSceneSetMousePressEvent(uintptr_t ptr, nativeCallbackPointer callback)
    {
        appConfig->callbackMapPut((char *)"graphicsMousePressEvent", ptr, callback);
    }
    void nativeGraphicsSceneSetMouseReleaseEvent(uintptr_t ptr, nativeCallbackPointer callback)
    {
        appConfig->callbackMapPut((char *)"graphicsMouseReleaseEvent", ptr, callback);
    }
    void nativeGraphicsSceneSetKeyPressEvent(uintptr_t ptr, nativeCallbackPointer callback)
    {
        appConfig->callbackMapPut((char *)"graphicsKeyPressEvent", ptr, callback);
    }
    void nativeGraphicsSceneSetKeyReleaseEvent(uintptr_t ptr, nativeEventCallback callback)
    {
        appConfig->keyReleaseEventMapPut(ptr, callback);
    }
    void nativeGraphicsSceneSetWheelEvent(uintptr_t ptr, nativeEventCallback callback)
    {
        appConfig->wheelEventMapPut(ptr, callback);
    }
}
