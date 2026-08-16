package cjqt.core

foreign func nativeDateCreate(year: Int32, month: Int32, day: Int32): Int64
foreign func nativeDateDelete(ptr: Int64): Unit
foreign func nativeDateYear(ptr: Int64): Int32
foreign func nativeDateMonth(ptr: Int64): Int32
foreign func nativeDateDay(ptr: Int64): Int32
foreign func nativeDateDayOfWeek(ptr: Int64): Int32
foreign func nativeDateIsValid(ptr: Int64): Bool
foreign func nativeDateToString(ptr: Int64, format: CString): CString
foreign func nativeDateCurrentDate(): Int64
foreign func nativeDateAddDays(ptr: Int64, days: Int64): Int64
foreign func nativeDateDaysTo(ptr: Int64, otherPtr: Int64): Int64

public class QDate {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(year: Int64, month: Int64, day: Int64) {
        this.ptr = unsafe {
            nativeDateCreate(Int32(year), Int32(month), Int32(day))
        }
    }

    public func delete(): Unit {
        unsafe {
            nativeDateDelete(ptr)
        }
    }

    public func year(): Int64 {
        return Int64(unsafe { nativeDateYear(ptr) })
    }

    public func month(): Int64 {
        return Int64(unsafe { nativeDateMonth(ptr) })
    }

    public func day(): Int64 {
        return Int64(unsafe { nativeDateDay(ptr) })
    }

    public func dayOfWeek(): Int64 {
        return Int64(unsafe { nativeDateDayOfWeek(ptr) })
    }

    public func isValid(): Bool {
        return unsafe { nativeDateIsValid(ptr) }
    }

    public func toString(format!: String = "yyyy-MM-dd"): String {
        return unsafe {
            let f = LibC.mallocCString(format)
            let r = nativeDateToString(ptr, f)
            LibC.free(f)
            r.toString()
        }
    }

    public static func currentDate(): QDate {
        return QDate(unsafe { nativeDateCurrentDate() })
    }

    public func addDays(days: Int64): QDate {
        return QDate(unsafe { nativeDateAddDays(ptr, days) })
    }

    public func daysTo(other: QDate): Int64 {
        return unsafe { nativeDateDaysTo(ptr, other.ptr) }
    }
}
