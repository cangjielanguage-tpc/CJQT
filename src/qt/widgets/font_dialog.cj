package qt.widgets

// from std import ffi.c.CString
import qt.code.*

foreign func nativeFileDialogGetFont(parentPtr: Int64): Int64

public class QFontDialog <: QWidget {
    static public func getFont(parent!: QWidget = QWidget(0)): QFont {
        let fontPtr = unsafe {
            nativeFileDialogGetFont(parent.ptr)
        }
        return QFont(fontPtr)
    }
}