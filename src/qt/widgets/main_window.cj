package qt.widgets

from std import ffi.c.CString

foreign func nativeMainWindowCreate(appPtr: Int64, parentPtr: Int64): Int64
foreign func nativeMainWindowSetCentralWidget(ptr: Int64, widgetPtr: Int64): Unit
foreign func nativeMainWindowDelete(ptr: Int64): Unit

public open class QMainWindow <: QWidget {
    public init() {
        super(
            unsafe {
                nativeMainWindowCreate(QApplication.ptr, 0)
            }
        )
    }

    public init(parent: QWidget) {
        super(
            unsafe {
                nativeMainWindowCreate(QApplication.ptr, parent.ptr)
            }
        )
    }

    public func setCentralWidget(widget: QWidget) {
        unsafe {
            nativeMainWindowSetCentralWidget(ptr, widget.ptr)
        }
    }

    public override func delete() {
        unsafe {
            nativeMainWindowDelete(ptr)
        }
    }
}
