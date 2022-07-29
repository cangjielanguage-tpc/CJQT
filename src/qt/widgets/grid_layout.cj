package qt.widgets

// from std import ffi.c.CString

foreign func nativeGridLayoutCreate(parentPtr: Int64): Int64
foreign func nativeGridLayoutSetHorizontalSpacing(ptr: Int64, spacing: Int32): Unit
foreign func nativeGridLayoutSetVerticalSpacing(ptr: Int64, spacing: Int32): Unit
foreign func nativeGridLayoutSetAlignment(ptr: Int64): Unit
foreign func nativeGridLayoutAddWidget(ptr: Int64, widgetPtr: Int64): Unit
foreign func nativeGridLayoutAddWidgetWithNum(ptr: Int64, widgetPtr: Int64, row: Int32, column: Int32): Unit
foreign func nativeGridLayoutAddWidgetWithNumAndSpan(
    ptr: Int64,
    widgetPtr: Int64,
    row: Int32,
    column: Int32,
    rowSpan: Int32,
    columnSpan: Int32
): Unit
foreign func nativeGridLayoutDelete(ptr: Int64): Unit

public class QGridLayout <: QLayout {
    public init() {
        super(
            unsafe {
                nativeGridLayoutCreate(0)
            }
        )
    }

    public init(parent: QWidget) {
        super(
            unsafe {
                nativeGridLayoutCreate(parent.ptr)
            }
        )
    }

    public func setHorizontalSpacing(spacing: Int64) {
        unsafe {
            nativeGridLayoutSetHorizontalSpacing(ptr, Int32(spacing))
        }
    }

    public func setVerticalSpacing(spacing: Int64) {
        unsafe {
            nativeGridLayoutSetVerticalSpacing(ptr, Int32(spacing))
        }
    }

    public func setAlignment() {
        unsafe {
            nativeGridLayoutSetAlignment(ptr)
        }
    }

    public func addWidget(widget: QWidget) {
        unsafe {
            nativeGridLayoutAddWidget(ptr, widget.ptr)
        }
    }

    public func addWidget(widget: QWidget, row: Int64, column: Int64) {
        unsafe {
            nativeGridLayoutAddWidgetWithNum(ptr, widget.ptr, Int32(row), Int32(column))
        }
    }

    public func addWidget(widget: QWidget, row: Int64, column: Int64, rowSpan: Int64, columnSpan: Int64) {
        unsafe {
            nativeGridLayoutAddWidgetWithNumAndSpan(ptr, widget.ptr, Int32(row), Int32(column), Int32(rowSpan),
                Int32(columnSpan))
        }
    }

    public override func delete() {
        unsafe {
            nativeGridLayoutDelete(ptr)
        }
    }
}
