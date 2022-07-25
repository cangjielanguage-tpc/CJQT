package qt.widgets

from std import ffi.c.CString

foreign func nativeMenuCreate(parentPtr: Int64): Int64
foreign func nativeMenuSetTitle(ptr: Int64, title:CString): Unit
foreign func nativeMenuMenuAction(ptr: Int64): Int64
foreign func nativeMenuAddSeparator(ptr: Int64): Unit
foreign func nativeMenuAddAction(ptr: Int64, action:CString): Int64
foreign func nativeMenuAddActionStrIcon(ptr: Int64, iconPtr: Int64, action: CString): Int64
foreign func nativeMenuAddActionPtr(ptr: Int64, actionPtr: Int64): Unit
foreign func nativeMenuDelete(ptr: Int64): Unit

public class QMenu <: QWidget {
    public init() {
        super(unsafe {
            nativeMenuCreate(0)
        })
    }

    public init(menuPrt: Int64) {
        super(menuPrt)
    }

    public init(parent: QWidget) {
        super(unsafe {
            nativeMenuCreate(parent.ptr)
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

    public func addAction(action:String): QAction {
        let actionPtr = unsafe {
            nativeMenuAddAction(ptr, CString(action))
        }
        return QAction(actionPtr)
    }

    public func addAction(icon: QIcon, action: String): QAction {
        let actionPrt = unsafe {
            nativeMenuAddActionStrIcon(ptr, icon.ptr, CString(action))
        }
        return QAction(actionPrt)
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