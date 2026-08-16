package cjqt.core

foreign func nativeElapsedTimerCreate(): Int64
foreign func nativeElapsedTimerDelete(ptr: Int64): Unit
foreign func nativeElapsedTimerStart(ptr: Int64): Unit
foreign func nativeElapsedTimerRestart(ptr: Int64): Int64
foreign func nativeElapsedTimerElapsed(ptr: Int64): Int64
foreign func nativeElapsedTimerIsValid(ptr: Int64): Bool
foreign func nativeElapsedTimerHasExpired(ptr: Int64, timeout: Int64): Bool

public class QElapsedTimer {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe {
            nativeElapsedTimerCreate()
        }
    }

    public func delete(): Unit {
        unsafe {
            nativeElapsedTimerDelete(ptr)
        }
    }

    public func start(): Unit {
        unsafe {
            nativeElapsedTimerStart(ptr)
        }
    }

    public func restart(): Int64 {
        return unsafe {
            nativeElapsedTimerRestart(ptr)
        }
    }

    public func elapsed(): Int64 {
        return unsafe {
            nativeElapsedTimerElapsed(ptr)
        }
    }

    public func isValid(): Bool {
        return unsafe {
            nativeElapsedTimerIsValid(ptr)
        }
    }

    public func hasExpired(timeout: Int64): Bool {
        return unsafe {
            nativeElapsedTimerHasExpired(ptr, timeout)
        }
    }
}
