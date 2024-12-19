/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package cjqt.gui

foreign func nativeScreenGeometry(ptr: Int64): QRect

/**
 * The class is QIcon
 * @author wathinst
 */
public class QScreen<:QObject {
    /** let member ptr type is Int64 */

    /**
     * The Function is init constructor
     *
     */
    public init(ptr:Int64) {
        super(ptr)
    }

    /**
     * The Function is init constructor
     *
     * @param fileName of String
     */
    public func geometry():QRect {
        let rect = unsafe {
            nativeScreenGeometry(this.ptr)
        }
        // return QRect(rect)
        return rect
    }

}