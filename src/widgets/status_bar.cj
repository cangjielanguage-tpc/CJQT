/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package cjqt.widgets

foreign func nativeStatusBarCreate(parentPtr: Int64): Int64
foreign func nativeStatusBarDelete(ptr: Int64): Unit

foreign func nativeStatusBarAddWidget(ptr: Int64, widgetPtr: Int64, stretch: Int32): Unit
foreign func nativeStatusBarInsertWidget(ptr: Int64, index: Int32, widgetPtr: Int64, stretch: Int32): Unit
foreign func nativeStatusBarAddPermanentWidget(ptr: Int64, widgetPtr: Int64, stretch: Int32): Unit
foreign func nativeStatusBarInsertPermanentWidget(ptr: Int64, index: Int32, widgetPtr: Int64, stretch: Int32): Unit
foreign func nativeStatusBarRemoveWidget(ptr: Int64, widgetPtr: Int64): Unit

foreign func nativeStatusBarCurrentMessage(ptr: Int64): CString
foreign func nativeStatusBarShowMessage(ptr: Int64, message: CString, timeout: Int32): Unit
foreign func nativeStatusBarClearMessage(ptr: Int64): Unit

/**
 * The class is QStatusBar inherited from QWidget
 * @author wathinst
 */
public class QStatusBar <: QWidget {
    /**
     * The Function is init constructor
     *
     * @param parent of QWidget, and the Default value is QWidget(0)
     */
    public init(parent!: QWidget = QWidget(0)) {
        super(unsafe {
            nativeStatusBarCreate(parent.ptr)
        })
    }

    /**
     * The Function is delete
     *
     */
    public override func delete() {
        unsafe {
            nativeStatusBarDelete(ptr)
        }
    }

    /**
     * The Function is addWidget
     *
     * @param widget of QWidget
     * @param stretch of Int64, and the Default value is 0
     */
    public func addWidget(widget: QWidget, stretch!: Int64 = 0) {
        unsafe {
            nativeStatusBarAddWidget(ptr, widget.ptr, Int32(stretch))
        }
    }

    /**
     * The Function is insertWidget
     *
     * @param index of Int64
     * @param widget of QWidget
     * @param stretch of Int64, and the Default value is 0
     */
    public func insertWidget(index: Int64, widget: QWidget, stretch!: Int64 = 0) {
        unsafe {
            nativeStatusBarInsertWidget(ptr, Int32(index), widget.ptr, Int32(stretch))
        }
    }

    /**
     * The Function is addPermanentWidget
     *
     * @param widget of QWidget
     * @param stretch of Int64, and the Default value is 0
     */
    public func addPermanentWidget(widget: QWidget, stretch!: Int64 = 0) {
        unsafe {
            nativeStatusBarAddPermanentWidget(ptr, widget.ptr, Int32(stretch))
        }
    }

    /**
     * The Function is insertPermanentWidget
     *
     * @param index of Int64
     * @param widget of QWidget
     * @param stretch of Int64, and the Default value is 0
     */
    public func insertPermanentWidget(index: Int64, widget: QWidget, stretch!: Int64 = 0) {
        unsafe {
            nativeStatusBarInsertPermanentWidget(ptr, Int32(index), widget.ptr, Int32(stretch))
        }
    }

    /**
     * The Function is removeWidget
     *
     * @param widget of QWidget
     */
    public func removeWidget(widget: QWidget) {
        unsafe {
            nativeStatusBarRemoveWidget(ptr, widget.ptr)
        }
    }

    /**
     * The Function is currentMessage
     *
     * @return Type of String
     */
    public func currentMessage(): String {
        let result = unsafe {
            nativeStatusBarCurrentMessage(ptr)
        }
        return result.toString()
    }

    /**
     * The Function is showMessage
     *
     * @param message of String
     * @param timeout of Int64, and the Default value is 0
     */
    public func showMessage(message: String, timeout!: Int64 = 0) {
        unsafe {
            nativeStatusBarShowMessage(ptr, LibC.mallocCString(message), Int32(timeout))
        }
    }

    /**
     * The Function is clearMessage
     *
     */
    public func clearMessage() {
        unsafe {
            nativeStatusBarClearMessage(ptr)
        }
    }
}