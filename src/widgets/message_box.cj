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

foreign func nativeMessageBoxAbout(
    parentPtr: Int64,
    title: CString,
    text: CString
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
            nativeMessageBoxInformation(parent.ptr, LibC.mallocCString(title), LibC.mallocCString(text), 0, 0)
        }
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
            nativeMessageBoxAbout(parent.ptr, LibC.mallocCString(title), LibC.mallocCString(text))
        }
    }
}
