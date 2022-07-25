package qt.widgets

foreign func nativeActionCreate(parentPtr: Int64): Int64
foreign func nativeActionSetStatusTip(ptr: Int64, tip: CString): Unit
foreign func nativeActionSetText(ptr: Int64, text: CString): Unit
foreign func nativeActionText(ptr: Int64): CString
foreign func nativeActionSetIcon(ptr: Int64, iconPtr: Int64): Unit
foreign func nativeActionIcon(ptr: Int64): Int64
foreign func nativeActionSetCheckable(ptr: Int64, checkable: Bool): Unit
foreign func nativeActionIsCheckable(ptr: Int64): Bool
foreign func nativeActionSetChecked(ptr: Int64, checked: Bool): Unit
foreign func nativeActionIsChecked(ptr: Int64): Bool
foreign func nativeActionConnectTriggered(ptr: Int64, code: Int64, callback: CFunc<(Int64, Bool) -> Unit>): Unit
foreign func nativeActionDelete(ptr: Int64): Unit

public class QAction {
    public let ptr: Int64

    public let triggered: QActionTriggeredSignal

    public init() {
        ptr = unsafe {
            nativeActionCreate(0)
        }
        triggered = QActionTriggeredSignal(ptr)
    }

    public init(parent: QWidget) {
        ptr = unsafe {
            nativeActionCreate(parent.ptr)
        }
        triggered = QActionTriggeredSignal(ptr)
    }

    init(ptr: Int64) {
        this.ptr = ptr
        triggered = QActionTriggeredSignal(ptr)
    }

    public func setStatusTip(tip: String) {
        unsafe {
            nativeActionSetStatusTip(ptr, CString(tip))
        }
    }

    public func setText(text: String) {
        unsafe {
            nativeActionSetText(ptr, CString(text))
        }
    }

    public func text(): String {
        let result = unsafe {
            nativeActionText(ptr)
        }
        return result.toString()
    }

    public func setIcon(icon: QIcon) {
        unsafe {
            nativeActionSetIcon(ptr, icon.ptr)
        }
    }

    public func icon(): QIcon {
        let iconPtr = unsafe {
            nativeActionIcon(ptr)
        }
        return QIcon(iconPtr)
    }

    public func setCheckable(checkable: Bool) {
        unsafe {
            nativeActionSetCheckable(ptr, checkable)
        }
    }

    public func isCheckable(): Bool {
        let checkable = unsafe {
            nativeActionIsCheckable(ptr)
        }
        return checkable
    }

    public func setChecked(checked: Bool) {
        unsafe {
            nativeActionSetChecked(ptr, checked)
        }
    }

    public func isChecked(): Bool {
        let checked = unsafe {
            nativeActionIsChecked(ptr)
        }
        return checked
    }

    public func delete() {
        triggered.remove()
        unsafe {
            nativeActionDelete(ptr)
        }
    }
}

public class QActionTriggeredSignal <: QSignalBool {
    init(ptr: Int64) {
        super("triggered", ptr)
    }

    override func nativeConnect(code: Int64, cb: CFunc<(Int64, Bool) -> Unit>) {
        unsafe {
            nativeActionConnectTriggered(ptr, code, cb)
        }
    }
}
