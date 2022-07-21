package qt.widgets

foreign func nativeToolBarCreate(parentPtr: Int64): Int64
foreign func nativeToolBarDelete(ptr: Int64): Unit
foreign func nativeToolBarAddActionStr(ptr: Int64, action:CString): Int64
foreign func nativeToolBarAddActionStrIcon(ptr: Int64, iconPtr: Int64, action:CString): Int64
foreign func nativeToolBarAddAction(ptr: Int64, actionPtr: Int64): Unit

public class QToolBar <: QWidget {
    public init(parent!: QWidget = QWidget(0)) {
        super(unsafe {
            nativeToolBarCreate(parent.ptr)
        })
    }

    public override func delete() {
        unsafe {
            nativeToolBarDelete(ptr)
        }
    }

    public func addAction(menu:String): QAction {
        let actionPrt = unsafe {
            nativeToolBarAddActionStr(ptr, CString(menu))
        }
        return QAction(actionPrt)
    }

    public func addAction(icon: QIcon, menu:String): QAction {
        let actionPrt = unsafe {
            nativeToolBarAddActionStrIcon(ptr, icon.ptr, CString(menu))
        }
        return QAction(actionPrt)
    }

    public func addAction(action:QAction) {
        unsafe {
            nativeToolBarAddAction(ptr, action.ptr)
        }
    }
}