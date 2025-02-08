/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package cjqt.gui

foreign func nativeTextOptionCreate(ptr: Int64): Int64
foreign func nativeTextOptionCreateAlignment( alignment: Int16): Int64
foreign func nativeTextOptionSetAlignment(ptr: Int64, alignment: Int16): Unit
foreign func nativeTextOptionDelete(ptr: Int64): Unit

/**
 * The class is QFont
 * @author wathinst
 */
public class QTextOption{
    /** let member ptr type is Int64 */
    public let ptr: Int64

    /**
     * The Function is init constructor
     *
     */
    public init() {
        ptr = unsafe {
            nativeTextOptionCreate(0)
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

    public init(alignment:Alignment) {
        ptr = unsafe {
            nativeTextOptionCreateAlignment(alignment.value())
        }
    }


    public func setAlignment(alignment:Alignment){
        unsafe {
            nativeTextOptionSetAlignment(ptr,alignment.value())
        }
    }

    /**
     * The Function is delete
     *
     */
    public func delete() {
        unsafe {
            nativeTextOptionDelete(ptr)
        }
    }
}

