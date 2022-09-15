package qt.gui

//foreign function
foreign func nativeTransformCreateWithTwoVector(m11: Float64, m12: Float64, m21: Float64, m22: Float64, dx: Float64, 
    dy: Float64): Int64
foreign func nativeTransformCreateWithThirdVector(m11: Float64, m12: Float64, m13: Float64, m21: Float64, 
    m22: Float64, m23: Float64, m31: Float64, m32: Float64, m33: Float64): Int64
foreign func nativeTransformCreate(): Int64
foreign func nativeTransformDelete(ptr: Int64): Unit

public open class QTransform {
    public let ptr: Int64

    public init() {
        this.ptr = unsafe { nativeTransformCreate() }
    }
    public init(ptr: Int64) {
        this.ptr = ptr
    }
    public init(m11: Float64, m12: Float64, m21: Float64, m22: Float64, dx: Float64, dy: Float64) {
        this.ptr = unsafe { nativeTransformCreateWithTwoVector(m11, m12, m21, m22, dx, dy) }
    }
    public init(m11: Float64, m12: Float64, m13: Float64, m21: Float64, m22: Float64, m23: Float64, m31: Float64, 
        m32: Float64, m33: Float64) {
        this.ptr = unsafe { nativeTransformCreateWithThirdVector(m11, m12, m13, m21, m22, m23, m31, m32, m33) }
    }

    public open func delete() {
        unsafe { nativeTransformDelete(this.ptr) }
    }
}
