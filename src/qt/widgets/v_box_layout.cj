/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package cjqt.qt.widgets

import cjqt.qt.gui.*
import cjqt.qt.core.*

foreign func nativeVBoxLayoutCreate(parentPtr: Int64): Int64
foreign func nativeVBoxLayoutDelete(ptr: Int64): Unit

/**
 * The class is QVBoxLayout inherited from QBoxLayout
 * @author wathinst
 */
public class QVBoxLayout <: QBoxLayout {
    /**
     * The Function is init constructor
     *
     * @param parent of QWidget, and the Default value is QWidget()
     */
    public init(parent!: QWidget = QWidget()) {
        super(
            unsafe {
                nativeVBoxLayoutCreate(parent.ptr)
            }
        )
    }

    /**
     * The Function is delete
     *
     */
    public override func delete() {
        unsafe {
            nativeVBoxLayoutDelete(ptr)
        }
    }
}
