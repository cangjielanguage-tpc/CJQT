package cjqt.widgets

import cjqt.core.*

foreign func nativeTimeEditCreate(parentPtr: Int64): Int64
foreign func nativeTimeEditDelete(ptr: Int64): Unit
foreign func nativeTimeEditHour(ptr: Int64): Int32
foreign func nativeTimeEditMinute(ptr: Int64): Int32
foreign func nativeTimeEditSecond(ptr: Int64): Int32
foreign func nativeTimeEditSetTime(ptr: Int64, hour: Int32, minute: Int32, second: Int32): Unit
foreign func nativeTimeEditSetTimeRange(ptr: Int64, h1: Int32, m1: Int32, h2: Int32, m2: Int32): Unit
foreign func nativeTimeEditSetDisplayFormat(ptr: Int64, format: CString): Unit

public class QTimeEdit <: QWidget {
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeTimeEditCreate(parent.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeTimeEditDelete(ptr)
        }
    }

    public func time(): QTime {
        let h = unsafe { nativeTimeEditHour(ptr) }
        let m = unsafe { nativeTimeEditMinute(ptr) }
        let s = unsafe { nativeTimeEditSecond(ptr) }
        return QTime(Int64(h), Int64(m), Int64(s))
    }

    public func setTime(time: QTime) {
        unsafe {
            nativeTimeEditSetTime(ptr, Int32(time.hour()), Int32(time.minute()), Int32(time.second()))
        }
    }

    public func setTimeRange(from: QTime, to: QTime) {
        unsafe {
            nativeTimeEditSetTimeRange(ptr, Int32(from.hour()), Int32(from.minute()), Int32(to.hour()), Int32(to.minute()))
        }
    }

    public func setDisplayFormat(format: String) {
        unsafe {
            let f = LibC.mallocCString(format)
            nativeTimeEditSetDisplayFormat(ptr, f)
            LibC.free(f)
        }
    }
}
