package qt.core

//foreign function
foreign func nativeLineFCreateWithLine(linePtr: Int64): Int64
foreign func nativeLineFCreateWithXY(x1: Float64, y1: Float64, x2: Float64, y2: Float64): Int64
foreign func nativeLineFCreateWithTwoPoint(pointF1Ptr: Int64, pointF2Ptr: Int64): Int64
foreign func nativeLineFCreate(): Int64
foreign func nativeLineFDelete(ptr: Int64): Unit

public open class QLineF {
    public let ptr: Int64

    public init() {
        this.ptr = unsafe { nativeLineFCreate() }
    }
    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(x1: Float64, y1: Float64, x2: Float64, y2: Float64) {
        this.ptr = unsafe {
            nativeLineFCreateWithXY(x1, y1, x2, y2)
        }
    }

    public init(p1: QPointF, p2: QPointF) {
        this.ptr = unsafe {
            nativeLineFCreateWithTwoPoint(p1.ptr, p2.ptr)
        }
    }

    public open func delete() {
        unsafe { nativeLineFDelete(this.ptr) }
    }
}
