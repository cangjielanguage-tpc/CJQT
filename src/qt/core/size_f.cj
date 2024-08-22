package cjqt.qt.core

//foreign function
foreign func nativeSizeFCreate(): Int64
foreign func nativeSizeFCreateWithWH(width: Float64, height: Float64): Int64
foreign func nativeSizeFCreateWithSize(sizePtr: Int64): Int64
foreign func nativeSizeFDelete(ptr: Int64): Unit

public open class QSizeF {
    public let ptr: Int64

    public init() {
        this.ptr = unsafe { nativeSizeFCreate() }
    }
    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(width: Float64, height: Float64) {
        this.ptr = unsafe { nativeSizeFCreateWithWH(width, height) }
    }

    public init(size: QSize) {
        this.ptr = unsafe { nativeSizeFCreateWithSize(size.ptr) }
    }

    public open func delete() {
        unsafe { nativeSizeFDelete(this.ptr) }
    }
}
