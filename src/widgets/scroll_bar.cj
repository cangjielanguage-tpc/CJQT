package cjqt.widgets

import cjqt.gui.*
import cjqt.core.*

//C
foreign func nativeScrollBarCreate(parentPtr: Int64): Int64
foreign func nativeScrollBarCreateWithOrietation(orientation: Int16, parentPtr: Int64): Int64
foreign func nativeScrollBarDelete(ptr: Int64): Unit
foreign func nativeScrollBarEvent(ptr: Int64, eventPtr: Int64): Bool
foreign func nativeScrollBarSizeHint(ptr: Int64): QSize

// do event
foreign func nativeScrollBarPaintEvent(ptr: Int64, eventPtr: Int64): Unit
foreign func nativeScrollBarHideEvent(ptr: Int64, eventPtr: Int64): Unit
foreign func nativeScrollBarMouseMoveEvent(ptr: Int64, eventPtr: Int64): Unit
foreign func nativeScrollBarMousePressEvent(ptr: Int64, eventPtr: Int64): Unit
foreign func nativeScrollBarMouseReleaseEvent(ptr: Int64, eventPtr: Int64): Unit
foreign func nativeScrollBarWheelEvent(ptr: Int64, eventPtr: Int64): Unit
foreign func nativeScrollBarContextMenuEvent(ptr: Int64, eventPtr: Int64): Unit

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

    public open override func delete() {
        unsafe {
            nativeScrollBarDelete(this.ptr)
        }
    }
    public func event(event: QEvent): Bool {
        return unsafe {
            nativeScrollBarEvent(this.ptr, event.ptr)
        }
    }
    public open func sizeHint(): QSize {
        let size = unsafe {
            nativeScrollBarSizeHint(this.ptr)
        }
        return size
    }

    /**
     * The Function is setMousePressEvent
     *
     * @param callback of (QMouseEvent)->Unit
     */
    public func setMousePressEvent() {
        super.setMousePressEvent(mousePressEvent)
    }

    //protected event function
    protected open func contextMenuEvent(event: QContextMenuEvent): Unit {
        unsafe {
            nativeScrollBarContextMenuEvent(this.ptr, event.ptr)
        }
    }
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
