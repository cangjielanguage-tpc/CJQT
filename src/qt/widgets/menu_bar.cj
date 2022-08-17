/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package qt.widgets

// from std import ffi.c.CString

foreign func nativeMenuBarCreate(parentPtr: Int64): Int64
foreign func nativeMenuBarAddActionStr(ptr: Int64, action:CString): Int64
foreign func nativeMenuBarAddAction(ptr: Int64, actionPtr: Int64): Unit
foreign func nativeMenuBarAddMenuStr(ptr: Int64, menu:CString): Int64
foreign func nativeMenuBarAddMenuStrIcon(ptr: Int64, iconPtr: Int64, action:CString): Int64
foreign func nativeMenuBarAddMenu(ptr: Int64, menuPtr: Int64): Int64
foreign func nativeMenuBarDelete(ptr: Int64): Unit

/**
 * The class is QMenuBar inherited from QWidget
 * @author wathinst
 */
public class QMenuBar <: QWidget {
    /**
     * The Function is init constructor
     *
     */
    public init() {
        super(unsafe {
            nativeMenuBarCreate(0)
        })
    }

    /**
     * The Function is init constructor
     *
     * @param parent of QWidget
     */
    public init(parent: QWidget) {
        super(unsafe {
            nativeMenuBarCreate(parent.ptr)
        })
    }

    /**
     * The Function is init constructor
     *
     * @param menuBarPrt of Int64
     */
    public init(menuBarPrt: Int64) {
        super(menuBarPrt)
    }

    /**
     * The Function is addAction
     *
     * @param menu of String
     *
     * @return Type of QAction
     */
    public func addAction(menu:String): QAction {
        let actionPrt = unsafe {
            nativeMenuBarAddActionStr(ptr, CString(menu))
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
            nativeMenuBarAddAction(ptr, action.ptr)
        }
    }

    /**
     * The Function is addMenu
     *
     * @param menu of String
     *
     * @return Type of QMenu
     */
    public func addMenu(menu:String): QMenu {
        let menuPrt = unsafe {
            nativeMenuBarAddMenuStr(ptr, CString(menu))
        }
        return QMenu(menuPrt)
    }

    /**
     * The Function is addMenu
     *
     * @param icon of QIcon
     * @param menu of String
     *
     * @return Type of QMenu
     */
    public func addMenu(icon: QIcon, menu:String): QMenu {
        let menuPrt = unsafe {
            nativeMenuBarAddMenuStrIcon(ptr, icon.ptr, CString(menu))
        }
        return QMenu(menuPrt)
    }

    /**
     * The Function is addMenu
     *
     * @param menu of QMenu
     *
     * @return Type of QAction
     */
    public func addMenu(menu:QMenu): QAction {
        let actionPrt = unsafe {
            nativeMenuBarAddMenu(ptr, menu.ptr)
        }
        return QAction(actionPrt)
    }

    /**
     * The Function is delete
     *
     */
    public override func delete() {
        unsafe {
            nativeMenuBarDelete(ptr)
        }
    }
}