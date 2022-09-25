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
 * Qt动作类
 * @author wathinst
 */
public class QAction {
    /** QAction类对象指针 */
    public let ptr: Int64

    /** 动作触发信号 */
    public let triggered: QActionTriggeredSignal<Bool>

    /**
     * 默认构造函数
     *
     */
    public init() {
        ptr = unsafe {
            nativeActionCreate(0)
        }
        triggered = QActionTriggeredSignal<Bool>(ptr)
    }

    /**
     * 默认构造函数
     *
     * @param parent QWidget父类
     */
    public init(parent: QWidget) {
        ptr = unsafe {
            nativeActionCreate(parent.ptr)
        }
        triggered = QActionTriggeredSignal<Bool>(ptr)
    }

    /*
     * 默认构造函数
     *
     * @param ptr QAction类对象指针
     */
    init(ptr: Int64) {
        this.ptr = ptr
        triggered = QActionTriggeredSignal<Bool>(ptr)
    }

    /**
     * 设置状态提示
     *
     * @param tip 提示文本
     */
    public func setStatusTip(tip: String) {
        unsafe {
            nativeActionSetStatusTip(ptr, CString(tip))
        }
    }

    /**
     * 设置动作文本
     *
     * @param text 文本
     */
    public func setText(text: String) {
        unsafe {
            nativeActionSetText(ptr, CString(text))
        }
    }

    /**
     * 获取动作文本
     *
     * @return 文本
     */
    public func text(): String {
        let result = unsafe {
            nativeActionText(ptr)
        }
        return result.toString()
    }

    /**
     * 设置动作图标
     *
     * @param icon 图标
     */
    public func setIcon(icon: QIcon) {
        unsafe {
            nativeActionSetIcon(ptr, icon.ptr)
        }
    }

    /**
     * 获取动作动作
     *
     * @return 图标
     */
    public func icon(): QIcon {
        let iconPtr = unsafe {
            nativeActionIcon(ptr)
        }
        return QIcon(iconPtr)
    }

    /**
     * 设置可检测的
     *
     * @param checkable 是否可检测
     */
    public func setCheckable(checkable: Bool) {
        unsafe {
            nativeActionSetCheckable(ptr, checkable)
        }
    }

    /**
     * 获取可检测的状态
     *
     * @return 是否可检测
     */
    public func isCheckable(): Bool {
        let checkable = unsafe {
            nativeActionIsCheckable(ptr)
        }
        return checkable
    }

    /**
     * 设置选中状态
     *
     * @param checked 是否选中
     */
    public func setChecked(checked: Bool) {
        unsafe {
            nativeActionSetChecked(ptr, checked)
        }
    }

    /**
     * 获取选中状态
     *
     * @return 是否选中
     */
    public func isChecked(): Bool {
        let checked = unsafe {
            nativeActionIsChecked(ptr)
        }
        return checked
    }

    /**
     * 释放内存
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
 * 动作触发的信号类
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
