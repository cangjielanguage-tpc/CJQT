package qt.widgets

from std import ffi.c.CString

foreign func nativeMenuCreate(appPtr: Int64, parentPtr: Int64): Int64
foreign func nativeMenuSetTitle(ptr: Int64, title:CString): Unit
foreign func nativeMenuMenuAction(ptr: Int64): Int64
foreign func nativeMenuAddSeparator(ptr: Int64): Unit
foreign func nativeMenuAddAction(ptr: Int64, action:CString): Unit
foreign func nativeMenuAddActionPtr(ptr: Int64, actionPtr: Int64): Unit
foreign func nativeMenuDelete(ptr: Int64): Unit

public class QMenu <: QWidget {
    public init() {
        super(unsafe {
            nativeMenuCreate(QApplication.ptr, 0)
        })
    }

    public init(menuPrt: Int64) {
        super(menuPrt)
    }

    public init(parent: QWidget) {
        super(unsafe {
            nativeMenuCreate(QApplication.ptr, parent.ptr)
        })
    }

    public func setTitle(title:String) {
        unsafe {
            nativeMenuSetTitle(ptr, CString(title))
        }
    }

    public func menuAction(): QAction {
        let actionPtr = unsafe {
            nativeMenuMenuAction(ptr)
        }
        return QAction(actionPtr)
    }

    public func addSeparator() {
        unsafe {
            nativeMenuAddSeparator(ptr)
        }
    }

    public func addAction(action:String) {
        unsafe {
            nativeMenuAddAction(ptr, CString(action))
        }
    }

    public func addAction(action:QAction) {
        unsafe {
            nativeMenuAddActionPtr(ptr, action.ptr)
        }
    }

    public override func delete() {
        unsafe {
            nativeMenuDelete(ptr)
        }
    }
}