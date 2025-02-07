/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package cjqt.widgets

foreign func nativeMessageBoxInformation(
    parentPtr: Int64,
    title: CString,
    text: CString,
    buttonsPtr: Int64,
    defaultButtonPtr: Int64
): Unit

foreign func nativeMessageBoxQuestion(
    parentPtr: Int64,
    title: CString,
    text: CString,
    buttonsPtr: Int64,
    defaultButtonPtr: Int64
): Int32

foreign func nativeMessageBoxAbout(
    parentPtr: Int64,
    title: CString,
    text: CString
): Unit


foreign func nativeMessageBoxCritical(
    parentPtr: Int64,
    title: CString,
    text: CString,
    buttonsPtr: Int64,
    defaultButtonPtr: Int64
): Unit


/**
 * The class is QMessageBox inherited from QWidget
 * @author wathinst
 */
public class QMessageBox <: QWidget {

    /**
     * The Function is information
     *
     * @param parent of QWidget
     * @param title of String
     * @param text of String
     */
    static public func information(parent: QWidget, title: String, text: String) {
        unsafe {
            let ti=LibC.mallocCString(title)
            let te= LibC.mallocCString(text)
            nativeMessageBoxInformation(parent.ptr,ti ,te, 0, 0)
            LibC.free(ti)
            LibC.free(te)
        }
    }

    static public func question(parent: QWidget, title: String, text: String):StandardButton {
        var btn:Int32
        unsafe {
            let ti=LibC.mallocCString(title)
            let te= LibC.mallocCString(text)
            btn=nativeMessageBoxQuestion(parent.ptr, ti ,te, 0, 0)
            LibC.free(ti)
            LibC.free(te)
        }
        return StandardButton.convert(btn)
    }

    /**
     * The Function is about
     *
     * @param parent of QWidget
     * @param title of String
     * @param text of String
     */
    static public func about(parent: QWidget, title: String, text: String) {
        unsafe {
            let ti=LibC.mallocCString(title)
            let te= LibC.mallocCString(text)
            nativeMessageBoxAbout(parent.ptr, ti ,te)
            LibC.free(ti)
            LibC.free(te)
        }
    }
    
    static public func critical(parent: QWidget, title: String, text: String) {
        unsafe {
            let ti=LibC.mallocCString(title)
            let te= LibC.mallocCString(text)
            nativeMessageBoxCritical(parent.ptr, ti ,te, 0, 0)
            LibC.free(ti)
            LibC.free(te)
        }
    }
}
