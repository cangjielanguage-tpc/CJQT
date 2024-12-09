/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package cjqt.gui

import cjqt.core.QEvent
import cjqt.core.QPoint

foreign func nativeMouseEventGetPos(vptr: Int64): Int64
foreign func nativeMouseEventGetScreenPos(vptr: Int64): Int64
foreign func nativeMouseEventGetWindowPos(vptr: Int64): Int64
foreign func nativeMouseEventGetGlobalPos(vptr: Int64): Int64
foreign func nativeMouseEventGetLocalPos(vptr: Int64): Int64

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
    public func screenPos(): QPointF {
        let pointPtr = unsafe {
            nativeMouseEventGetScreenPos(this.ptr)
        }
        return QPointF(pointPtr)
    }
    
    public func windowPos(): QPointF{
        let pointPtr = unsafe {
            nativeMouseEventGetWindowPos(this.ptr)
        }
        return QPointF(pointPtr)
    }
    
    public func globalPos(): QPoint{
        let pointPtr = unsafe {
            nativeMouseEventGetGlobalPos(this.ptr)
        }
        return QPoint(pointPtr)
    }
    public func localPos(): QPointF{
        let pointPtr = unsafe {
            nativeMouseEventGetLocalPos(this.ptr)
        }
        return QPointF(pointPtr)
    }
}
