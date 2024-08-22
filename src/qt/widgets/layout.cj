/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package cjqt.qt.widgets

foreign func nativeLayoutSetSpacing(ptr: Int64, spacing: Int32): Unit
foreign func nativeLayoutSetContentsMargins(ptr: Int64, left: Int32, top: Int32, right: Int32, bottom: Int32): Unit

/**
 * The class is QLayout
 * @author wathinst
 */
public open class QLayout {
    /** let member ptr type is Int64 */
    public let ptr: Int64

    /**
     * The Function is init constructor
     *
     * @param ptr of Int64
     */
    public init(ptr: Int64) {
        this.ptr = ptr
    }

    /**
     * The Function is delete
     *
     */
    public open func delete() {}

    public func setSpacing(spacing: Int64) {
        unsafe {
            nativeLayoutSetSpacing(ptr, Int32(spacing))
        }
    }

    public func setContentsMargins(left: Int64, top: Int64, right: Int64, bottom: Int64) {
        unsafe {
            nativeLayoutSetContentsMargins(ptr, Int32(left), Int32(top), Int32(right), Int32(bottom))
        }
    }
}
