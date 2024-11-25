/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package cjqt.gui

foreign func nativeBrushCreate(colorPtr: Int64): Int64
foreign func nativeBrushCreateWithBrush(brushPtr: Int64): Int64
foreign func nativeBrushCreateWithPixmap(pixmapPtr: Int64): Int64
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
     * @param ptr of Int64
     */
    public init(ptr: Int64) {
        this.ptr = ptr
    }

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
     * The Function is init constructor
     *
     * @param color of QColor
     */
    public init(brush: QBrush) {
        ptr = unsafe {
            nativeBrushCreateWithBrush(brush.ptr)
        }
    }

    /**
     * The Function is init constructor
     *
     * @param pixmap of QPixmap
     */
    public init(pixmap: QPixmap) {
        ptr = unsafe {
            nativeBrushCreateWithPixmap(pixmap.ptr)
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
