/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package qt.gui

foreign func nativeIconCreate(): Int64
foreign func nativeIconCreateWithFileName(fileName: CString): Int64
foreign func nativeIconCreateWithOtherIcon(ptr: Int64): Int64
foreign func nativeIconGetName(ptr: Int64): CString
foreign func nativeIconIsNull(ptr: Int64): Bool
foreign func nativeIconIsMask(ptr: Int64): Bool
foreign func nativeIconIsDetached(ptr: Int64): Bool
foreign func nativeIconDetach(ptr: Int64): Unit
foreign func nativeIconDelete(ptr: Int64): Unit

/**
 * The class is QIcon
 * @author wathinst
 */
public class QIcon {
    /** let member ptr type is Int64 */
    public let ptr: Int64

    /**
     * The Function is init constructor
     *
     */
    public init() {
        ptr = unsafe {
            nativeIconCreate()
        }
    }

    /**
     * The Function is init constructor
     *
     * @param fileName of String
     */
    public init(fileName: String) {
        ptr = unsafe {
            nativeIconCreateWithFileName(CString(fileName))
        }
    }

    /**
     * The Function is init constructor
     *
     * @param icon of QIcon
     */
    public init(icon: QIcon) {
        ptr = unsafe {
            nativeIconCreateWithOtherIcon(icon.ptr)
        }
    }

    /**
     * The Function is init constructor
     *
     * @param ptr of Int64
     */
    public init(ptr: Int64) {
        this.ptr = ptr
    }

    /**
     * The Function is name
     *
     * @return Type of String
     */
    public func name(): String {
        let result = unsafe {
            nativeIconGetName(ptr)
        }
        return result.toString()
    }

    /**
     * The Function is isNull
     *
     * @return Type of Bool
     */
    public func isNull(): Bool {
        let result = unsafe {
            nativeIconIsNull(ptr)
        }
        return result
    }

    /**
     * The Function is isMask
     *
     * @return Type of Bool
     */
    public func isMask(): Bool {
        let result = unsafe {
            nativeIconIsMask(ptr)
        }
        return result
    }

    /**
     * The Function is isDetached
     *
     * @return Type of Bool
     */
    public func isDetached(): Bool {
        let result = unsafe {
            nativeIconIsDetached(ptr)
        }
        return result
    }

    /**
     * The Function is detach
     *
     */
    public func detach() {
        unsafe {
            nativeIconDetach(ptr)
        }
    }

    /**
     * The Function is delete
     *
     */
    public func delete() {
        unsafe {
            nativeColorDelete(ptr)
        }
    }
}