package qt.widgets

//C
foreign func nativeScrollBarCreate(parentPtr: Int64): Int64
foreign func nativeScrollBarCreateWithOrietation(orientation: Int32, parentPtr: Int64): Int64
foreign func nativeScrollBarDelete(ptr: Int64): Unit
foreign func nativeScrollBarSetEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Bool>): Unit
foreign func nativeScrollBardoMousePressEvent(ptr: Int64, eventPtr: Int64): Unit

@c
func eventCallback(receivePtr: Int64, eventPtr: Int64): Bool {
    let event = QEvent(eventPtr)
    let scrollBar = QScrollBar(receivePtr)
    println("entry scrollBar event")
    try {
        scrollBar.event(event)
    } catch (e: Exception) {
        println(e)
        return false
    }
}

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
    public func setEvent(): Unit {
        unsafe { nativeScrollBarSetEvent(this.ptr, eventCallback) }
    }
    protected open override func event(event: QEvent): Bool {
        match (event.eventType()) {
            case QEventType.MouseButtonPress =>
                println("entry scrollBar 1")
                if (event is QMouseEvent) {
                    println("entry scrollBar 2")
                    var mouseEvent = event as QMouseEvent
                    match (mouseEvent) {
                        case None => return false
                        case _ =>
                            mousePressEvent(mouseEvent.getOrThrow())
                            return true
                    }
                }
                return false
            case _ => return false
        }
    }
    protected open func contextMenuEvent(): Unit {}
    protected open func hideEvent(): Unit {}
    protected open func mouseMoveEvent(event: QMouseEvent): Unit {}
    protected open func mousePressEvent(event: QMouseEvent): Unit {
        println("entry scrollBar mouseMoveEvent")
        return unsafe {
            nativeScrollBardoMousePressEvent(this.ptr, event.ptr)
        }
    }
    protected open func mouseReleaseEvent(): Unit {}
    protected open func paintEvent(): Unit {}
    protected open func wheelEvent(): Unit {}
}
