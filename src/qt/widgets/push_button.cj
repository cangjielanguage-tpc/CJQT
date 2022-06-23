package qt.widgets

from std import ffi.c.CString

foreign func nativePushButtonCreate(appPtr: Int64, parentPtr: Int64): Int64
foreign func nativePushButtonSetText(ptr: Int64, text: CString): Unit
foreign func nativePushButtonSetStyleSheet(ptr: Int64, style: CString): Unit
foreign func nativePushButtonConnect(ptr: Int64, callback: CFunc<(Int64) -> Unit>): Unit
foreign func nativePushButtonDelete(ptr: Int64): Unit

public class QPushButton <: QWidget {
    static let connectCallback = HashMap<Int64, () -> Unit>()

    public init() {
        super(
            unsafe {
                nativePushButtonCreate(QApplication.ptr, 0)
            }
        )
    }

    public init(text: String) {
        super(
            unsafe {
                nativePushButtonCreate(QApplication.ptr, 0)
            }
        )
        setText(text)
    }

    public init(parent: QWidget) {
        super(
            unsafe {
                nativePushButtonCreate(QApplication.ptr, parent.ptr)
            }
        )
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

    public func connect(callback: () -> Unit) {
        QPushButton.connectCallback.put(ptr, callback)
        let cb: CFunc<(Int64) -> Unit> = {
            ptr => try {
                QPushButton.connectCallback[ptr]()
            } catch (e: Exception) {
                println(e)
            }
        }
        unsafe {
            nativePushButtonConnect(ptr, cb)
        }
    }

    public override func delete() {
        QPushButton.connectCallback.remove(ptr)
        unsafe {
            nativePushButtonDelete(ptr)
        }
    }
}
