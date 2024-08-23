/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package cjqt.widgets

foreign func nativeMainWindowCreate(parentPtr: Int64): Int64
foreign func nativeMainWindowSetCentralWidget(ptr: Int64, widgetPtr: Int64): Unit
foreign func nativeMainWindowSetMenuBar(ptr: Int64, menuBarPtr: Int64): Unit
foreign func nativeMainWindowMenuBar(ptr: Int64): Int64
foreign func nativeMainWindowAddToolBar(ptr: Int64, toolBarPtr: Int64): Unit
foreign func nativeMainWindowDelete(ptr: Int64): Unit

/**
 * The class is QMainWindow inherited from QWidget
 * @author wathinst
 */
public open class QMainWindow <: QWidget {
    /**
     * The Function is init constructor
     *
     */
    public init() {
        super(
            unsafe {
                nativeMainWindowCreate(0)
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
                nativeMainWindowCreate(parent.ptr)
            }
        )
    }

    /**
     * The Function is setCentralWidget
     *
     * @param widget of QWidget
     */
    public func setCentralWidget(widget: QWidget) {
        unsafe {
            nativeMainWindowSetCentralWidget(ptr, widget.ptr)
        }
    }

    /**
     * The Function is setMenuBar
     *
     * @param menuBar of QMenuBar
     */
    public func setMenuBar(menuBar: QMenuBar) {
        unsafe {
            nativeMainWindowSetMenuBar(ptr, menuBar.ptr)
        }
    }

    /**
     * The Function is menuBar
     *
     * @return Type of QMenuBar
     */
    public func menuBar(): QMenuBar {
        let menuBarPrt = unsafe {
            nativeMainWindowMenuBar(ptr)
        }
        return QMenuBar(menuBarPrt)
    }

    /**
     * The Function is addToolBar
     *
     * @param toolBar of QToolBar
     */
    public func addToolBar(toolBar: QToolBar) {
        unsafe {
            nativeMainWindowAddToolBar(ptr, toolBar.ptr)
        }
    }

    /**
     * The Function is delete
     *
     */
    public override func delete() {
        unsafe {
            nativeMainWindowDelete(ptr)
        }
    }
}
