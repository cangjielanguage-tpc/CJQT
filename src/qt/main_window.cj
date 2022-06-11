package qt

foreign func nativeMainWindowCreate(): Int64
foreign func nativeMainWindowResize(ptr: Int64, w: Int32, h: Int32): Unit
foreign func nativeMainWindowShow(ptr: Int64): Unit
foreign func nativeMainWindowHide(ptr: Int64): Unit
foreign func nativeMainWindowShowMinimized(ptr: Int64): Unit
foreign func nativeMainWindowShowMaximized(ptr: Int64): Unit
foreign func nativeMainWindowShowFullScreen(ptr: Int64): Unit
foreign func nativeMainWindowShowNormal(ptr: Int64): Unit
foreign func nativeMainWindowClose(ptr: Int64): Unit
foreign func nativeMainWindowDelete(ptr: Int64): Unit

public class QMainWindow {
    let ptr: Int64
    public init() {
        ptr = unsafe {
            nativeMainWindowCreate()
        }
        hide()
    }

    public func resize(w: Int32, h: Int32) {
        unsafe {
            nativeMainWindowResize(ptr, w, h)
        }
    }

    public func show() {
        unsafe {
            nativeMainWindowShow(ptr)
        }
    }

    public func hide() {
        unsafe {
            nativeMainWindowHide(ptr)
        }
    }

    public func showMinimized() {
        unsafe {
            nativeMainWindowShowMinimized(ptr)
        }
    }

    public func showMaximized() {
        unsafe {
            nativeMainWindowShowMaximized(ptr)
        }
    }

    public func showFullScreen() {
        unsafe {
            nativeMainWindowShowFullScreen(ptr)
        }
    }

    public func showNormal() {
        unsafe {
            nativeMainWindowShowNormal(ptr)
        }
    }

    public func close() {
        unsafe {
            nativeMainWindowClose(ptr)
        }
    }

    public func delete() {
        unsafe {
            nativeMainWindowDelete(ptr)
        }
    }
}
