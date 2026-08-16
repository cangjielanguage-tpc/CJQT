package cjqt.core

foreign func nativeMutexCreate(): Int64
foreign func nativeMutexDelete(ptr: Int64): Unit
foreign func nativeMutexLock(ptr: Int64): Unit
foreign func nativeMutexTryLock(ptr: Int64): Bool
foreign func nativeMutexUnlock(ptr: Int64): Unit

public class QMutex {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativeMutexCreate() }
    }

    public func delete(): Unit {
        unsafe { nativeMutexDelete(ptr) }
    }

    public func lock(): Unit {
        unsafe { nativeMutexLock(ptr) }
    }

    public func tryLock(): Bool {
        return unsafe { nativeMutexTryLock(ptr) }
    }

    public func unlock(): Unit {
        unsafe { nativeMutexUnlock(ptr) }
    }
}
