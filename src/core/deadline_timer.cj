package cjqt.core

foreign func nativeDeadlineTimerCreate(timeout: Int64): Int64
foreign func nativeDeadlineTimerCreateForever(): Int64
foreign func nativeDeadlineTimerDelete(ptr: Int64): Unit
foreign func nativeDeadlineTimerRemainingTime(ptr: Int64): Int64
foreign func nativeDeadlineTimerHasExpired(ptr: Int64): Bool
foreign func nativeDeadlineTimerIsForever(ptr: Int64): Bool
foreign func nativeDeadlineTimerSetRemainingTime(ptr: Int64, msecs: Int64): Unit

public class QDeadlineTimer {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe {
            nativeDeadlineTimerCreate(0)
        }
    }

    public static func withTimeout(timeout: Int64): QDeadlineTimer {
        return QDeadlineTimer(unsafe { nativeDeadlineTimerCreate(timeout) })
    }

    public static func forever(): QDeadlineTimer {
        return QDeadlineTimer(unsafe { nativeDeadlineTimerCreateForever() })
    }

    public func delete(): Unit {
        unsafe { nativeDeadlineTimerDelete(ptr) }
    }

    public func remainingTime(): Int64 {
        return unsafe { nativeDeadlineTimerRemainingTime(ptr) }
    }

    public func hasExpired(): Bool {
        return unsafe { nativeDeadlineTimerHasExpired(ptr) }
    }

    public func isForever(): Bool {
        return unsafe { nativeDeadlineTimerIsForever(ptr) }
    }

    public func setRemainingTime(msecs: Int64): Unit {
        unsafe { nativeDeadlineTimerSetRemainingTime(ptr, msecs) }
    }
}
