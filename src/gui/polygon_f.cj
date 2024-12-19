package cjqt.gui

import cjqt.core.QRectF
import cjqt.core.QPointF

//foreign function
foreign func nativePolygonFCreate(): Int64
foreign func nativePolygonFCreateWithSize(size: Int32): Int64
foreign func nativePolygonFCreateWithRect(x: Float64,y: Float64,width: Float64,height: Float64): Int64
foreign func nativePolygonFCreateWithPolygon(polygonPtr: Int64): Int64
foreign func nativePolygonFCreateWithPolygonF(polygonFPtr: Int64): Int64
foreign func nativePolygonFDelete(ptr: Int64): Unit

// Operator <<
foreign func nativePolygonFOperatorLeftMove(ptr: Int64, pointX: Float64, pointY: Float64): Int64

public open class QPolygonF {
    public let ptr: Int64

    public init() {
        this.ptr = unsafe { nativePolygonFCreate() }
    }
    public init(ptr: Int64) {
        this.ptr = ptr
    }
    public init(size: Int32) {
        this.ptr = unsafe { nativePolygonFCreateWithSize(size) }
    }
    public init(rectangle: QRectF) {
        this.ptr = unsafe {
            nativePolygonFCreateWithRect(rectangle.x,rectangle.y,rectangle.width,rectangle.height)
        }
    }
    public init(polygon: QPolygon) {
        this.ptr = unsafe {
            nativePolygonFCreateWithPolygon(polygon.ptr)
        }
    }
    public init(polygon: QPolygonF) {
        this.ptr = unsafe {
            nativePolygonFCreateWithPolygonF(polygon.ptr)
        }
    }
    public open func delete() {
        unsafe { nativePolygonDelete(this.ptr) }
    }

    public operator func <<(pointF: QPointF): QPolygonF {
        let vptr = unsafe {
            nativePolygonFOperatorLeftMove(this.ptr, pointF.x,pointF.y)
        }
        return QPolygonF(vptr)
    }
}
