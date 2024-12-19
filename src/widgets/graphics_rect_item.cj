package cjqt.widgets

import cjqt.gui.*
import cjqt.core.*

//foreign func 
foreign func nativeGraphicsRectItemCreateWithXYWH(
    x: Float64,
    y: Float64,
    width: Float64,
    height: Float64,
    parentPtr: Int64
): Int64
foreign func nativeGraphicsRectItemCreateWithRect(x: Float64,y: Float64,width: Float64,height: Float64, parentPtr: Int64): Int64
foreign func nativeGraphicsRectItemCreate(parentPtr: Int64): Int64
foreign func nativeGraphicsRectItemDelete(ptr: Int64): Unit
foreign func nativeGraphicsRectItemRect(ptr: Int64): QRectF
foreign func nativeGraphicsRectItemSetRect(ptr: Int64, x: Float64, y: Float64, width: Float64, height: Float64): Unit

public open class QGraphicsRectItem <: QAbstractGraphicsShapeItem {
    public init(ptr: Int64) {
        super(ptr)
    }
    public init(parent!: QGraphicsItem = QGraphicsItem(0)) {
        super(
            unsafe {
                nativeGraphicsRectItemCreate(parent.ptr)
            }
        )
    }
    public init(x: Float64, y: Float64, width: Float64, height: Float64, parent!: QGraphicsItem = QGraphicsItem(0)) {
        super(
            unsafe {
                nativeGraphicsRectItemCreateWithXYWH(x, y, width, height, parent.ptr)
            }
        )
    }
    public init(rect: QRectF, parent!: QGraphicsItem = QGraphicsItem(0)) {
        super(
            unsafe {
                nativeGraphicsRectItemCreateWithRect(rect.x,rect.y,rect.width,rect.height, parent.ptr)
            }
        )
    }
    public open override func delete() {
        unsafe { nativeGraphicsRectItemDelete(this.ptr) }
    }
    public func rect(): QRectF {
        let rectF = unsafe { nativeGraphicsRectItemRect(this.ptr) }
        return rectF
    }
    public func setRect(rectangle: QRectF): Unit {
        unsafe { nativeGraphicsRectItemSetRect(this.ptr, rectangle.x,rectangle.y,rectangle.width,rectangle.height) }
    }
    public func setRect(x: Float64, y: Float64, width: Float64, height: Float64): Unit {
        unsafe { nativeGraphicsRectItemSetRect(this.ptr, x, y, width, height) }
    }
}
