package qt

from std import ffi.c.CString

foreign func nativeWidgetCreate(): Int64
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

public open class QWidget {
let ptr: Int64

    public init() {
        ptr = unsafe {
            nativeWidgetCreate()
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
}