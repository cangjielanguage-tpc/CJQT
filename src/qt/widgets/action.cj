/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package qt.widgets

foreign func nativeActionCreate(parentPtr: Int64): Int64
foreign func nativeActionSetStatusTip(ptr: Int64, tip: CString): Unit
foreign func nativeActionSetText(ptr: Int64, text: CString): Unit
foreign func nativeActionText(ptr: Int64): CString
foreign func nativeActionSetIcon(ptr: Int64, iconPtr: Int64): Unit
foreign func nativeActionIcon(ptr: Int64): Int64
foreign func nativeActionSetCheckable(ptr: Int64, checkable: Bool): Unit
foreign func nativeActionIsCheckable(ptr: Int64): Bool
foreign func nativeActionSetChecked(ptr: Int64, checked: Bool): Unit
foreign func nativeActionIsChecked(ptr: Int64): Bool
foreign func nativeActionConnectTriggered(ptr: Int64, code: Int64, callback: CFunc<(Int64, CPointer<Unit>) -> Unit>): Unit
foreign func nativeActionDelete(ptr: Int64): Unit

/**
 * The class is QAction
 * @author wathinst
 */
public class QAction {
    /** let member ptr type is Int64 */
    public let ptr: Int64

    /** let member triggered type is QActionTriggeredSignal */
    public let triggered: QActionTriggeredSignal<Bool>

    /**
     * The Function is init constructor
     *
     */
    public init() {
        ptr = unsafe {
            nativeActionCreate(0)
        }
        triggered = QActionTriggeredSignal<Bool>(ptr)
    }

    /**
     * The Function is init constructor
     *
     * @param parent of QWidget
     */
    public init(parent: QWidget) {
        ptr = unsafe {
            nativeActionCreate(parent.ptr)
        }
        triggered = QActionTriggeredSignal<Bool>(ptr)
    }

    /*
     * The Function is init constructor
     *
     * @param ptr of Int64
     */
    init(ptr: Int64) {
        this.ptr = ptr
        triggered = QActionTriggeredSignal<Bool>(ptr)
    }

    /**
     * The Function is setStatusTip
     *
     * @param tip of String
     */
    public func setStatusTip(tip: String) {
        unsafe {
            nativeActionSetStatusTip(ptr, CString(tip))
        }
    }

    /**
     * The Function is setText
     *
     * @param text of String
     */
    public func setText(text: String) {
        unsafe {
            nativeActionSetText(ptr, CString(text))
        }
    }

    /**
     * The Function is text
     *
     * @return Type of String
     */
    public func text(): String {
        let result = unsafe {
            nativeActionText(ptr)
        }
        return result.toString()
    }

    /**
     * The Function is setIcon
     *
     * @param icon of QIcon
     */
    public func setIcon(icon: QIcon) {
        unsafe {
            nativeActionSetIcon(ptr, icon.ptr)
        }
    }

    /**
     * The Function is icon
     *
     * @return Type of QIcon
     */
    public func icon(): QIcon {
        let iconPtr = unsafe {
            nativeActionIcon(ptr)
        }
        return QIcon(iconPtr)
    }

    /**
     * The Function is setCheckable
     *
     * @param checkable of Bool
     */
    public func setCheckable(checkable: Bool) {
        unsafe {
            nativeActionSetCheckable(ptr, checkable)
        }
    }

    /**
     * The Function is isCheckable
     *
     * @return Type of Bool
     */
    public func isCheckable(): Bool {
        let checkable = unsafe {
            nativeActionIsCheckable(ptr)
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
            nativeActionSetChecked(ptr, checked)
        }
    }

    /**
     * The Function is isChecked
     *
     * @return Type of Bool
     */
    public func isChecked(): Bool {
        let checked = unsafe {
            nativeActionIsChecked(ptr)
        }
        return checked
    }

    /**
     * The Function is delete
     *
     */
    public func delete() {
        triggered.remove()
        unsafe {
            nativeActionDelete(ptr)
        }
    }
}

/**
 * The class is QActionTriggeredSignal inherited from QWidgetSignal<T>
 * @author wathinst
 */
public class QActionTriggeredSignal<T> <: QWidgetSignal<T> {
    /*
     * The Function is init constructor
     *
     * @param ptr of Int64
     */
    init(ptr: Int64) {
        super("triggered", ptr)
    }

    /**
     * The Function is nativeConnect
     *
     * @param code of Int64
     * @param cb of CFunc<(Int64,CPointer<Unit>)->Unit>
     */
    public override func nativeConnect(code: Int64, cb: CFunc<(Int64, CPointer<Unit>) -> Unit>) {
        unsafe {
            nativeActionConnectTriggered(ptr, code, cb)
        }
    }
}
