/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package cjqt.qt.widgets

foreign func nativeRadioButtonCreate(parentPtr: Int64): Int64
foreign func nativeRadioButtonSetText(ptr: Int64, text: CString): Unit
foreign func nativeRadioButtonText(ptr: Int64): CString
foreign func nativeRadioButtonSetChecked(ptr: Int64, checked: Bool): Unit
foreign func nativeRadioButtonIsChecked(ptr: Int64): Bool
foreign func nativeRadioButtonDelete(ptr: Int64): Unit

/**
 * The class is QRadioButton inherited from QWidget
 * @author wathinst
 */
public class QRadioButton <: QWidget {
    /**
     * The Function is init constructor
     *
     * @param text of String, and the Default value is ""
     * @param parent of QWidget, and the Default value is QWidget(0)
     */
    public init(text!: String = "", parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeRadioButtonCreate(parent.ptr)
            }
        )
        if (!text.isEmpty()){
            setText(text)
        }
    }

    /**
     * The Function is setText
     *
     * @param text of String
     */
    public func setText(text: String) {
        unsafe {
            nativeRadioButtonSetText(ptr, LibC.mallocCString(text))
        }
    }

    /**
     * The Function is text
     *
     * @return Type of String
     */
    public func text(): String {
        let text = unsafe {
            nativeRadioButtonText(ptr)
        }
        return text.toString()
    }

    /**
     * The Function is setChecked
     *
     * @param checked of Bool
     */
    public func setChecked(checked: Bool) {
        unsafe {
            nativeRadioButtonSetChecked(ptr, checked)
        }
    }

    /**
     * The Function is isChecked
     *
     * @return Type of Bool
     */
    public func isChecked(): Bool {
        let checked = unsafe {
            nativeRadioButtonIsChecked(ptr)
        }
        return checked
    }

    /**
     * The Function is delete
     *
     */
    public override func delete() {
        unsafe {
            nativeRadioButtonDelete(ptr)
        }
    }
}
