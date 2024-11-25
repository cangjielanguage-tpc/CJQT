/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package cjqt.widgets

foreign func nativeHBoxLayoutCreate(parentPtr: Int64): Int64
foreign func nativeHBoxLayoutDelete(ptr: Int64): Unit

/**
 * The class is QHBoxLayout inherited from QBoxLayout
 * @author wathinst
 */
public class QHBoxLayout <: QBoxLayout {
    /**
     * The Function is init constructor
     *
     * @param parent of QWidget, and the Default value is QWidget()
     */
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeHBoxLayoutCreate(parent.ptr)
            }
        )
    }

    /**
     * The Function is delete
     *
     */
    public override func delete() {
        unsafe {
            nativeHBoxLayoutDelete(ptr)
        }
    }
}