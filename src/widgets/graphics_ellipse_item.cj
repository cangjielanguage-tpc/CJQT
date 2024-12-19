package cjqt.widgets

import cjqt.gui.*
import cjqt.core.*

//foreign func 
foreign func nativeGraphicsEllipseItemCreateWithXYWH(
    x: Float64,
    y: Float64,
    width: Float64,
    height: Float64,
    parentPtr: Int64
): Int64
foreign func nativeGraphicsEllipseItemCreateWithRect(x: Float64,y:Float64,width:Float64,height:Float64, parentPtr: Int64): Int64
foreign func nativeGraphicsEllipseItemCreate(parentPtr: Int64): Int64
foreign func nativeGraphicsEllipseItemDelete(ptr: Int64): Unit
foreign func nativeGraphicsEllipseItemRect(ptr: Int64): QRectF
foreign func nativeGraphicsEllipseItemSetRectWithRect(ptr: Int64, x: Float64, y: Float64, width: Float64, height: Float64): Unit
foreign func nativeGraphicsEllipseItemSetRect(ptr: Int64, x: Float64, y: Float64, width: Float64, height: Float64): Unit

public open class QGraphicsEllipseItem <: QAbstractGraphicsShapeItem {
    public init(ptr: Int64) {
        super(ptr)
    }
    public init(parent!: QGraphicsItem = QGraphicsItem(0)) {
        super(
            unsafe {
                nativeGraphicsEllipseItemCreate(parent.ptr)
            }
        )
    }
    public init(x: Float64, y: Float64, width: Float64, height: Float64, parent!: QGraphicsItem = QGraphicsItem(0)) {
        super(
            unsafe {
                nativeGraphicsEllipseItemCreateWithXYWH(x, y, width, height, parent.ptr)
            }
        )
    }
    public init(rect: QRectF, parent!: QGraphicsItem = QGraphicsItem(0)) {
        super(
            unsafe {
                nativeGraphicsEllipseItemCreateWithRect(rect.x,rect.y,rect.width,rect.height, parent.ptr)
            }
        )
    }
    public open override func delete() {
        unsafe { nativeGraphicsEllipseItemDelete(this.ptr) }
    }
    public func rect(): QRectF {
        let rectF= unsafe { nativeGraphicsEllipseItemRect(this.ptr) }
        return rectF
    }
    public func setRect(rectangle: QRectF): Unit {
        unsafe { nativeGraphicsEllipseItemSetRectWithRect(this.ptr, rectangle.x,rectangle.y,rectangle.width,rectangle.height) }
    }
    public func setRect(x: Float64, y: Float64, width: Float64, height: Float64): Unit {
        unsafe { nativeGraphicsEllipseItemSetRect(this.ptr, x, y, width, height) }
    }
}
