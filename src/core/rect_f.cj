package cjqt.core

//foreign funtion
foreign func nativeRectFCreate(): Int64
foreign func nativeRectFCreateWithRect(rectPtr: Int64): Int64
foreign func nativeRectFCreateWithXYWH(x: Float64, y: Float64, width: Float64, height: Float64): Int64
foreign func nativeRectFCreateWithTwoPoint(topLeftPtr: Int64, bottomRightPtr: Int64): Int64
foreign func nativeRectFCreateWithPointAndSize(topLeftPtr: Int64, sizePtr: Int64): Int64
foreign func nativeRectFDelete(ptr: Int64): Unit

public open class QRectF {
    public let ptr: Int64

    public init() {
        this.ptr = unsafe { nativeRectFCreate() }
    }
    public init(ptr: Int64) {
        this.ptr = ptr
    }
    public init(rect: QRect) {
        this.ptr = unsafe {
            nativeRectFCreateWithRect(rect.ptr)
        }
    }
    public init(x: Float64, y: Float64, width: Float64, height: Float64) {
        this.ptr = unsafe { nativeRectFCreateWithXYWH(x, y, width, height) }
    }
    public init(topLeft: QPointF, bottomRight: QPointF) {
        this.ptr = unsafe { nativeRectFCreateWithTwoPoint(topLeft.ptr, bottomRight.ptr) }
    }
    public init(topLeft: QPointF, size: QSizeF) {
        this.ptr = unsafe { nativeRectFCreateWithPointAndSize(topLeft.ptr, size.ptr) }
    }
    public open func delete() {
        unsafe { nativeRectFDelete(this.ptr) }
    }
}
