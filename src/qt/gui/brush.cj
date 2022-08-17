/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package qt.gui

foreign func nativeBrushCreate(colorPtr: Int64): Int64
foreign func nativeBrushDelete(ptr: Int64): Unit

/**
 * The class is QBrush
 * @author wathinst
 */
public class QBrush {
    /** let member ptr type is Int64 */
    public let ptr: Int64

    /**
     * The Function is init constructor
     *
     * @param color of QColor
     */
    public init(color: QColor) {
        ptr = unsafe {
            nativeBrushCreate(color.ptr)
        }
    }

    /**
     * The Function is delete
     *
     */
    public func delete() {
        unsafe {
            nativeBrushDelete(ptr)
        }
    }
}