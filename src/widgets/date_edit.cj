package cjqt.widgets

import cjqt.core.*

foreign func nativeDateEditCreate(parentPtr: Int64): Int64
foreign func nativeDateEditDelete(ptr: Int64): Unit
foreign func nativeDateEditDate(ptr: Int64): Int64
foreign func nativeDateEditSetDate(ptr: Int64, year: Int32, month: Int32, day: Int32): Unit
foreign func nativeDateEditSetDateRange(ptr: Int64, y1: Int32, m1: Int32, d1: Int32, y2: Int32, m2: Int32, d2: Int32): Unit
foreign func nativeDateEditSetDisplayFormat(ptr: Int64, format: CString): Unit

public class QDateEdit <: QWidget {
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeDateEditCreate(parent.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeDateEditDelete(ptr)
        }
    }

    public func date(): QDate {
        return QDate(unsafe { nativeDateEditDate(ptr) })
    }

    public func setDate(date: QDate) {
        unsafe {
            nativeDateEditSetDate(ptr, Int32(date.year()), Int32(date.month()), Int32(date.day()))
        }
    }

    public func setDateRange(from: QDate, to: QDate) {
        unsafe {
            nativeDateEditSetDateRange(ptr, Int32(from.year()), Int32(from.month()), Int32(from.day()), Int32(to.year()),
                Int32(to.month()), Int32(to.day()))
        }
    }

    public func setDisplayFormat(format: String) {
        unsafe {
            let f = LibC.mallocCString(format)
            nativeDateEditSetDisplayFormat(ptr, f)
            LibC.free(f)
        }
    }
}
