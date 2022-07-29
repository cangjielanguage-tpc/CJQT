package qt.widgets

// from std import ffi.c.CString

foreign func nativeMessageBoxInformation(
    parentPtr: Int64,
    title: CString,
    text: CString,
    buttonsPtr: Int64,
    defaultButtonPtr: Int64
): Unit

foreign func nativeMessageBoxAbout(
    parentPtr: Int64,
    title: CString,
    text: CString
): Unit

public class QMessageBox <: QWidget {
    static public func information(parent: QWidget, title: String, text: String) {
        unsafe {
            nativeMessageBoxInformation(parent.ptr, CString(title), CString(text), 0, 0)
        }
    }

    static public func about(parent: QWidget, title: String, text: String) {
        unsafe {
            nativeMessageBoxAbout(parent.ptr, CString(title), CString(text))
        }
    }
}
