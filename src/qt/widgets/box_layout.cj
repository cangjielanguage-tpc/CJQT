/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package qt.widgets

foreign func nativeBoxLayoutCreate(parentPtr: Int64): Int64
foreign func nativeBoxLayoutAddWidget(ptr: Int64, widgetPtr: Int64): Unit
foreign func nativeBoxLayoutDelete(ptr: Int64): Unit

foreign func nativeBoxLayoutAddSpacing(ptr: Int64, spacing: Int32): Unit
foreign func nativeBoxLayoutAddStretch(ptr: Int64, stretch: Int32): Unit

/**
 * The class is QBoxLayout inherited from QLayout
 * @author wathinst
 */
public open class QBoxLayout <: QLayout {
    /**
     * The Function is init constructor
     *
     * @param parent of QWidget, and the Default value is QWidget()
     */
    public init(parent!: QWidget = QWidget()) {
        super(
            unsafe {
                nativeBoxLayoutCreate(parent.ptr)
            }
        )
    }

    /**
     * The Function is init constructor
     *
     * @param ptr of Int64
     */
    public init(ptr: Int64) {
        super(ptr)
    }

    /**
     * The Function is addWidget
     *
     * @param widget of QWidget
     */
    public func addWidget(widget: QWidget) {
        unsafe {
            nativeBoxLayoutAddWidget(ptr, widget.ptr)
        }
    }

    /**
     * The Function is delete
     *
     */
    public override open func delete() {
        unsafe {
            nativeBoxLayoutDelete(ptr)
        }
    }

    public func addSpacing(spacing: Int64) {
        unsafe {
            nativeBoxLayoutAddSpacing(ptr, Int32(spacing))
        }
    }

    public func addStretch(stretch: Int64) {
        unsafe {
            nativeBoxLayoutAddStretch(ptr, Int32(stretch))
        }
    }
}
