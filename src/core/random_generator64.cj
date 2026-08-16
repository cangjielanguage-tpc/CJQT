package cjqt.core

foreign func nativeRandomGenerator64Create(): Int64
foreign func nativeRandomGenerator64Delete(ptr: Int64): Unit
foreign func nativeRandomGenerator64Generate64(ptr: Int64): UInt64

public class QRandomGenerator64 {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativeRandomGenerator64Create() }
    }

    public func delete(): Unit {
        unsafe { nativeRandomGenerator64Delete(ptr) }
    }

    public func generate64(): UInt64 {
        return unsafe { nativeRandomGenerator64Generate64(ptr) }
    }

}
