package cjqt.core

foreign func nativeRandomGeneratorCreate(): Int64
foreign func nativeRandomGeneratorDelete(ptr: Int64): Unit
foreign func nativeRandomGeneratorBounded(ptr: Int64, highest: Int32): Int32
foreign func nativeRandomGeneratorGenerate(ptr: Int64): UInt32
foreign func nativeRandomGeneratorGlobalBounded(highest: Int32): Int32

public class QRandomGenerator {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe {
            nativeRandomGeneratorCreate()
        }
    }

    public func delete(): Unit {
        unsafe { nativeRandomGeneratorDelete(ptr) }
    }

    public func bounded(highest: Int64): Int64 {
        return Int64(unsafe {
            nativeRandomGeneratorBounded(ptr, Int32(highest))
        })
    }

    public func generate(): UInt32 {
        return unsafe {
            nativeRandomGeneratorGenerate(ptr)
        }
    }

    public static func globalBounded(highest: Int64): Int64 {
        return Int64(unsafe {
            nativeRandomGeneratorGlobalBounded(Int32(highest))
        })
    }
}
