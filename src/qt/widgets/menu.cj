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

foreign func nativeMenuCreate(parentPtr: Int64): Int64
foreign func nativeMenuSetTitle(ptr: Int64, title:CString): Unit
foreign func nativeMenuMenuAction(ptr: Int64): Int64
foreign func nativeMenuAddSeparator(ptr: Int64): Unit
foreign func nativeMenuAddAction(ptr: Int64, action:CString): Int64
foreign func nativeMenuAddActionStrIcon(ptr: Int64, iconPtr: Int64, action: CString): Int64
foreign func nativeMenuAddActionPtr(ptr: Int64, actionPtr: Int64): Unit
foreign func nativeMenuDelete(ptr: Int64): Unit

/**
 * The class is QMenu inherited from QWidget
 * @author wathinst
 */
public class QMenu <: QWidget {
    /**
     * The Function is init constructor
     *
     */
    public init() {
        super(unsafe {
            nativeMenuCreate(0)
        })
    }

    /**
     * The Function is init constructor
     *
     * @param menuPrt of Int64
     */
    public init(menuPrt: Int64) {
        super(menuPrt)
    }

    /**
     * The Function is init constructor
     *
     * @param parent of QWidget
     */
    public init(parent: QWidget) {
        super(unsafe {
            nativeMenuCreate(parent.ptr)
        })
    }

    /**
     * The Function is setTitle
     *
     * @param title of String
     */
    public func setTitle(title:String) {
        unsafe {
            nativeMenuSetTitle(ptr, LibC.mallocCString(title))
        }
    }

    /**
     * The Function is menuAction
     *
     * @return Type of QAction
     */
    public func menuAction(): QAction {
        let actionPtr = unsafe {
            nativeMenuMenuAction(ptr)
        }
        return QAction(actionPtr)
    }

    /**
     * The Function is addSeparator
     *
     */
    public func addSeparator() {
        unsafe {
            nativeMenuAddSeparator(ptr)
        }
    }

    /**
     * The Function is addAction
     *
     * @param action of String
     *
     * @return Type of QAction
     */
    public func addAction(action:String): QAction {
        let actionPtr = unsafe {
            nativeMenuAddAction(ptr, LibC.mallocCString(action))
        }
        return QAction(actionPtr)
    }

    /**
     * The Function is addAction
     *
     * @param icon of QIcon
     * @param action of String
     *
     * @return Type of QAction
     */
    public func addAction(icon: QIcon, action: String): QAction {
        let actionPrt = unsafe {
            nativeMenuAddActionStrIcon(ptr, icon.ptr, LibC.mallocCString(action))
        }
        return QAction(actionPrt)
    }

    /**
     * The Function is addAction
     *
     * @param action of QAction
     */
    public func addAction(action:QAction) {
        unsafe {
            nativeMenuAddActionPtr(ptr, action.ptr)
        }
    }

    /**
     * The Function is delete
     *
     */
    public override func delete() {
        unsafe {
            nativeMenuDelete(ptr)
        }
    }
}