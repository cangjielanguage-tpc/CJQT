package qt.widgets

from std import ffi.c.CString

foreign func nativePushButtonCreate(parentPtr: Int64): Int64
foreign func nativePushButtonSetText(ptr: Int64, text: CString): Unit
foreign func nativePushButtonSetStyleSheet(ptr: Int64, style: CString): Unit
foreign func nativePushButtonConnect(ptr: Int64, code: Int64, callback: CFunc<(Int64) -> Unit>): Unit
foreign func nativePushButtonDelete(ptr: Int64): Unit

public class QPushButton <: QWidget {

    public let clicked: QPushButtonClickedSignal 

    public init() {
        super(
            unsafe {
                nativePushButtonCreate(0)
            }
        )
        clicked = QPushButtonClickedSignal(ptr)
    }

    public init(text: String) {
        super(
            unsafe {
                nativePushButtonCreate(0)
            }
        )
        clicked = QPushButtonClickedSignal(ptr)
        setText(text)
    }

    public init(parent: QWidget) {
        super(
            unsafe {
                nativePushButtonCreate(parent.ptr)
            }
        )
        clicked = QPushButtonClickedSignal(ptr)
    }

    public func setText(text: String) {
        unsafe {
            nativePushButtonSetText(ptr, CString(text))
        }
    }

    public func setStyleSheet(style: String) {
        unsafe {
            nativePushButtonSetStyleSheet(ptr, CString(style))
        }
    }

    public override func delete() {
        clicked.remove()
        unsafe {
            nativePushButtonDelete(ptr)
        }
    }
}

public class QPushButtonClickedSignal <: QSignalUnit {
    init(ptr: Int64){
        super("clicked", ptr)
    }

    override func nativeConnect(code: Int64, cb: CFunc<(Int64) -> Unit>){
        unsafe {
            nativePushButtonConnect(ptr, code, cb)
        }
    }
}
