package cjqt.core

foreign func nativeTimeLineCreate(duration: Int32): Int64
foreign func nativeTimeLineDelete(ptr: Int64): Unit
foreign func nativeTimeLineStart(ptr: Int64): Unit
foreign func nativeTimeLineStop(ptr: Int64): Unit
foreign func nativeTimeLineSetDuration(ptr: Int64, duration: Int32): Unit
foreign func nativeTimeLineDuration(ptr: Int64): Int32
foreign func nativeTimeLineCurrentTime(ptr: Int64): Int32
foreign func nativeTimeLineCurrentValue(ptr: Int64): Float64
foreign func nativeTimeLineState(ptr: Int64): Int32
foreign func nativeTimeLineSetLoopCount(ptr: Int64, count: Int32): Unit

public enum QTimeLineState {
    | NotRunning
    | Paused
    | Running

    public func value(): Int32 {
        return match (this) {
            case NotRunning => 0
            case Paused => 1
            case Running => 2
        }
    }
}

public class QTimeLine {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativeTimeLineCreate(0) }
    }

    public static func withDuration(duration: Int64): QTimeLine {
        return QTimeLine(unsafe { nativeTimeLineCreate(Int32(duration)) })
    }

    public func delete(): Unit {
        unsafe { nativeTimeLineDelete(ptr) }
    }

    public func start() {
        unsafe { nativeTimeLineStart(ptr) }
    }

    public func stop() {
        unsafe { nativeTimeLineStop(ptr) }
    }

    public func setDuration(duration: Int64) {
        unsafe { nativeTimeLineSetDuration(ptr, Int32(duration)) }
    }

    public func duration(): Int64 {
        return Int64(unsafe { nativeTimeLineDuration(ptr) })
    }

    public func currentTime(): Int64 {
        return Int64(unsafe { nativeTimeLineCurrentTime(ptr) })
    }

    public func currentValue(): Float64 {
        return unsafe { nativeTimeLineCurrentValue(ptr) }
    }

    public func state(): QTimeLineState {
        let s = unsafe { nativeTimeLineState(ptr) }
        return match (s) {
            case 0 => QTimeLineState.NotRunning
            case 1 => QTimeLineState.Paused
            case _ => QTimeLineState.Running
        }
    }

    public func setLoopCount(count: Int64) {
        unsafe { nativeTimeLineSetLoopCount(ptr, Int32(count)) }
    }
}
