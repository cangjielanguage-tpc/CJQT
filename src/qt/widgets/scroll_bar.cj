package qt.widgets

//C
foreign func nativeScrollBarCreate(parentPtr: Int64): Int64
foreign func nativeScrollBarCreateWithOrietation(orientation: Int32, parentPtr: Int64): Int64
foreign func nativeScrollBarDelete(ptr: Int64): Unit

// set event
foreign func nativeScrollBarSetPaintEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit
foreign func nativeScrollBarSetHideEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit
foreign func nativeScrollBarSetMouseMoveEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit
foreign func nativeScrollBarSetMousePressEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit
foreign func nativeScrollBarSetMouseReleaseEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit
foreign func nativeScrollBarSetWheelEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit

// do event
foreign func nativeScrollBarPaintEvent(ptr: Int64, eventPtr: Int64): Unit
foreign func nativeScrollBarHideEvent(ptr: Int64, eventPtr: Int64): Unit
foreign func nativeScrollBarMouseMoveEvent(ptr: Int64, eventPtr: Int64): Unit
foreign func nativeScrollBarMousePressEvent(ptr: Int64, eventPtr: Int64): Unit
foreign func nativeScrollBarMouseReleaseEvent(ptr: Int64, eventPtr: Int64): Unit
foreign func nativeScrollBarWheelEvent(ptr: Int64, eventPtr: Int64): Unit

public open class QScrollBar <: QAbstractSlider {
    public init() {
        super(unsafe { nativeScrollBarCreate(0) })
    }
    public init(ptr: Int64) {
        super(ptr)
    }
    public init(parent: QWidget) {
        super(unsafe { nativeScrollBarCreate(parent.ptr) })
    }
    public init(orientation: Orientation) {
        super(unsafe { nativeScrollBarCreateWithOrietation(orientation.value(), 0) })
    }
    public init(orientation: Orientation, parent: QWidget) {
        super(unsafe { nativeScrollBarCreateWithOrietation(orientation.value(), parent.ptr) })
    }
        /**
     * The Function is setMouseReleaseEvent
     *
     * @param callback of (QMouseEvent)->Unit
     */
    public func setMousePressEvent() {
        super.setMousePressEvent(mousePressEvent)
    }
    //protected event function
    protected open func contextMenuEvent(): Unit {}
    protected open func hideEvent(event: QHideEvent): Unit {
        unsafe {
            nativeScrollBarHideEvent(this.ptr, event.ptr)
        }
    }
    protected open func mouseMoveEvent(event: QMouseEvent): Unit {
        unsafe {
            nativeScrollBarMouseMoveEvent(this.ptr, event.ptr)
        }
    }
    protected open func mousePressEvent(event: QMouseEvent): Unit {
        println("entry QScrollBar mousePressEvent")
        unsafe {
            nativeScrollBarMousePressEvent(this.ptr, event.ptr)
        }
    }
    protected open func mouseReleaseEvent(event: QMouseEvent): Unit {
        unsafe {
            nativeScrollBarMouseReleaseEvent(this.ptr, event.ptr)
        }
    }
    protected open func paintEvent(event: QPaintersEvent): Unit {
        unsafe {
            nativeScrollBarPaintEvent(this.ptr, event.ptr)
        }
    }
    protected open func wheelEvent(event: QWheelEvent): Unit {
        unsafe {
            nativeScrollBarWheelEvent(this.ptr, event.ptr)
        }
    }
}
