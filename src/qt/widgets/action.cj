package qt.widgets

foreign func nativeActionCreate(appPtr: Int64, parentPtr: Int64): Int64
foreign func nativeActionSetStatusTip(ptr: Int64, tip:CString): Unit
foreign func nativeActionSetText(ptr: Int64, text:CString): Unit
foreign func nativeActionDelete(ptr: Int64): Unit

public class QAction {
    public let ptr: Int64

    public init() {
        ptr = unsafe {
            nativeActionCreate(QApplication.ptr, 0)
        }
    }

    public init(parent: QWidget) {
        ptr = unsafe {
            nativeActionCreate(QApplication.ptr, parent.ptr)
        }
    }

    init(ptr: Int64){
        this.ptr = ptr
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
        unsafe {
            nativeActionDelete(ptr)
        }
    }
}