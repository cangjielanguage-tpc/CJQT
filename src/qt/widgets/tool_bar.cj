package qt.widgets

foreign func nativeToolBarCreate(parentPtr: Int64): Int64
foreign func nativeToolBarDelete(ptr: Int64): Unit
foreign func nativeToolBarAddActionStr(ptr: Int64, action: CString): Int64
foreign func nativeToolBarAddActionStrIcon(ptr: Int64, iconPtr: Int64, action: CString): Int64
foreign func nativeToolBarAddAction(ptr: Int64, actionPtr: Int64): Unit
foreign func nativeToolBarAddSeparator(ptr: Int64): Int64
foreign func nativeToolBarInsertSeparator(ptr: Int64, actionPtr: Int64): Int64
foreign func nativeToolBarAddWidget(ptr: Int64, widgetPtr: Int64): Int64
foreign func nativeToolBarInsertWidget(ptr: Int64, actionPtr: Int64, widgetPtr: Int64): Int64

public class QToolBar <: QWidget {
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeToolBarCreate(parent.ptr)
            }
        )
    }

    public override func delete() {
        unsafe {
            nativeToolBarDelete(ptr)
        }
    }

    public func addAction(menu: String): QAction {
        let actionPrt = unsafe {
            nativeToolBarAddActionStr(ptr, CString(menu))
        }
        return QAction(actionPrt)
    }

    public func addAction(icon: QIcon, menu: String): QAction {
        let actionPrt = unsafe {
            nativeToolBarAddActionStrIcon(ptr, icon.ptr, CString(menu))
        }
        return QAction(actionPrt)
    }

    public func addAction(action: QAction) {
        unsafe {
            nativeToolBarAddAction(ptr, action.ptr)
        }
    }

    public func addSeparator(): QAction {
        let actionPrt = unsafe {
            nativeToolBarAddSeparator(ptr)
        }
        return QAction(actionPrt)
    }

    public func insertSeparator(before: QAction): QAction {
        let actionPrt = unsafe {
            nativeToolBarInsertSeparator(ptr, before.ptr)
        }
        return QAction(actionPrt)
    }

    public func addSeparator(widget: QWidget): QAction {
        let actionPrt = unsafe {
            nativeToolBarAddWidget(ptr, widget.ptr)
        }
        return QAction(actionPrt)
    }

    public func insertWidget(before: QAction, widget: QWidget): QAction {
        let actionPrt = unsafe {
            nativeToolBarInsertWidget(ptr, before.ptr, widget.ptr)
        }
        return QAction(actionPrt)
    }
}
