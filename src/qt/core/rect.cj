package cjqt.qt.core

//c
foreign func nativeRectCreate(x: Int32, y: Int32, width: Int32, height: Int32): Int64
foreign func nativeRectDelete(ptr: Int64): Unit

public open class QRect {
    public let ptr: Int64
    public init(x: Int64, y: Int64, width: Int64, height: Int64) {
        ptr = unsafe {
            nativeRectCreate(Int32(x), Int32(y), Int32(width), Int32(height))
        }
    }
    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public open func delete() {
        return unsafe {
            nativeRectDelete(this.ptr)
        }
    }
}
