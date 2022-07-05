package qt.widgets

from std import ffi.c.CString

foreign func nativeMenuBarCreate(parentPtr: Int64): Int64
foreign func nativeMenuBarAddActionStr(ptr: Int64, action:CString): Unit
foreign func nativeMenuBarAddAction(ptr: Int64, actionPtr: Int64): Unit
foreign func nativeMenuBarAddMenuStr(ptr: Int64, menu:CString): Int64
foreign func nativeMenuBarAddMenu(ptr: Int64, menuPtr: Int64): Int64
foreign func nativeMenuBarDelete(ptr: Int64): Unit

public class QMenuBar <: QWidget {
    public init() {
        super(unsafe {
            nativeMenuBarCreate(0)
        })
    }

    public init(parent: QWidget) {
        super(unsafe {
            nativeMenuBarCreate(parent.ptr)
        })
    }

    public init(menuBarPrt: Int64) {
        super(menuBarPrt)
    }

    public func addAction(action:String) {
        unsafe {
            nativeMenuBarAddActionStr(ptr, CString(action))
        }
    }

    public func addAction(action:QAction) {
        unsafe {
            nativeMenuBarAddAction(ptr, action.ptr)
        }
    }

    public func addMenu(menu:String): QMenu {
        let menuPrt = unsafe {
            nativeMenuBarAddMenuStr(ptr, CString(menu))
        }
        return QMenu(menuPrt)
    }

    public func addMenu(menu:QMenu): QAction {
        let actionPrt = unsafe {
            nativeMenuBarAddMenu(ptr, menu.ptr)
        }
        return QAction(actionPrt)
    }

    public override func delete() {
        unsafe {
            nativeMenuBarDelete(ptr)
        }
    }
}