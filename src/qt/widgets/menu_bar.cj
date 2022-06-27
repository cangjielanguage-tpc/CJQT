package qt.widgets

from std import ffi.c.CString

foreign func nativeMenuBarCreate(appPtr: Int64, parentPtr: Int64): Int64
foreign func nativeMenuBarAddAction(ptr: Int64, action:CString): Unit
foreign func nativeMenuBarAddActionPtr(ptr: Int64, actionPtr: Int64): Unit
foreign func nativeMenuBarDelete(ptr: Int64): Unit

public class QMenuBar <: QWidget {
    public init() {
        super(unsafe {
            nativeMenuBarCreate(QApplication.ptr, 0)
        })
    }

    public init(parent: QWidget) {
        super(unsafe {
            nativeMenuBarCreate(QApplication.ptr, parent.ptr)
        })
    }

    public func addAction(action:String) {
        unsafe {
            nativeMenuBarAddAction(ptr, CString(action))
        }
    }

    public func addAction(action:QAction) {
        unsafe {
            nativeMenuBarAddActionPtr(ptr, action.ptr)
        }
    }

    public override func delete() {
        unsafe {
            nativeMenuBarDelete(ptr)
        }
    }
}