/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package cjqt.qt.widgets

foreign func nativeGroupBoxCreate(parentPtr: Int64): Int64
foreign func nativeGroupBoxSetTitle(ptr: Int64, title: CString): Unit
foreign func nativeGroupBoxTitle(ptr: Int64): CString
foreign func nativeGroupBoxSetAlignment(ptr: Int64, alignment: Int32): Unit
foreign func nativeGroupBoxAlignment(ptr: Int64): Int32
foreign func nativeGroupBoxSetFlat(ptr: Int64, flat: Bool): Unit
foreign func nativeGroupBoxIsFlat(ptr: Int64): Bool
foreign func nativeGroupBoxSetCheckable(ptr: Int64, checkable: Bool): Unit
foreign func nativeGroupBoxIsCheckable(ptr: Int64): Bool
foreign func nativeGroupBoxSetChecked(ptr: Int64, checked: Bool): Unit
foreign func nativeGroupBoxIsChecked(ptr: Int64): Bool
foreign func nativeGroupBoxClickedConnect(ptr: Int64, code: Int64, callback: CFunc<(Int64, CPointer<Unit>) -> Unit>): Unit
foreign func nativeGroupBoxToggledConnect(ptr: Int64, code: Int64, callback: CFunc<(Int64, CPointer<Unit>) -> Unit>): Unit
foreign func nativeGroupBoxDelete(ptr: Int64): Unit

/**
 * The class is QGroupBox inherited from QWidget
 * @author wathinst
 */
public class QGroupBox <: QWidget {
    /** let member clicked type is QGroupBoxClickedSignal */
    public let clicked: QGroupBoxClickedSignal<Unit>
    /** let member toggled type is QGroupBoxToggledSignal */
    public let toggled: QGroupBoxToggledSignal<Unit>

    /**
     * The Function is init constructor
     *
     * @param parent of QWidget, and the Default value is QWidget(0)
     */
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeGroupBoxCreate(parent.ptr)
            }
        )
        clicked = QGroupBoxClickedSignal(ptr)
        toggled = QGroupBoxToggledSignal(ptr)
    }

    /**
     * The Function is setTitle
     *
     * @param title of String
     */
    public func setTitle(title: String) {
        unsafe {
            nativeGroupBoxSetTitle(ptr, LibC.mallocCString(title))
        }
    }

    /**
     * The Function is title
     *
     * @return Type of String
     */
    public func title(): String {
        let title = unsafe {
            nativeGroupBoxTitle(ptr)
        }
        return title.toString()
    }

    /**
     * The Function is setAlignment
     *
     * @param alignment of Int64
     */
    public func setAlignment(alignment: Int64) {
        unsafe {
            nativeGroupBoxSetAlignment(ptr, Int32(alignment))
        }
    }

    /**
     * The Function is alignment
     *
     * @return Type of Int64
     */
    public func alignment(): Int64 {
        let alignment = unsafe {
            nativeGroupBoxAlignment(ptr)
        }
        return Int64(alignment)
    }

    /**
     * The Function is setFlat
     *
     * @param flat of Bool
     */
    public func setFlat(flat: Bool) {
        unsafe {
            nativeGroupBoxSetFlat(ptr, flat)
        }
    }

    /**
     * The Function is isFlat
     *
     * @return Type of Bool
     */
    public func isFlat(): Bool {
        let flat = unsafe {
            nativeGroupBoxIsFlat(ptr)
        }
        return flat
    }

    /**
     * The Function is setCheckable
     *
     * @param checkable of Bool
     */
    public func setCheckable(checkable: Bool) {
        unsafe {
            nativeGroupBoxSetCheckable(ptr, checkable)
        }
    }

    /**
     * The Function is isCheckable
     *
     * @return Type of Bool
     */
    public func isCheckable(): Bool {
        let checkable = unsafe {
            nativeGroupBoxIsCheckable(ptr)
        }
        return checkable
    }

    /**
     * The Function is setChecked
     *
     * @param checked of Bool
     */
    public func setChecked(checked: Bool) {
        unsafe {
            nativeGroupBoxSetChecked(ptr, checked)
        }
    }

    /**
     * The Function is isChecked
     *
     * @return Type of Bool
     */
    public func isChecked(): Bool {
        let checked = unsafe {
            nativeGroupBoxIsChecked(ptr)
        }
        return checked
    }

    /**
     * The Function is delete
     *
     */
    public override func delete() {
        unsafe {
            nativeGroupBoxDelete(ptr)
        }
    }

}

/**
 * The class is QGroupBoxClickedSignal inherited from QWidgetSignal<T>
 * @author wathinst
 */
public class QGroupBoxClickedSignal<T> <: QWidgetSignal<T> {
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
    public override func nativeConnect(code: Int64, cb: CFunc<(Int64, CPointer<Unit>) -> Unit>){
        unsafe {
            nativeGroupBoxClickedConnect(ptr, code, cb)
        }
    }
}

/**
 * The class is QGroupBoxToggledSignal inherited from QWidgetSignal<T>
 * @author wathinst
 */
public class QGroupBoxToggledSignal<T> <: QWidgetSignal<T> {
    /*
     * The Function is init constructor
     *
     * @param ptr of Int64
     */
    init(ptr: Int64){
        super("toggled", ptr)
    }

    /**
     * The Function is nativeConnect
     *
     * @param code of Int64
     * @param cb of CFunc<(Int64)->Unit>
     */
    public override func nativeConnect(code: Int64, cb: CFunc<(Int64, CPointer<Unit>) -> Unit>){
        unsafe {
            nativeGroupBoxToggledConnect(ptr, code, cb)
        }
    }
}