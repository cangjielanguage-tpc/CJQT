package cjqt.qt.widgets

import cjqt.qt.gui.*
import cjqt.qt.core.*

//foreign function
foreign func nativeGraphicsLineItemCreateWithParent(parentPtr: Int64): Int64
foreign func nativeGraphicsLineItemCreate(x1: Float64, y1: Float64, x2: Float64, y2: Float64, parentPtr: Int64): Int64
foreign func nativeGraphicsLineItemCreateWithLine(lineFPtr: Int64, parentPtr: Int64): Int64
foreign func nativeGraphicsLineItemDelete(ptr: Int64): Unit
foreign func nativeGraphicsLineItemLine(ptr: Int64): Int64
foreign func nativeGraphicsLineItemPen(ptr: Int64): Int64
foreign func nativeGraphicsLineItemSetLineWithLine(ptr: Int64, lineFPtr: Int64): Unit
foreign func nativeGraphicsLineItemSetLine(ptr: Int64, x1: Float64, y1: Float64, x2: Float64, y2: Float64): Unit
foreign func nativeGraphicsLineItemSetPen(ptr: Int64, penPtr: Int64): Unit

public open class QGraphicsLineItem <: QGraphicsItem {
    public init(ptr: Int64) {
        super(ptr)
    }
    public init(x1: Float64, y1: Float64, x2: Float64, y2: Float64, parent!: QGraphicsItem = QGraphicsItem(0)) {
        super(
            unsafe {
                nativeGraphicsLineItemCreate(x1, y1, x2, y2, parent.ptr)
            }
        )
    }
    public init(parent!: QGraphicsItem = QGraphicsItem(0)) {
        super(
            unsafe {
                nativeGraphicsLineItemCreateWithParent(parent.ptr)
            }
        )
    }

    public init(line: QLineF, parent!: QGraphicsItem = QGraphicsItem(0)) {
        super(
            unsafe {
                nativeGraphicsLineItemCreateWithLine(line.ptr, parent.ptr)
            }
        )
    }

    public open func delete(): Unit {
        unsafe { nativeGraphicsLineItemDelete(this.ptr) }
    }

    public func line(): QLineF {
        let lineFPtr = unsafe {
            nativeGraphicsLineItemLine(this.ptr)
        }
        return QLineF(lineFPtr)
    }
    public func pen(): QPen {
        let penPtr = unsafe {
            nativeGraphicsLineItemPen(this.ptr)
        }
        return QPen(penPtr)
    }

    public func setLine(line: QLineF): Unit {
        unsafe {
            nativeGraphicsLineItemSetLineWithLine(this.ptr, line.ptr)
        }
    }
    public func setLine(x1: Float64, y1: Float64, x2: Float64, y2: Float64): Unit {
        unsafe {
            nativeGraphicsLineItemSetLine(this.ptr, x1, y1, x2, y2)
        }
    }
    public func setPen(pen: QPen): Unit {
        unsafe {
            nativeGraphicsLineItemSetPen(this.ptr, pen.ptr)
        }
    }
}
