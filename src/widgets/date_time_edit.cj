package cjqt.widgets

import cjqt.core.*

foreign func nativeDateTimeEditCreate(parentPtr: Int64): Int64
foreign func nativeDateTimeEditDelete(ptr: Int64): Unit
foreign func nativeDateTimeEditDateTime(ptr: Int64): Int64
foreign func nativeDateTimeEditSetDateTime(ptr: Int64, y: Int32, mo: Int32, d: Int32, h: Int32, mi: Int32, s: Int32): Unit
foreign func nativeDateTimeEditSetDisplayFormat(ptr: Int64, format: CString): Unit

public class QDateTimeEdit <: QWidget {
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeDateTimeEditCreate(parent.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeDateTimeEditDelete(ptr)
        }
    }

    public func dateTime(): QDateTime {
        return QDateTime(unsafe { nativeDateTimeEditDateTime(ptr) })
    }

    public func setDateTime(dt: QDateTime) {
        let d = dt.date()
        let t = dt.time()
        unsafe {
            nativeDateTimeEditSetDateTime(ptr, Int32(d.year()), Int32(d.month()), Int32(d.day()), Int32(t.hour()),
                Int32(t.minute()), Int32(t.second()))
        }
        d.delete()
        t.delete()
    }

    public func setDisplayFormat(format: String) {
        unsafe {
            let f = LibC.mallocCString(format)
            nativeDateTimeEditSetDisplayFormat(ptr, f)
            LibC.free(f)
        }
    }
}
