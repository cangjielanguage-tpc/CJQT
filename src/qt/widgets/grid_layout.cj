/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package qt.widgets

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

/**
 * The class is QGridLayout inherited from QLayout
 * @author wathinst
 */
public class QGridLayout <: QLayout {
    /**
     * The Function is init constructor
     *
     */
    public init() {
        super(
            unsafe {
                nativeGridLayoutCreate(0)
            }
        )
    }

    /**
     * The Function is init constructor
     *
     * @param parent of QWidget
     */
    public init(parent: QWidget) {
        super(
            unsafe {
                nativeGridLayoutCreate(parent.ptr)
            }
        )
    }

    /**
     * The Function is setHorizontalSpacing
     *
     * @param spacing of Int64
     */
    public func setHorizontalSpacing(spacing: Int64) {
        unsafe {
            nativeGridLayoutSetHorizontalSpacing(ptr, Int32(spacing))
        }
    }

    /**
     * The Function is setVerticalSpacing
     *
     * @param spacing of Int64
     */
    public func setVerticalSpacing(spacing: Int64) {
        unsafe {
            nativeGridLayoutSetVerticalSpacing(ptr, Int32(spacing))
        }
    }

    /**
     * The Function is setAlignment
     *
     */
    public func setAlignment() {
        unsafe {
            nativeGridLayoutSetAlignment(ptr)
        }
    }

    /**
     * The Function is addWidget
     *
     * @param widget of QWidget
     */
    public func addWidget(widget: QWidget) {
        unsafe {
            nativeGridLayoutAddWidget(ptr, widget.ptr)
        }
    }

    /**
     * The Function is addWidget
     *
     * @param widget of QWidget
     * @param row of Int64
     * @param column of Int64
     */
    public func addWidget(widget: QWidget, row: Int64, column: Int64) {
        unsafe {
            nativeGridLayoutAddWidgetWithNum(ptr, widget.ptr, Int32(row), Int32(column))
        }
    }

    /**
     * The Function is addWidget
     *
     * @param widget of QWidget
     * @param row of Int64
     * @param column of Int64
     * @param rowSpan of Int64
     * @param columnSpan of Int64
     */
    public func addWidget(widget: QWidget, row: Int64, column: Int64, rowSpan: Int64, columnSpan: Int64) {
        unsafe {
            nativeGridLayoutAddWidgetWithNumAndSpan(ptr, widget.ptr, Int32(row), Int32(column), Int32(rowSpan),
                Int32(columnSpan))
        }
    }

    /**
     * The Function is delete
     *
     */
    public override func delete() {
        unsafe {
            nativeGridLayoutDelete(ptr)
        }
    }
}
