/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package qt.widgets

foreign func nativePushButtonCreate(parentPtr: Int64): Int64
foreign func nativePushButtonSetText(ptr: Int64, text: CString): Unit
foreign func nativePushButtonSetStyleSheet(ptr: Int64, style: CString): Unit
foreign func nativePushButtonConnect(ptr: Int64, code: Int64, callback: CFunc<(Int64) -> Unit>): Unit
foreign func nativePushButtonDelete(ptr: Int64): Unit

/**
 * The class is QPushButton inherited from QWidget
 * @author wathinst
 */
public class QPushButton <: QWidget {

    /** let member clicked type is QPushButtonClickedSignal */
    public let clicked: QPushButtonClickedSignal 

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
        clicked = QPushButtonClickedSignal(ptr)
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
        clicked = QPushButtonClickedSignal(ptr)
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
        clicked = QPushButtonClickedSignal(ptr)
    }

    /**
     * The Function is setText
     *
     * @param text of String
     */
    public func setText(text: String) {
        unsafe {
            nativePushButtonSetText(ptr, CString(text))
        }
    }

    /**
     * The Function is setStyleSheet
     *
     * @param style of String
     */
    public func setStyleSheet(style: String) {
        unsafe {
            nativePushButtonSetStyleSheet(ptr, CString(style))
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
 * The class is QPushButtonClickedSignal inherited from QSignalUnit
 * @author wathinst
 */
public class QPushButtonClickedSignal <: QSignalUnit {
    /*
     * The Function is init constructor
     *
     * @param ptr of Int64
     */
    init(ptr: Int64){
        super("clicked", ptr)
    }

    /**
     * The Function is nativeConnect
     *
     * @param code of Int64
     * @param cb of CFunc<(Int64)->Unit>
     */
    public override func nativeConnect(code: Int64, cb: CFunc<(Int64) -> Unit>){
        unsafe {
            nativePushButtonConnect(ptr, code, cb)
        }
    }
}
