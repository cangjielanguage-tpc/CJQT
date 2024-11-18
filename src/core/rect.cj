package cjqt.core

//c
foreign func nativeRectCreate(x: Int32, y: Int32, width: Int32, height: Int32): Int64
foreign func nativeRectDelete(ptr: Int64): Unit
foreign func nativeRectWidth(ptr: Int64):Int32
foreign func nativeRectHeight(ptr: Int64):Int32
foreign func nativeRectX(ptr: Int64):Int32
foreign func nativeRectY(ptr: Int64):Int32

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
    public func width():Int32{
        return unsafe {
            nativeRectWidth(this.ptr)
        }
    }
    public func height():Int32{
        return unsafe {
            nativeRectHeight(this.ptr)
        }
    }
    public func x():Int32{
        return unsafe {
            nativeRectX(this.ptr)
        }
    }
    public func y():Int32{
        return unsafe {
            nativeRectY(this.ptr)
        }
    }
}
