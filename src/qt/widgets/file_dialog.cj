/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package qt.widgets

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

/**
 * The class is QFileDialog inherited from QWidget
 * @author wathinst
 */
public class QFileDialog <: QWidget {
    /**
     * The Function is getOpenFileUrl
     *
     * @param parent of QWidget, and the Default value is QWidget(0)
     * @param caption of String, and the Default value is ""
     * @param dir of QUrl, and the Default value is QUrl("")
     * @param filter of String, and the Default value is ""
     *
     * @return Type of QUrl
     */
    static public func getOpenFileUrl(parent!: QWidget = QWidget(0), caption!: String = "", dir!: QUrl = QUrl(""), 
        filter!: String = ""): QUrl {
        /* let member urlPtr */
        let urlPtr = unsafe {
            nativeFileDialogGetOpenFileUrl(parent.ptr, CString(caption), dir.ptr, CString(filter))
        }
        return QUrl(urlPtr)
    }

    /**
     * The Function is getOpenFileName
     *
     * @param parent of QWidget, and the Default value is QWidget(0)
     * @param caption of String, and the Default value is ""
     * @param dir of String, and the Default value is ""
     * @param filter of String, and the Default value is ""
     *
     * @return Type of String
     */
    static public func getOpenFileName(parent!: QWidget = QWidget(0), caption!: String = "", dir!: String = "", 
        filter!: String = ""): String {
        /* let member name */
        let name = unsafe {
            nativeFileDialogGetOpenFileName(parent.ptr, CString(caption), CString(dir), CString(filter))
        }
        return name.toString()
    }

    /**
     * The Function is getSaveFileUrl
     *
     * @param parent of QWidget, and the Default value is QWidget(0)
     * @param caption of String, and the Default value is ""
     * @param dir of QUrl, and the Default value is QUrl("")
     * @param filter of String, and the Default value is ""
     *
     * @return Type of QUrl
     */
    static public func getSaveFileUrl(parent!: QWidget = QWidget(0), caption!: String = "", dir!: QUrl = QUrl(""), 
        filter!: String = ""): QUrl {
        /* let member urlPtr */
        let urlPtr = unsafe {
            nativeFileDialogGetSaveFileUrl(parent.ptr, CString(caption), dir.ptr, CString(filter))
        }
        return QUrl(urlPtr)
    }

    /**
     * The Function is getSaveFileName
     *
     * @param parent of QWidget, and the Default value is QWidget(0)
     * @param caption of String, and the Default value is ""
     * @param dir of String, and the Default value is ""
     * @param filter of String, and the Default value is ""
     *
     * @return Type of String
     */
    static public func getSaveFileName(parent!: QWidget = QWidget(0), caption!: String = "", dir!: String = "", 
        filter!: String = ""): String {
        /* let member name */
        let name = unsafe {
            nativeFileDialogGetSaveFileName(parent.ptr, CString(caption), CString(dir), CString(filter))
        }
        return name.toString()
    }
}
