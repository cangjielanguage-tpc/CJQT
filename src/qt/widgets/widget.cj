package qt.widgets

from std import ffi.c.CString
import qt.gui.*
from std import collection.*

foreign func nativeWidgetCreate(appPtr: Int64, parentPtr: Int64): Int64
foreign func nativeWidgetResize(ptr: Int64, w: Int32, h: Int32): Unit
foreign func nativeWidgetSetFixedSize(ptr: Int64, w: Int32, h: Int32): Unit
foreign func nativeWidgetShow(ptr: Int64): Unit
foreign func nativeWidgetHide(ptr: Int64): Unit
foreign func nativeWidgetShowMinimized(ptr: Int64): Unit
foreign func nativeWidgetShowMaximized(ptr: Int64): Unit
foreign func nativeWidgetShowFullScreen(ptr: Int64): Unit
foreign func nativeWidgetShowNormal(ptr: Int64): Unit
foreign func nativeWidgetClose(ptr: Int64): Unit
foreign func nativeWidgetMove(ptr: Int64, ax: Int32, ay: Int32): Unit
foreign func nativeWidgetSetWindowTitle(ptr: Int64, title: CString): Unit
foreign func nativeWidgetRepaint(ptr: Int64): Unit
foreign func nativeWidgetSetLayout(ptr: Int64, layoutPtr: Int64): Unit
foreign func nativeWidgetSetPalette(ptr: Int64, palettePtr: Int64): Unit
foreign func nativeWidgetSetAutoFillBackground(ptr: Int64, enabled: Int32): Unit
foreign func nativeWidgetSetGeometry(ptr: Int64, ax:Int32, ay:Int32, aw:Int32, ah:Int32): Unit
foreign func nativeWidgetSetFont(ptr: Int64, fontPtr: Int64): Unit
foreign func nativeWidgetDelete(ptr: Int64): Unit

foreign func nativeWidgetSetPaintEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit
foreign func nativeWidgetSetMousePressEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit
foreign func nativeWidgetSetMouseReleaseEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit
foreign func nativeWidgetSetMouseMoveEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit
foreign func nativeWidgetSetKeyPressEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit

public open class QWidget {
    public let ptr: Int64

    //public var keyEventCallback: (QKeyEvent) -> Unit = {event => }
    static let keyEventCallback = HashMap<Int64, (QKeyEvent) -> Unit>()

    //static var paintersEventCallback: (QPaintersEvent) -> Unit = {event => }
    static var paintersEventCallback = HashMap<Int64, (QPaintersEvent) -> Unit>()

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

    public func setFixedSize(w: Int64, h: Int64) {
        unsafe {
            nativeWidgetSetFixedSize(ptr, Int32(w), Int32(h))
        }
    }

    public func resize(w: Int64, h: Int64) {
        unsafe {
            nativeWidgetResize(ptr, Int32(w), Int32(h))
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

    public open func setLayout(layout: QGridLayout) {
        unsafe {
            nativeWidgetSetLayout(ptr, layout.ptr)
        }
    }

    public func setPalette(palette: QPalette) {
        unsafe {
            nativeWidgetSetPalette(ptr, palette.ptr)
        }
    }

    public func setAutoFillBackground(enabled: Bool) {
        unsafe {
            nativeWidgetSetAutoFillBackground(ptr, if (enabled) {
                    1
                } else {
                    0
                })
        }
    }

    public func setGeometry(ax:Int32, ay:Int32, aw:Int32, ah:Int32) {
        unsafe {
            nativeWidgetSetGeometry(ptr, ax, ay, aw, ah)
        }
    }

    public func setFont(font:QFont) {
        unsafe {
            nativeWidgetSetFont(ptr, font.ptr)
        }
    }

    public open func repaint() {
        unsafe {
            nativeWidgetRepaint(ptr)
        }
    }

    public open func delete() {
        unsafe {
            nativeWidgetDelete(ptr)
        }
    }

    public func setPaintEvent(callback: (QPaintersEvent) -> Unit) {
        QWidget.paintersEventCallback.put(ptr, callback)
        let cb: CFunc<(Int64, Int64) -> Unit> = {
            ptr, eventPtr =>
            let event = QPaintersEvent(eventPtr)
            try {
                QWidget.paintersEventCallback[ptr](event)
            } catch (e: Exception) {
                println(e)
            }
        }
        unsafe {
            nativeWidgetSetPaintEvent(ptr, cb)
        }
    }

    public func setMousePressEvent(callback: (QMouseEvent) -> Unit) {
        let cb: CFunc<(Int64, Int64) -> Unit> = {
            ptr, eventPtr => let event = QPaintersEvent(eventPtr)
        }
        unsafe {
            nativeWidgetSetMousePressEvent(ptr, cb)
        }
    }

    public func setMouseReleaseEvent(callback: (QMouseEvent) -> Unit) {
        let cb: CFunc<(Int64, Int64) -> Unit> = {
            ptr, eventPtr => let event = QPaintersEvent(eventPtr)
        }
        unsafe {
            nativeWidgetSetMouseReleaseEvent(ptr, cb)
        }
    }

    public func setMouseMoveEvent(callback: (QMouseEvent) -> Unit) {
        let cb: CFunc<(Int64, Int64) -> Unit> = {
            ptr, eventPtr => let event = QPaintersEvent(eventPtr)
        }
        unsafe {
            nativeWidgetSetMouseMoveEvent(ptr, cb)
        }
    }

    public func setKeyPressEvent(callback: (QKeyEvent) -> Unit) {
        QWidget.keyEventCallback.put(ptr, callback)
        let cb: CFunc<(Int64, Int64) -> Unit> = {
            ptr, eventPtr =>
            let event = QKeyEvent(eventPtr)
            try {
                QWidget.keyEventCallback[ptr](event)
            } catch (e: Exception) {
                println(e)
            }
        }
        unsafe {
            nativeWidgetSetKeyPressEvent(ptr, cb)
        }
    }
}
