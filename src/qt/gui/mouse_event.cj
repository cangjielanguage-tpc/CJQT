/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package qt.gui

foreign func nativeMouseEventGetPos(vptr: Int64): Int64

/**
 * The class is QMouseEvent
 * @author wathinst
 */
public class QMouseEvent <: QEvent {
    /**
     * The Function is init constructor
     *
     * @param ptr of Int64
     */
    public init(ptr: Int64) {
        super(ptr)
    }

    public func getPos(): QPoint {
        let pointPtr = unsafe {
            nativeMouseEventGetPos(this.ptr)
        }
        return QPoint(pointPtr)
    }
}
