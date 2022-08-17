/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package qt.gui

foreign func nativePenCreate(colorPtr: Int64, thickness: Int32): Int64
foreign func nativePenDelete(ptr: Int64): Unit

/**
 * The class is QPen
 * @author wathinst
 */
public class QPen {
    /** let member ptr type is Int64 */
    public let ptr: Int64

    /**
     * The Function is init constructor
     *
     * @param color of QColor
     * @param thickness of Int32
     */
    public init(color: QColor, thickness: Int32) {
        ptr = unsafe {
            nativePenCreate(color.ptr, thickness)
        }
    }

    /**
     * The Function is delete
     *
     */
    public func delete() {
        unsafe {
            nativePenDelete(ptr)
        }
    }
}
