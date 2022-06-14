package qt.widgets

from std import ffi.c.CString

foreign func nativeLabelCreate(appPtr: Int64, parentPtr: Int64): Int64
foreign func nativeLabelSetGeometry(ptr: Int64, ax:Int32, ay:Int32, aw:Int32, ah:Int32): Unit
foreign func nativeLabelSetText(ptr: Int64, text:CString): Unit
foreign func nativeLabelDelete(ptr: Int64): Unit

public class QLabel <: QWidget{
    public init() {
        super(unsafe {
            nativeLabelCreate(QApplication.ptr, 0)
        })
    }

    public init(parent: QWidget) {
        super(unsafe {
            nativeLabelCreate(QApplication.ptr, parent.ptr)
        })
    }

    public func setGeometry(ax:Int32, ay:Int32, aw:Int32, ah:Int32) {
        unsafe {
            nativeLabelSetGeometry(ptr, ax, ay, aw, ah)
        }
    }

    public func setText(text:String) {
        unsafe {
            nativeLabelSetText(ptr, CString(text))
        }
    }

    public override func delete() {
        unsafe {
            nativeLabelDelete(ptr)
        }
    }
}