package qt.widgets

from std import ffi.c.CString

foreign func nativeMainWindowCreate(appPtr: Int64, parentPtr: Int64): Int64
foreign func nativeMainWindowDelete(ptr: Int64): Unit

public class QMainWindow <: QWidget{
    public init() {
        super(unsafe {
            nativeMainWindowCreate(QApplication.ptr, 0)
        })
    }

    public init(parent: QWidget) {
        super(unsafe {
            nativeWidgetCreate(QApplication.ptr, parent.ptr)
        })
    }

    public override func delete() {
        unsafe {
            nativeMainWindowDelete(ptr)
        }
    }
}
