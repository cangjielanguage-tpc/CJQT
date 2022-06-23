package qt.widgets

from std import ffi.c.CString

foreign func nativeMessageBoxInformation(
    appPtr: Int64, 
    parentPtr: Int64,
    title: CString,
    text: CString,
    buttonsPtr: Int64,
    defaultButtonPtr: Int64
): Unit

public class QMessageBox <: QWidget {
    static public func information(parent: QWidget, title: String, text: String) {
        unsafe {
            nativeMessageBoxInformation(QApplication.ptr, parent.ptr, CString(title), CString(text), 0, 0)
        }
    }
}
