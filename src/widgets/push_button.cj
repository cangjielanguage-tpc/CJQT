/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package cjqt.widgets

foreign func nativePushButtonCreate(parentPtr: Int64): Int64
foreign func nativePushButtonSetText(ptr: Int64, text: CString): Unit
foreign func nativePushButtonConnect(ptr: Int64, code: Int64, callback: CFunc<(Int64, CPointer<Unit>) -> Unit>): Unit
foreign func nativePushButtonDelete(ptr: Int64): Unit

/**
 * The class is QPushButton inherited from QWidget
 * @author wathinst
 */
public class QPushButton <: QWidget {
    /** let member clicked type is QPushButtonClickedSignal */

    public let clicked: QPushButtonClickedSignal<Unit>

    /**
     * The Function is init constructor
     *
     */
    public init() {
        super(
            unsafe {
                nativePushButtonCreate(0)
            }
        )
        clicked = QPushButtonClickedSignal<Unit>(ptr)
    }

    /**
     * The Function is init constructor
     *
     * @param text of String
     */
    public init(text: String) {
        super(
            unsafe {
                nativePushButtonCreate(0)
            }
        )
        clicked = QPushButtonClickedSignal<Unit>(ptr)
        setText(text)
    }

    /**
     * The Function is init constructor
     *
     * @param parent of QWidget
     */
    public init(parent: QWidget) {
        super(
            unsafe {
                nativePushButtonCreate(parent.ptr)
            }
        )
        clicked = QPushButtonClickedSignal<Unit>(ptr)
    }

    
    public init(ptr: Int64) {
        super(
            unsafe {
                nativePushButtonCreate(ptr)
            }
        )
        clicked = QPushButtonClickedSignal<Unit>(ptr)
    }

    /**
     * The Function is setText
     *
     * @param text of String
     */
    public func setText(text: String) {
        unsafe {
            nativePushButtonSetText(ptr, LibC.mallocCString(text))
        }
    }

    /**
     * The Function is delete
     *
     */
    public override func delete() {
        clicked.remove()
        unsafe {
            nativePushButtonDelete(ptr)
        }
    }
}

/**
 * The class is QPushButtonClickedSignal inherited from QWidgetSignal<T>
 * @author wathinst
 */
public class QPushButtonClickedSignal<T> <: QWidgetSignal<T> {
    /*
     * The Function is init constructor
     *
     * @param ptr of Int64
     */
    init(ptr: Int64) {
        super("clicked", ptr)
    }

    /**
     * The Function is nativeConnect
     *
     * @param code of Int64
     * @param cb of CFunc<(Int64,CPointer<Unit>)->Unit>
     */
    public override func nativeConnect(code: Int64, cb: CFunc<(Int64, CPointer<Unit>) -> Unit>) {
        unsafe {
            nativePushButtonConnect(ptr, code, cb)
        }
    }
}
