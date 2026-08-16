package cjqt.core

foreign func nativeDateTimeCreate(year: Int32, month: Int32, day: Int32, hour: Int32, minute: Int32, second: Int32, msec: Int32): Int64
foreign func nativeDateTimeDelete(ptr: Int64): Unit
foreign func nativeDateTimeIsValid(ptr: Int64): Bool
foreign func nativeDateTimeToString(ptr: Int64, format: CString): CString
foreign func nativeDateTimeCurrentDateTime(): Int64
foreign func nativeDateTimeDate(ptr: Int64): Int64
foreign func nativeDateTimeTime(ptr: Int64): Int64
foreign func nativeDateTimeAddDays(ptr: Int64, days: Int64): Int64

public class QDateTime {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(year: Int64, month: Int64, day: Int64, hour: Int64, minute: Int64, second: Int64, msec: Int64) {
        this.ptr = unsafe {
            nativeDateTimeCreate(Int32(year), Int32(month), Int32(day), Int32(hour), Int32(minute), Int32(second),
                Int32(msec))
        }
    }

    public func delete(): Unit {
        unsafe {
            nativeDateTimeDelete(ptr)
        }
    }

    public func isValid(): Bool {
        return unsafe { nativeDateTimeIsValid(ptr) }
    }

    public func toString(format!: String = "yyyy-MM-dd HH:mm:ss"): String {
        return unsafe {
            let f = LibC.mallocCString(format)
            let r = nativeDateTimeToString(ptr, f)
            LibC.free(f)
            r.toString()
        }
    }

    public static func currentDateTime(): QDateTime {
        return QDateTime(unsafe { nativeDateTimeCurrentDateTime() })
    }

    public func date(): QDate {
        return QDate(unsafe { nativeDateTimeDate(ptr) })
    }

    public func time(): QTime {
        return QTime(unsafe { nativeDateTimeTime(ptr) })
    }

    public func addDays(days: Int64): QDateTime {
        return QDateTime(unsafe { nativeDateTimeAddDays(ptr, days) })
    }
}
