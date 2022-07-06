package qt.widgets

foreign func nativeActionCreate(parentPtr: Int64): Int64
foreign func nativeActionSetStatusTip(ptr: Int64, tip:CString): Unit
foreign func nativeActionSetText(ptr: Int64, text:CString): Unit
foreign func nativeActionConnectTriggered(ptr: Int64, code: Int64, callback: CFunc<(Int64) -> Unit>): Unit
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

    init(ptr: Int64){
        this.ptr = ptr
        triggered = QActionTriggeredSignal(ptr)
    }

    public func setStatusTip(tip:String) {
        unsafe {
            nativeActionSetStatusTip(ptr, CString(tip))
        }
    }

    public func setText(text:String) {
        unsafe {
            nativeActionSetText(ptr, CString(text))
        }
    }

    public func delete() {
        triggered.remove()
        unsafe {
            nativeActionDelete(ptr)
        }
    }
}

public class QActionTriggeredSignal <: QSignal {
    init(ptr: Int64){
        super("triggered", ptr)
    }

    override func nativeConnect(code: Int64, cb: CFunc<(Int64) -> Unit>){
        unsafe {
            nativeActionConnectTriggered(ptr, code, cb)
        }
    }
}