package qt.widgets

// from std import ffi.c.CString

foreign func nativeMainWindowCreate(parentPtr: Int64): Int64
foreign func nativeMainWindowSetCentralWidget(ptr: Int64, widgetPtr: Int64): Unit
foreign func nativeMainWindowSetMenuBar(ptr: Int64, menuBarPtr: Int64): Unit
foreign func nativeMainWindowMenuBar(ptr: Int64): Int64
foreign func nativeMainWindowAddToolBar(ptr: Int64, toolBarPtr: Int64): Unit
foreign func nativeMainWindowDelete(ptr: Int64): Unit

public open class QMainWindow <: QWidget {
    public init() {
        super(
            unsafe {
                nativeMainWindowCreate(0)
            }
        )
    }

    public init(parent: QWidget) {
        super(
            unsafe {
                nativeMainWindowCreate(parent.ptr)
            }
        )
    }

    public func setCentralWidget(widget: QWidget) {
        unsafe {
            nativeMainWindowSetCentralWidget(ptr, widget.ptr)
        }
    }

    public func setMenuBar(menuBar: QMenuBar) {
        unsafe {
            nativeMainWindowSetMenuBar(ptr, menuBar.ptr)
        }
    }

    public func menuBar(): QMenuBar {
        let menuBarPrt = unsafe {
            nativeMainWindowMenuBar(ptr)
        }
        return QMenuBar(menuBarPrt)
    }

    public func addToolBar(toolBar: QToolBar) {
        unsafe {
            nativeMainWindowAddToolBar(ptr, toolBar.ptr)
        }
    }

    public override func delete() {
        unsafe {
            nativeMainWindowDelete(ptr)
        }
    }
}
