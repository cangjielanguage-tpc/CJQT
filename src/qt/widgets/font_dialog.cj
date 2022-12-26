/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package qt.widgets

foreign func nativeFileDialogGetFont(parentPtr: Int64): Int64

/**
 * The class is QFontDialog inherited from QWidget
 * @author wathinst
 */
public class QFontDialog <: QWidget {
    /**
     * The Function is getFont
     *
     * @param parent of QWidget, and the Default value is QWidget(0)
     *
     * @return Type of QFont
     */
    static public func getFont(parent!: QWidget = QWidget(0)): QFont {
        let fontPtr = unsafe {
            nativeFileDialogGetFont(parent.ptr)
        }
        return QFont(fontPtr)
    }
}