package qt.core

//C
foreign func nativeSizeCreate(): Int64
foreign func nativeSizeCreateWithWidth(width: Int32, height: Int32): Int64
foreign func nativeSizeDelete(ptr: Int64): Unit

public open class QSize {
    public let ptr: Int64
    public init() {
        this.ptr = unsafe {
            nativeSizeCreate()
        }
    }
    public init(ptr: Int64) {
        this.ptr = ptr
    }
    public init(width: Int64, height: Int64) {
        this.ptr = unsafe {
            nativeSizeCreateWithWidth(Int32(width), Int32(height))
        }
    }
    public func delete(): Unit {
        unsafe {
            nativeSizeDelete(this.ptr)
        }
    }
}
