/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package cjqt.widgets

import cjqt.gui.*
import cjqt.core.*

//foreign function
foreign func nativeGraphicsSceneMouseEventScenePos(ptr: Int64): QPointF
foreign func nativeGraphicsSceneMouseEventScreenPos(ptr: Int64): QPoint
foreign func nativeGraphicsSceneMouseEventPos(ptr: Int64): QPointF
foreign func nativeGraphicsSceneMouseEventDelete(ptr: Int64): Unit

/**
 * The class is QGraphicsSceneMouseEvent
 * @author helin
 */
public class QGraphicsSceneMouseEvent <: QGraphicsSceneEvent {
    /**
     * The Function is init constructor
     *
     * @param ptr of Int64
     */
    public init(ptr: Int64) {
        super(ptr)
    }

    /**
     * The Function is scenePos
     *
     * @return Type   of QPointF
     */
    public func scenePos(): QPointF {
        let pointF = unsafe {
            nativeGraphicsSceneMouseEventScenePos(this.ptr)
        }
        // var pointF = QPointF(pointFPtr)
        // var newPointF = QPointF(pointF.rx(), pointF.ry())
        return pointF
    }

    /**
     * The Function is screenPos
     *
     * @return Type   of QPoint
     */
    public func screenPos(): QPoint {
        let point = unsafe {
            nativeGraphicsSceneMouseEventScreenPos(this.ptr)
        }
        return point
    }

    /**
     * The Function is pos
     *
     * @return Type   of QPointF
     */
    public func pos(): QPointF {
        let pointF = unsafe {
            nativeGraphicsSceneMouseEventPos(this.ptr)
        }
        return pointF
    }

    /**
     * The Function is delete
     *
     */
    public func delete(): Unit {
        unsafe { nativeGraphicsSceneMouseEventDelete(this.ptr) }
    }
}
