package qt.widgets

from std import ffi.c.CString
import qt.gui.*

foreign func nativeWidgetCreate(appPtr: Int64, parentPtr: Int64): Int64
foreign func nativeWidgetResize(ptr: Int64, w: Int32, h: Int32): Unit
foreign func nativeWidgetShow(ptr: Int64): Unit
foreign func nativeWidgetHide(ptr: Int64): Unit
foreign func nativeWidgetShowMinimized(ptr: Int64): Unit
foreign func nativeWidgetShowMaximized(ptr: Int64): Unit
foreign func nativeWidgetShowFullScreen(ptr: Int64): Unit
foreign func nativeWidgetShowNormal(ptr: Int64): Unit
foreign func nativeWidgetClose(ptr: Int64): Unit
foreign func nativeWidgetMove(ptr: Int64, ax: Int32, ay: Int32): Unit
foreign func nativeWidgetSetWindowTitle(ptr: Int64, title: CString): Unit
foreign func nativeWidgetDelete(ptr: Int64): Unit

foreign func nativeWidgetSetPaintEvent(ptr: Int64, callback: CFunc<(Int64) -> Unit>): Unit
foreign func nativeWidgetSetMousePressEvent(ptr: Int64, callback: CFunc<(Int64) -> Unit>): Unit
foreign func nativeWidgetSetMouseReleaseEvent(ptr: Int64, callback: CFunc<(Int64) -> Unit>): Unit
foreign func nativeWidgetSetMouseMoveEvent(ptr: Int64, callback: CFunc<(Int64) -> Unit>): Unit
foreign func nativeWidgetSetKeyPressEvent(ptr: Int64, callback: CFunc<(Int64) -> Unit>): Unit

public open class QWidget {
    public let ptr: Int64

    static var keyEventCallback: (QKeyEvent) -> Unit = {event => }
    static var paintersEventCallback: (QPaintersEvent) -> Unit = {event => }

    public init() {
        ptr = unsafe {
            nativeWidgetCreate(QApplication.ptr, 0)
        }
    }

    public init(parent: QWidget) {
        ptr = unsafe {
            nativeWidgetCreate(QApplication.ptr, parent.ptr)
        }
    }

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public func resize(w: Int32, h: Int32) {
        unsafe {
            nativeWidgetResize(ptr, w, h)
        }
    }

    public func show() {
        unsafe {
            nativeWidgetShow(ptr)
        }
    }

    public func hide() {
        unsafe {
            nativeWidgetHide(ptr)
        }
    }

    public func showMinimized() {
        unsafe {
            nativeWidgetShowMinimized(ptr)
        }
    }

    public func showMaximized() {
        unsafe {
            nativeWidgetShowMaximized(ptr)
        }
    }

    public func showFullScreen() {
        unsafe {
            nativeWidgetShowFullScreen(ptr)
        }
    }

    public func showNormal() {
        unsafe {
            nativeWidgetShowNormal(ptr)
        }
    }

    public func close() {
        unsafe {
            nativeWidgetClose(ptr)
        }
    }

    public func move(ax: Int32, ay: Int32) {
        unsafe {
            nativeWidgetMove(ptr, ax, ay)
        }
    }

    public func setWindowTitle(title: String) {
        unsafe {
            nativeWidgetSetWindowTitle(ptr, CString(title))
        }
    }

    public open func delete() {
        unsafe {
            nativeWidgetDelete(ptr)
        }
    }

    public func setPaintEvent(callback: (QPaintersEvent) -> Unit) {
        QWidget.paintersEventCallback = callback
        let cb: CFunc<(Int64) -> Unit> = {
            eventPtr => let event = QPaintersEvent(eventPtr)
            QWidget.paintersEventCallback(event)
        }
        unsafe {
            nativeWidgetSetPaintEvent(ptr, cb)
        }
    }

    public func setMousePressEvent(callback: (QMouseEvent) -> Unit) {
        let cb: CFunc<(Int64) -> Unit> = {
            eventPtr => let event = QPaintersEvent(eventPtr)
        }
        unsafe {
            nativeWidgetSetMousePressEvent(ptr, cb)
        }
    }

    public func setMouseReleaseEvent(callback: (QMouseEvent) -> Unit) {
        let cb: CFunc<(Int64) -> Unit> = {
            eventPtr => let event = QPaintersEvent(eventPtr)
        }
        unsafe {
            nativeWidgetSetMouseReleaseEvent(ptr, cb)
        }
    }

    public func setMouseMoveEvent(callback: (QMouseEvent) -> Unit) {
        let cb: CFunc<(Int64) -> Unit> = {
            eventPtr => let event = QPaintersEvent(eventPtr)
        }
        unsafe {
            nativeWidgetSetMouseMoveEvent(ptr, cb)
        }
    }

    public func setKeyPressEvent(callback: (QKeyEvent) -> Unit) {
        QWidget.keyEventCallback = callback
        let cb: CFunc<(Int64) -> Unit> = {
            eventPtr =>
            let event = QKeyEvent(eventPtr)
            QWidget.keyEventCallback(event)
        }
        unsafe {
            nativeWidgetSetKeyPressEvent(ptr, cb)
        }
    }
}
