/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
// package honeas
package cjqt.widgets

internal import cjqt.gui.*
internal import std.collection.*
internal import cjqt.tools.*
internal import cjqt.core.*

foreign func nativeDialogCreate(parentPtr: Int64): Int64
foreign func nativeDialogDelete(ptr: Int64): Unit
foreign func nativeDialogExec(ptr: Int64): Unit


/**
 * The class is QWidget
 * @author wathinst
 */
public open class QDialog <: QWidget {
    /**
     * The Function is init constructor
     *
     */
    public init() {
        super(
            unsafe {
                nativeDialogCreate(0)
            }
        )
    }

    /**
     * The Function is init constructor
     *
     * @param parent of QWidget
     */
    public init(parent: QWidget) {
        super(
            unsafe {
                nativeDialogCreate(parent.ptr)
            }
        )
    }

    /**
     * The Function is init constructor
     *
     * @param ptr of Int64
     */
    public init(ptr: Int64) {
        super(
	    unsafe {
                nativeDialogCreate(ptr)
            }
	)
    }


    /**
     * The Function is delete
     *
     */
    public open func delete() {
        unsafe {
            nativeDialogDelete(ptr)
        }
    }

    public func exec() {
        unsafe {
            nativeDialogExec(ptr)
        }
    }

}
