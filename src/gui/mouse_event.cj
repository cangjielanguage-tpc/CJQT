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

foreign func nativeMouseEventGetPos(vptr: Int64): QPoint
foreign func nativeMouseEventGetScreenPos(vptr: Int64): QPointF
foreign func nativeMouseEventGetWindowPos(vptr: Int64): QPointF
foreign func nativeMouseEventGetGlobalPos(vptr: Int64): QPoint
foreign func nativeMouseEventGetLocalPos(vptr: Int64): QPointF
foreign func nativeMouseEventButton(vptr: Int64): Int32
foreign func nativeMouseEventButtons(vptr: Int64): Int32

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
        let point = unsafe {
            nativeMouseEventGetPos(this.ptr)
        }
        return point
    }
    public func screenPos(): QPointF {
        let point = unsafe {
            nativeMouseEventGetScreenPos(this.ptr)
        }
        return point
    }
    
    public func windowPos(): QPointF{
        let point = unsafe {
            nativeMouseEventGetWindowPos(this.ptr)
        }
        return point
    }
    
    public func globalPos(): QPoint{
        let point = unsafe {
            nativeMouseEventGetGlobalPos(this.ptr)
        }
        return point
    }
    public func localPos(): QPointF{
        let point= unsafe {
            nativeMouseEventGetLocalPos(this.ptr)
        }
        return point
    }

    /**
     * The Function is button
     *
     * @return Type of Int32
     */
    public func button(): Int32 {
        return unsafe {
            nativeMouseEventButton(this.ptr)
        }
    }

    /**
     * The Function is buttons
     *
     * @return Type of Int32
     */
    public func buttons(): Int32 {
        return unsafe {
            nativeMouseEventButtons(this.ptr)
        }
    }
}
