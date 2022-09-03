/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package qt.code

from std import ffi.c.CString

foreign func nativeUrlCreate(url: CString, parsingMode: Int32): Int64
foreign func nativeUrlToString(ptr: Int64): CString
foreign func nativeUrlIsValid(ptr: Int64): Bool
foreign func nativeUrlDelete(ptr: Int64): Unit

/**
 * The class is QUrl
 * @author wathinst
 */
public class QUrl {
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
     * The Function is init constructor
     *
     * @param url of String
     */
    public init(url: String) {
        ptr = unsafe {
            nativeUrlCreate(CString(url), 1)
        }
    }

    /**
     * The Function is init constructor
     *
     * @param url of String
     * @param parsingMode of Int32
     */
    public init(url: String, parsingMode: Int32) {
        ptr = unsafe {
            nativeUrlCreate(CString(url), parsingMode)
        }
    }

    /**
     * The Function is toString
     *
     * @return Type of String
     */
    public func toString(): String {
        unsafe {
            nativeUrlToString(ptr).toString()
        }
    }

    /**
     * The Function is isValid
     *
     * @return Type of Bool
     */
    public func isValid(): Bool {
        unsafe {
            nativeUrlIsValid(ptr)
        }
    }

    /**
     * The Function is delete
     *
     */
    public func delete() {
        unsafe {
            nativeUrlDelete(ptr)
        }
    }
}
