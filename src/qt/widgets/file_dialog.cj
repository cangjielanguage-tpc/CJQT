package qt.widgets

from std import ffi.c.CString
import qt.code.*

foreign func nativeFileDialogGetOpenFileUrl(
    parentPtr: Int64,
    caption: CString,
    dirPtr: Int64,
    filter: CString
): Int64

foreign func nativeFileDialogGetOpenFileName(
    parentPtr: Int64,
    caption: CString,
    dir: CString,
    filter: CString
): CString

foreign func nativeFileDialogGetSaveFileUrl(
    parentPtr: Int64,
    caption: CString,
    dirPtr: Int64,
    filter: CString
): Int64

foreign func nativeFileDialogGetSaveFileName(
    parentPtr: Int64,
    caption: CString,
    dir: CString,
    filter: CString
): CString

public class QFileDialog <: QWidget {
    static public func getOpenFileUrl(parent!: QWidget = QWidget(0), caption!: String = "", dir!: QUrl = QUrl(""), 
        filter!: String = ""): QUrl {
        let urlPtr = unsafe {
            nativeFileDialogGetOpenFileUrl(parent.ptr, CString(caption), dir.ptr, CString(filter))
        }
        return QUrl(urlPtr)
    }

    static public func getOpenFileName(parent!: QWidget = QWidget(0), caption!: String = "", dir!: String = "", 
        filter!: String = ""): String {
        let name = unsafe {
            nativeFileDialogGetOpenFileName(parent.ptr, CString(caption), CString(dir), CString(filter))
        }
        return name.toString()
    }

    static public func getSaveFileUrl(parent!: QWidget = QWidget(0), caption!: String = "", dir!: QUrl = QUrl(""), 
        filter!: String = ""): QUrl {
        let urlPtr = unsafe {
            nativeFileDialogGetSaveFileUrl(parent.ptr, CString(caption), dir.ptr, CString(filter))
        }
        return QUrl(urlPtr)
    }

    static public func getSaveFileName(parent!: QWidget = QWidget(0), caption!: String = "", dir!: String = "", 
        filter!: String = ""): String {
        let name = unsafe {
            nativeFileDialogGetSaveFileName(parent.ptr, CString(caption), CString(dir), CString(filter))
        }
        return name.toString()
    }
}
