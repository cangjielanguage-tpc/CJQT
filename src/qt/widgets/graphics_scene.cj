package qt.widgets

from std import collection.*
import qt.tools.QCallbackMap

//foreign function
foreign func nativeGraphicsSceneCreate(x: Float64, y: Float64, width: Float64, heigh: Float64, parentPtr: Int64): Int64
foreign func nativeGraphicsSceneCreateWithRectF(rectFPtr: Int64, parentPtr: Int64): Int64
foreign func nativeGraphicsSceneCreateWithParent(parentPtr: Int64): Int64
foreign func nativeGraphicsSceneDelete(ptr: Int64): Int64
foreign func nativeGraphicsSceneScenRect(ptr: Int64): Int64
foreign func nativeGraphicsSceneSetScenRectWithRect(ptr: Int64, rectFPtr: Int64): Unit
foreign func nativeGraphicsSceneSetScenRect(ptr: Int64, x: Float64, y: Float64, w: Float64, h: Float64): Unit
foreign func nativeGraphicsSceneBackgroundBrush(ptr: Int64): Int64
foreign func nativeGraphicsSceneSetBackgroundBrush(ptr: Int64, brushPtr: Int64): Unit
foreign func nativeGraphicsSceneAddItem(ptr: Int64, itemPtr: Int64): Unit

//foreign function QGraphicsEvent
foreign func nativeGraphicsSceneContextMenuEvent(ptr: Int64, eventPtr: Int64): Unit
foreign func nativeGraphicsSceneDragEnterEvent(ptr: Int64, eventPtr: Int64): Unit
foreign func nativeGraphicsSceneDragLeaveEvent(ptr: Int64, eventPtr: Int64): Unit
foreign func nativeGraphicsSceneDragMoveEvent(ptr: Int64, eventPtr: Int64): Unit
foreign func nativeGraphicsSceneDropEvent(ptr: Int64, eventPtr: Int64): Unit
foreign func nativeGraphicsSceneFocusOutEvent(ptr: Int64, eventPtr: Int64): Unit
foreign func nativeGraphicsSceneHelpEvent(ptr: Int64, eventPtr: Int64): Unit
foreign func nativeGraphicsSceneInputMethodEvent(ptr: Int64, eventPtr: Int64): Unit
foreign func nativeGraphicsSceneMouseDoubleClickEvent(ptr: Int64, eventPtr: Int64): Unit
foreign func nativeGraphicsSceneMouseMoveEvent(ptr: Int64, eventPtr: Int64): Unit
foreign func nativeGraphicsSceneMousePressEvent(ptr: Int64, eventPtr: Int64): Unit
foreign func nativeGraphicsSceneMouseReleaseEvent(ptr: Int64, eventPtr: Int64): Unit
foreign func nativeGraphicsSceneKeyPressEvent(ptr: Int64, eventPtr: Int64): Unit
foreign func nativeGraphicsSceneKeyReleaseEvent(ptr: Int64, eventPtr: Int64): Unit
foreign func nativeGraphicsSceneWheelEvent(ptr: Int64, eventPtr: Int64): Unit

//foreign function Set QGraphicsEvent 
foreign func nativeGraphicsSceneSetContextMenuEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit
foreign func nativeGraphicsSceneSetDragEnterEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit
foreign func nativeGraphicsSceneSetDragLeaveEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit
foreign func nativeGraphicsSceneSetDragMoveEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit
foreign func nativeGraphicsSceneSetDropEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit
foreign func nativeGraphicsSceneSetFocusOutEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit
foreign func nativeGraphicsSceneSetHelpEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit
foreign func nativeGraphicsSceneSetInputMethodEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit
foreign func nativeGraphicsSceneSetMouseDoubleClickEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit
foreign func nativeGraphicsSceneSetMouseMoveEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit
foreign func nativeGraphicsSceneSetMousePressEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit
foreign func nativeGraphicsSceneSetMouseReleaseEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit
foreign func nativeGraphicsSceneSetKeyPressEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit
foreign func nativeGraphicsSceneSetKeyReleaseEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit
foreign func nativeGraphicsSceneSetWheelEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit

public open class QGraphicsScene <: QObject {
    public init(ptr: Int64) {
        super(ptr)
    }
    public init(x: Float64, y: Float64, width: Float64, heigh: Float64, parent!: QObject = QObject(0)) {
        super(unsafe { nativeGraphicsSceneCreate(x, y, width, heigh, parent.ptr) })
    }

    public init(sceneRect: QRectF, parent!: QObject = QObject(0)) {
        super(unsafe { nativeGraphicsSceneCreateWithRectF(sceneRect.ptr, parent.ptr) })
    }
    public init(parent!: QObject = QObject(0)) {
        super(unsafe { nativeGraphicsSceneCreateWithParent(parent.ptr) })
    }

    public open func delete(): Unit {
        unsafe { nativeGraphicsSceneDelete(this.ptr) }
    }

    public func sceneRect(): QRectF {
        let rectFPtr = unsafe { nativeGraphicsSceneScenRect(this.ptr) }
        return QRectF(rectFPtr)
    }

    public func setSceneRect(rect: QRectF): Unit {
        unsafe { nativeGraphicsSceneSetScenRectWithRect(this.ptr, rect.ptr) }
    }
    public func setSceneRect(x: Float64, y: Float64, w: Float64, h: Float64): Unit {
        unsafe { nativeGraphicsSceneSetScenRect(this.ptr, x, y, w, h) }
    }

    public func backgroundBrush(): QBrush {
        let brushPtr = unsafe { nativeGraphicsSceneBackgroundBrush(this.ptr) }
        return QBrush(brushPtr)
    }

    public func setBackgroundBrush(brush: QBrush): Unit {
        unsafe { nativeGraphicsSceneSetBackgroundBrush(this.ptr, brush.ptr) }
    }

    public func addItem(item: QGraphicsItem): Unit {
        unsafe { nativeGraphicsSceneAddItem(this.ptr, item.ptr) }
    }

    /**
     * The Function is setContextMenuEvent
     *
     * @param callback of (QGraphicsSceneContextMenuEvent)->Unit
     */
    public func setContextMenuEvent(callback: (QGraphicsSceneContextMenuEvent) -> Unit) {
        QGraphicsSceneCallbackMap.contextMenuEvent.put(ptr, callback)
        unsafe {
            nativeGraphicsSceneSetContextMenuEvent(ptr, graphicsSceneContextMenuEventCallback)
        }
    }

    /**
     * The Function is setContextMenuEvent
     *
     */
    public func setContextMenuEvent() {
        setContextMenuEvent(contextMenuEvent)
    }

    //protected event function
    protected open func contextMenuEvent(event: QGraphicsSceneContextMenuEvent): Unit {
        unsafe {
            nativeGraphicsSceneContextMenuEvent(this.ptr, event.ptr)
        }
    }

    /**
     * The Function is setDragEnterEven
     *
     * @param callback of (QGraphicsSceneDragDropEvent)->Unit
     */
    public func setDragEnterEven(callback: (QGraphicsSceneDragDropEvent) -> Unit) {
        QGraphicsSceneCallbackMap.dragEnterEvent.put(ptr, callback)
        unsafe {
            nativeGraphicsSceneSetDragEnterEvent(ptr, graphicsSceneDragEnterEventCallback)
        }
    }

    /**
     * The Function is setDragEnterEven
     *
     */
    public func setDragEnterEven() {
        setDragEnterEven(dragEnterEven)
    }

    protected open func dragEnterEven(event: QGraphicsSceneDragDropEvent): Unit {
        unsafe {
            nativeGraphicsSceneDragEnterEvent(this.ptr, event.ptr)
        }
    }

    /**
     * The Function is setDragLeaveEvent
     *
     * @param callback of (QGraphicsSceneDragDropEvent)->Unit
     */
    public func setDragLeaveEvent(callback: (QGraphicsSceneDragDropEvent) -> Unit) {
        QGraphicsSceneCallbackMap.dragLeaveEvent.put(ptr, callback)
        unsafe {
            nativeGraphicsSceneSetDragLeaveEvent(ptr, graphicsSceneDragLeaveEventCallback)
        }
    }

    /**
     * The Function is setDragLeaveEvent
     *
     */
    public func setDragLeaveEvent() {
        setDragLeaveEvent(dragLeaveEvent)
    }

    protected open func dragLeaveEvent(event: QGraphicsSceneDragDropEvent): Unit {
        unsafe {
            nativeGraphicsSceneDragLeaveEvent(this.ptr, event.ptr)
        }
    }

    /**
     * The Function is setDragMoveEvent
     *
     * @param callback of (QGraphicsSceneDragDropEvent)->Unit
     */
    public func setDragMoveEvent(callback: (QGraphicsSceneDragDropEvent) -> Unit) {
        QGraphicsSceneCallbackMap.dragMoveEvent.put(ptr, callback)
        unsafe {
            nativeGraphicsSceneSetDragMoveEvent(ptr, graphicsSceneDragMoveEventCallback)
        }
    }

    /**
     * The Function is setDragMoveEvent
     *
     */
    public func setDragMoveEvent() {
        setDragMoveEvent(dragMoveEvent)
    }
    protected open func dragMoveEvent(event: QGraphicsSceneDragDropEvent): Unit {
        unsafe {
            nativeGraphicsSceneDragMoveEvent(this.ptr, event.ptr)
        }
    }

    /**
     * The Function is setDropEvent
     *
     * @param callback of (QGraphicsSceneDragDropEvent)->Unit
     */
    public func setDropEvent(callback: (QGraphicsSceneDragDropEvent) -> Unit) {
        QGraphicsSceneCallbackMap.dropEvent.put(ptr, callback)
        unsafe {
            nativeGraphicsSceneSetDropEvent(ptr, graphicsSceneDropEventCallback)
        }
    }

    /**
     * The Function is setDropEvent
     *
     */
    public func setDropEvent() {
        setDropEvent(dropEvent)
    }
    protected open func dropEvent(event: QGraphicsSceneDragDropEvent): Unit {
        unsafe {
            nativeGraphicsSceneDropEvent(this.ptr, event.ptr)
        }
    }

    /**
     * The Function is setFocusOutEvent
     *
     * @param callback of (QFocusEvent)->Unit
     */
    public func setFocusOutEvent(callback: (QFocusEvent) -> Unit) {
        QGraphicsSceneCallbackMap.focusOutEvent.put(ptr, callback)
        unsafe {
            nativeGraphicsSceneSetFocusOutEvent(ptr, graphicsSceneFocusOutEventCallback)
        }
    }

    /**
     * The Function is setFocusOutEvent
     *
     */
    public func setFocusOutEvent() {
        setFocusOutEvent(focusOutEvent)
    }
    protected open func focusOutEvent(event: QFocusEvent): Unit {
        unsafe {
            nativeGraphicsSceneFocusOutEvent(this.ptr, event.ptr)
        }
    }

    /**
     * The Function is setHelpEvent
     *
     * @param callback of (QGraphicsSceneHelpEvent)->Unit
     */
    public func setHelpEvent(callback: (QGraphicsSceneHelpEvent) -> Unit) {
        QGraphicsSceneCallbackMap.helpEvent.put(ptr, callback)
        unsafe {
            nativeGraphicsSceneSetHelpEvent(ptr, graphicsSceneHelpEventCallback)
        }
    }

    /**
     * The Function is setHelpEvent
     *
     */
    public func setHelpEvent() {
        setHelpEvent(helpEvent)
    }
    protected open func helpEvent(event: QGraphicsSceneHelpEvent): Unit {
        unsafe {
            nativeGraphicsSceneHelpEvent(this.ptr, event.ptr)
        }
    }

    /**
     * The Function is setInputMethodEvent
     *
     * @param callback of (QInputMethodEvent)->Unit
     */
    public func setInputMethodEvent(callback: (QInputMethodEvent) -> Unit) {
        QGraphicsSceneCallbackMap.inputMethodEvent.put(ptr, callback)
        unsafe {
            nativeGraphicsSceneSetInputMethodEvent(ptr, graphicsSceneInputMethodEventCallback)
        }
    }

    /**
     * The Function is setInputMethodEvent
     *
     */
    public func setInputMethodEvent() {
        setInputMethodEvent(inputMethodEvent)
    }

    protected open func inputMethodEvent(event: QInputMethodEvent): Unit {
        unsafe {
            nativeGraphicsSceneInputMethodEvent(this.ptr, event.ptr)
        }
    }

    /**
     * The Function is setMouseDoubleClickEvent
     *
     * @param callback of (QGraphicsSceneMouseEvent)->Unit
     */
    public func setMouseDoubleClickEvent(callback: (QGraphicsSceneMouseEvent) -> Unit) {
        QGraphicsSceneCallbackMap.mouseDoubleClickEvent.put(ptr, callback)
        unsafe {
            nativeGraphicsSceneSetMouseDoubleClickEvent(ptr, graphicsSceneMouseDoubleClickEventCallback)
        }
    }

    /**
     * The Function is setMouseDoubleClickEvent
     *
     */
    public func setMouseDoubleClickEvent() {
        setMouseDoubleClickEvent(mouseDoubleClickEvent)
    }
    protected open func mouseDoubleClickEvent(event: QGraphicsSceneMouseEvent): Unit {
        unsafe {
            nativeGraphicsSceneMouseDoubleClickEvent(this.ptr, event.ptr)
        }
    }

    /**
     * The Function is setMouseMoveEvent
     *
     * @param callback of (QGraphicsSceneMouseEvent)->Unit
     */
    public func setMouseMoveEvent(callback: (QGraphicsSceneMouseEvent) -> Unit) {
        QGraphicsSceneCallbackMap.mouseMoveEvent.put(ptr, callback)
        unsafe {
            nativeGraphicsSceneSetMouseMoveEvent(ptr, graphicsSceneMouseMoveEventCallback)
        }
    }

    /**
     * The Function is setMouseMoveEvent
     *
     */
    public func setMouseMoveEvent() {
        setMouseMoveEvent(mouseMoveEvent)
    }
    protected open func mouseMoveEvent(event: QGraphicsSceneMouseEvent): Unit {
        unsafe {
            nativeGraphicsSceneMouseMoveEvent(this.ptr, event.ptr)
        }
    }

    /**
     * The Function is setMousePressEvent
     *
     * @param callback of (QGraphicsSceneMouseEvent)->Unit
     */
    public func setMousePressEvent(callback: (QGraphicsSceneMouseEvent) -> Unit) {
        QGraphicsSceneCallbackMap.mousePressEvent.put(ptr, callback)
        unsafe {
            nativeGraphicsSceneSetMousePressEvent(ptr, graphicsSceneMousePressEventCallback)
        }
    }

    /**
     * The Function is setMousePressEvent
     *
     */
    public func setMousePressEvent() {
        setMousePressEvent(mousePressEvent)
    }
    protected open func mousePressEvent(event: QGraphicsSceneMouseEvent): Unit {
        unsafe {
            nativeGraphicsSceneMousePressEvent(this.ptr, event.ptr)
        }
    }

    /**
     * The Function is setMouseReleaseEvent
     *
     * @param callback of (QGraphicsSceneMouseEvent)->Unit
     */
    public func setMouseReleaseEvent(callback: (QGraphicsSceneMouseEvent) -> Unit) {
        QGraphicsSceneCallbackMap.mouseReleaseEvent.put(ptr, callback)
        unsafe {
            nativeGraphicsSceneSetMouseReleaseEvent(ptr, graphicsSceneMouseReleaseEventCallback)
        }
    }

    /**
     * The Function is setMouseReleaseEvent
     *
     */
    public func setMouseReleaseEvent() {
        setMouseReleaseEvent(mouseReleaseEvent)
    }
    protected open func mouseReleaseEvent(event: QGraphicsSceneMouseEvent): Unit {
        unsafe {
            nativeGraphicsSceneMouseReleaseEvent(this.ptr, event.ptr)
        }
    }

    /**
     * The Function is setKeyPressEvent
     *
     * @param callback of (QKeyEvent)->Unit
     */
    public func setKeyPressEvent(callback: (QKeyEvent) -> Unit) {
        QGraphicsSceneCallbackMap.keyPressEvent.put(ptr, callback)
        unsafe {
            nativeGraphicsSceneSetKeyPressEvent(ptr, graphicsSceneKeyPressEventCallback)
        }
    }

    /**
     * The Function is setKeyPressEvent
     *
     */
    public func setKeyPressEvent() {
        setKeyPressEvent(keyPressEvent)
    }
    protected open func keyPressEvent(event: QKeyEvent): Unit {
        unsafe {
            nativeGraphicsSceneKeyPressEvent(this.ptr, event.ptr)
        }
    }

    /**
     * The Function is setKeyReleaseEvent
     *
     * @param callback of (QKeyEvent)->Unit
     */
    public func setKeyReleaseEvent(callback: (QKeyEvent) -> Unit) {
        QGraphicsSceneCallbackMap.keyReleaseEvent.put(ptr, callback)
        unsafe {
            nativeGraphicsSceneSetKeyReleaseEvent(ptr, graphicsSceneKeyReleaseEventCallback)
        }
    }

    /**
     * The Function is setKeyReleaseEvent
     *
     */
    public func setKeyReleaseEvent() {
        setKeyReleaseEvent(keyReleaseEvent)
    }
    protected open func keyReleaseEvent(event: QKeyEvent): Unit {
        unsafe {
            nativeGraphicsSceneKeyReleaseEvent(this.ptr, event.ptr)
        }
    }

    /**
     * The Function is setWheelEvent
     *
     * @param callback of (QGraphicsSceneWheelEvent)->Unit
     */
    public func setWheelEvent(callback: (QGraphicsSceneWheelEvent) -> Unit) {
        QGraphicsSceneCallbackMap.wheelEvent.put(ptr, callback)
        unsafe {
            nativeGraphicsSceneSetWheelEvent(ptr, graphicsSceneWheelEventCallback)
        }
    }

    /**
     * The Function is setWheelEvent
     *
     */
    public func setWheelEvent() {
        setWheelEvent(wheelEvent)
    }

    protected open func wheelEvent(event: QGraphicsSceneWheelEvent): Unit {
        unsafe {
            nativeGraphicsSceneWheelEvent(this.ptr, event.ptr)
        }
    }
}
