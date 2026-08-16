package cjqt.core

foreign func nativeTimeCreate(hour: Int32, minute: Int32, second: Int32, msec: Int32): Int64
foreign func nativeTimeDelete(ptr: Int64): Unit
foreign func nativeTimeHour(ptr: Int64): Int32
foreign func nativeTimeMinute(ptr: Int64): Int32
foreign func nativeTimeSecond(ptr: Int64): Int32
foreign func nativeTimeMsec(ptr: Int64): Int32
foreign func nativeTimeIsValid(ptr: Int64): Bool
foreign func nativeTimeToString(ptr: Int64, format: CString): CString
foreign func nativeTimeCurrentTime(): Int64
foreign func nativeTimeAddSecs(ptr: Int64, secs: Int32): Int64

public class QTime {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(hour: Int64, minute: Int64, second: Int64, msec!: Int64 = 0) {
        this.ptr = unsafe {
            nativeTimeCreate(Int32(hour), Int32(minute), Int32(second), Int32(msec))
        }
    }

    public func delete(): Unit {
        unsafe {
            nativeTimeDelete(ptr)
        }
    }

    public func hour(): Int64 {
        return Int64(unsafe { nativeTimeHour(ptr) })
    }

    public func minute(): Int64 {
        return Int64(unsafe { nativeTimeMinute(ptr) })
    }

    public func second(): Int64 {
        return Int64(unsafe { nativeTimeSecond(ptr) })
    }

    public func msec(): Int64 {
        return Int64(unsafe { nativeTimeMsec(ptr) })
    }

    public func isValid(): Bool {
        return unsafe { nativeTimeIsValid(ptr) }
    }

    public func toString(format!: String = "HH:mm:ss"): String {
        return unsafe {
            let f = LibC.mallocCString(format)
            let r = nativeTimeToString(ptr, f)
            LibC.free(f)
            r.toString()
        }
    }

    public static func currentTime(): QTime {
        return QTime(unsafe { nativeTimeCurrentTime() })
    }

    public func addSecs(secs: Int64): QTime {
        return QTime(unsafe { nativeTimeAddSecs(ptr, Int32(secs)) })
    }
}
