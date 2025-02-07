/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package cjqt.widgets

import cjqt.core.*

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
        var urlPtr:Int64=0
        unsafe {
            let c=LibC.mallocCString(caption)
            let f=LibC.mallocCString(filter)
            urlPtr = nativeFileDialogGetOpenFileUrl(parent.ptr,c, dir.ptr,f )
            LibC.free(c)
            LibC.free(f)
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
        var name :CString
        unsafe {
            let c=LibC.mallocCString(caption)
            let d=LibC.mallocCString(dir)
            let f=LibC.mallocCString(filter)
            name= nativeFileDialogGetOpenFileName(parent.ptr, c, d,f)
            LibC.free(c)
            LibC.free(d)
            LibC.free(f)
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
        var urlPtr :Int64=0
        unsafe {
            let f=LibC.mallocCString(filter)
            urlPtr=nativeFileDialogGetSaveFileUrl(parent.ptr, LibC.mallocCString(caption), dir.ptr, f)
            LibC.free(f)
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
        var name : CString
        unsafe {
            let c=LibC.mallocCString(caption)
            let d=LibC.mallocCString(dir)
            let f=LibC.mallocCString(filter)
            name =nativeFileDialogGetSaveFileName(parent.ptr, c, d,f)
            LibC.free(c)
            LibC.free(d)
            LibC.free(f)
        }
        return name.toString()
    }
}
