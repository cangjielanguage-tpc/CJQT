package qt.widgets

from std import ffi.c.CString

foreign func nativePushButtonCreate(appPtr: Int64, parentPtr: Int64): Int64
foreign func nativePushButtonSetText(ptr: Int64, text:CString): Unit
foreign func nativePushButtonSetStyleSheet(ptr: Int64, style:CString): Unit
foreign func nativePushButtonDelete(ptr: Int64): Unit

public class QPushButton <: QWidget{

    public init() {
        super(unsafe {
            nativePushButtonCreate(QApplication.ptr, 0)
        })
    }

    public init(text:String) {
        super(unsafe {
            nativePushButtonCreate(QApplication.ptr, 0)
        })
        setText(text)
    }

    public init(parent: QWidget) {
        super(unsafe {
            nativePushButtonCreate(QApplication.ptr, parent.ptr)
        })
    }

    public func setText(text:String) {
        unsafe {
            nativePushButtonSetText(ptr, CString(text))
        }
    }

    public func setStyleSheet(style:String) {
        unsafe {
            nativePushButtonSetStyleSheet(ptr, CString(style))
        }
    }

    public override func delete() {
        unsafe {
            nativePushButtonDelete(ptr)
        }
    }
}