package cjqt.qt.widgets

import cjqt.qt.gui.QBrush
import cjqt.qt.gui.QPen

//foreign function
foreign func nativeAbstractGraphicsShapeItemCreate(parentPtr: Int64): Int64
foreign func nativeAbstractGraphicsShapeItemDelete(ptr: Int64): Int64
foreign func nativeAbstractGraphicsShapeItemBrush(ptr: Int64): Int64
foreign func nativeAbstractGraphicsShapeItemSetBrush(ptr: Int64, brushPtr: Int64): Unit
foreign func nativeAbstractGraphicsShapeItemPen(ptr: Int64): Int64
foreign func nativeAbstractGraphicsShapeItemSetPen(ptr: Int64, penPtr: Int64): Unit

public open class QAbstractGraphicsShapeItem <: QGraphicsItem {
    public init(ptr: Int64) {
        super(ptr)
    }
    public init() {
        super(
            unsafe {
                nativeAbstractGraphicsShapeItemCreate(0)
            }
        )
    }
    public init(parent: QGraphicsItem) {
        super(
            unsafe {
                nativeAbstractGraphicsShapeItemCreate(parent.ptr)
            }
        )
    }

    public open override func delete(): Unit {
        unsafe { nativeAbstractGraphicsShapeItemDelete(this.ptr) }
    }

    public func brush(): QBrush {
        let brushPtr = unsafe {
            nativeAbstractGraphicsShapeItemBrush(this.ptr)
        }
        return QBrush(brushPtr)
    }
    public func setBrush(brush: QBrush): Unit {
        unsafe { nativeAbstractGraphicsShapeItemSetBrush(this.ptr, brush.ptr) }
    }
    public func pen(): QPen {
        let penPtr = unsafe {
            nativeAbstractGraphicsShapeItemPen(this.ptr)
        }
        return QPen(penPtr)
    }
    public func setPen(pen: QPen): Unit {
        unsafe { nativeAbstractGraphicsShapeItemSetPen(this.ptr, pen.ptr) }
    }
}
