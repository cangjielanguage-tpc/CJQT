package qt.widgets

import qt.tools.*

public class QGraphicsSceneCallbackMap <: QCallbackMap {
    /* let member contextMenuEvent */
    public static let contextMenuEvent = HashMap<Int64, (QGraphicsSceneContextMenuEvent) -> Unit>()

    /* let member keyPressEvent */
    public static let keyPressEvent = HashMap<Int64, (QKeyEvent) -> Unit>()

    /* let member keyReleaseEvent */
    public static let keyReleaseEvent = HashMap<Int64, (QKeyEvent) -> Unit>()

    /* let member mouseDoubleClickEvent */
    public static let mouseDoubleClickEvent = HashMap<Int64, (QGraphicsSceneMouseEvent) -> Unit>()

    /* let member mousePressEvent */
    public static let mousePressEvent = HashMap<Int64, (QGraphicsSceneMouseEvent) -> Unit>()

    /* let member mouseReleaseEvent */
    public static let mouseReleaseEvent = HashMap<Int64, (QGraphicsSceneMouseEvent) -> Unit>()

    /* let member mouseMoveEvent */
    public static let mouseMoveEvent = HashMap<Int64, (QGraphicsSceneMouseEvent) -> Unit>()

    /* let member wheelEvent */
    public static let wheelEvent = HashMap<Int64, (QGraphicsSceneWheelEvent) -> Unit>()

    /* let member dragEnterEvent */
    public static let dragEnterEvent = HashMap<Int64, (QGraphicsSceneDragDropEvent) -> Unit>()

    /* let member dragLeaveEvent */
    public static let dragLeaveEvent = HashMap<Int64, (QGraphicsSceneDragDropEvent) -> Unit>()

    /* let member dragMoveEvent */
    public static let dragMoveEvent = HashMap<Int64, (QGraphicsSceneDragDropEvent) -> Unit>()

    /* let member dropEvent */
    public static let dropEvent = HashMap<Int64, (QGraphicsSceneDragDropEvent) -> Unit>()

    /* let member focusOutEvent */
    public static let focusOutEvent = HashMap<Int64, (QFocusEvent) -> Unit>()

    /* let member helpEvent */
    public static let helpEvent = HashMap<Int64, (QGraphicsSceneHelpEvent) -> Unit>()

    /* let member inputMethodEvent */
    public static let inputMethodEvent = HashMap<Int64, (QInputMethodEvent) -> Unit>()
}

//C
@c
func graphicsSceneContextMenuEventCallback(ptr: Int64, eventPtr: Int64): Unit {
    let event = QGraphicsSceneContextMenuEvent(eventPtr)
    try {
        QGraphicsSceneCallbackMap.contextMenuEvent[ptr](event)
    } catch (e: Exception) {
        println(e)
    }
}

@c
func graphicsSceneDragEnterEventCallback(ptr: Int64, eventPtr: Int64): Unit {
    let event = QGraphicsSceneDragDropEvent(eventPtr)
    try {
        QGraphicsSceneCallbackMap.dragEnterEvent[ptr](event)
    } catch (e: Exception) {
        println(e)
    }
}

@c
func graphicsSceneDragLeaveEventCallback(ptr: Int64, eventPtr: Int64): Unit {
    let event = QGraphicsSceneDragDropEvent(eventPtr)
    try {
        QGraphicsSceneCallbackMap.dragLeaveEvent[ptr](event)
    } catch (e: Exception) {
        println(e)
    }
}

@c
func graphicsSceneDragMoveEventCallback(ptr: Int64, eventPtr: Int64): Unit {
    let event = QGraphicsSceneDragDropEvent(eventPtr)
    try {
        QGraphicsSceneCallbackMap.dragMoveEvent[ptr](event)
    } catch (e: Exception) {
        println(e)
    }
}

@c
func graphicsSceneDropEventCallback(ptr: Int64, eventPtr: Int64): Unit {
    let event = QGraphicsSceneDragDropEvent(eventPtr)
    try {
        QGraphicsSceneCallbackMap.dropEvent[ptr](event)
    } catch (e: Exception) {
        println(e)
    }
}

@c
func graphicsSceneFocusOutEventCallback(ptr: Int64, eventPtr: Int64): Unit {
    let event = QFocusEvent(eventPtr)
    try {
        QGraphicsSceneCallbackMap.focusOutEvent[ptr](event)
    } catch (e: Exception) {
        println(e)
    }
}

@c
func graphicsSceneHelpEventCallback(ptr: Int64, eventPtr: Int64): Unit {
    let event = QGraphicsSceneHelpEvent(eventPtr)
    try {
        QGraphicsSceneCallbackMap.helpEvent[ptr](event)
    } catch (e: Exception) {
        println(e)
    }
}

@c
func graphicsSceneInputMethodEventCallback(ptr: Int64, eventPtr: Int64): Unit {
    let event = QInputMethodEvent(eventPtr)
    try {
        QGraphicsSceneCallbackMap.inputMethodEvent[ptr](event)
    } catch (e: Exception) {
        println(e)
    }
}

@c
func graphicsSceneMouseDoubleClickEventCallback(ptr: Int64, eventPtr: Int64): Unit {
    let event = QGraphicsSceneMouseEvent(eventPtr)
    try {
        QGraphicsSceneCallbackMap.mouseDoubleClickEvent[ptr](event)
    } catch (e: Exception) {
        println(e)
    }
}

@c
func graphicsSceneMouseMoveEventCallback(ptr: Int64, eventPtr: Int64): Unit {
    let event = QGraphicsSceneMouseEvent(eventPtr)
    try {
        QGraphicsSceneCallbackMap.mouseMoveEvent[ptr](event)
    } catch (e: Exception) {
        println(e)
    }
}

@c
func graphicsSceneMousePressEventCallback(ptr: Int64, eventPtr: Int64): Unit {
    let event = QGraphicsSceneMouseEvent(eventPtr)
    try {
        QGraphicsSceneCallbackMap.mousePressEvent[ptr](event)
    } catch (e: Exception) {
        println(e)
    }
}

@c
func graphicsSceneMouseReleaseEventCallback(ptr: Int64, eventPtr: Int64): Unit {
    let event = QGraphicsSceneMouseEvent(eventPtr)
    try {
        QGraphicsSceneCallbackMap.mouseReleaseEvent[ptr](event)
    } catch (e: Exception) {
        println(e)
    }
}

@c
func graphicsSceneKeyPressEventCallback(ptr: Int64, eventPtr: Int64): Unit {
    let event = QKeyEvent(eventPtr)
    try {
        QGraphicsSceneCallbackMap.keyPressEvent[ptr](event)
    } catch (e: Exception) {
        println(e)
    }
}

@c
func graphicsSceneKeyReleaseEventCallback(ptr: Int64, eventPtr: Int64): Unit {
    let event = QKeyEvent(eventPtr)
    try {
        QGraphicsSceneCallbackMap.keyReleaseEvent[ptr](event)
    } catch (e: Exception) {
        println(e)
    }
}

@c
func graphicsSceneWheelEventCallback(ptr: Int64, eventPtr: Int64): Unit {
    let event = QGraphicsSceneWheelEvent(eventPtr)
    try {
        QGraphicsSceneCallbackMap.wheelEvent[ptr](event)
    } catch (e: Exception) {
        println(e)
    }
}
