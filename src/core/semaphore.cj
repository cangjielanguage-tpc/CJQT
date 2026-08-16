package cjqt.core

foreign func nativeSemaphoreCreate(n: Int32): Int64
foreign func nativeSemaphoreDelete(ptr: Int64): Unit
foreign func nativeSemaphoreAcquire(ptr: Int64, n: Int32): Unit
foreign func nativeSemaphoreTryAcquire(ptr: Int64, n: Int32): Bool
foreign func nativeSemaphoreRelease(ptr: Int64, n: Int32): Unit
foreign func nativeSemaphoreAvailable(ptr: Int64): Int32

public class QSemaphore {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativeSemaphoreCreate(0) }
    }

    public static func withCount(n: Int64): QSemaphore {
        return QSemaphore(unsafe { nativeSemaphoreCreate(Int32(n)) })
    }

    public func delete(): Unit {
        unsafe { nativeSemaphoreDelete(ptr) }
    }

    public func acquire(n!: Int64 = 1): Unit {
        unsafe { nativeSemaphoreAcquire(ptr, Int32(n)) }
    }

    public func tryAcquire(n!: Int64 = 1): Bool {
        return unsafe { nativeSemaphoreTryAcquire(ptr, Int32(n)) }
    }

    public func release(n!: Int64 = 1): Unit {
        unsafe { nativeSemaphoreRelease(ptr, Int32(n)) }
    }

    public func available(): Int64 {
        return Int64(unsafe { nativeSemaphoreAvailable(ptr) })
    }
}
