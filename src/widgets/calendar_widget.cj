package cjqt.widgets

import cjqt.core.*

foreign func nativeCalendarWidgetCreate(parentPtr: Int64): Int64
foreign func nativeCalendarWidgetDelete(ptr: Int64): Unit
foreign func nativeCalendarWidgetSelectedDate(ptr: Int64): Int64
foreign func nativeCalendarWidgetSetSelectedDate(ptr: Int64, year: Int32, month: Int32, day: Int32): Unit
foreign func nativeCalendarWidgetYearShown(ptr: Int64): Int32
foreign func nativeCalendarWidgetMonthShown(ptr: Int64): Int32

public class QCalendarWidget <: QWidget {
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeCalendarWidgetCreate(parent.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeCalendarWidgetDelete(ptr)
        }
    }

    public func selectedDate(): QDate {
        return QDate(unsafe { nativeCalendarWidgetSelectedDate(ptr) })
    }

    public func setSelectedDate(date: QDate) {
        unsafe {
            nativeCalendarWidgetSetSelectedDate(ptr, Int32(date.year()), Int32(date.month()), Int32(date.day()))
        }
    }

    public func yearShown(): Int64 {
        return Int64(unsafe { nativeCalendarWidgetYearShown(ptr) })
    }

    public func monthShown(): Int64 {
        return Int64(unsafe { nativeCalendarWidgetMonthShown(ptr) })
    }
}
