/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package qt.widgets

foreign func nativeToolBarCreate(parentPtr: Int64): Int64
foreign func nativeToolBarDelete(ptr: Int64): Unit
foreign func nativeToolBarAddActionStr(ptr: Int64, action: CString): Int64
foreign func nativeToolBarAddActionStrIcon(ptr: Int64, iconPtr: Int64, action: CString): Int64
foreign func nativeToolBarAddAction(ptr: Int64, actionPtr: Int64): Unit
foreign func nativeToolBarAddSeparator(ptr: Int64): Int64
foreign func nativeToolBarInsertSeparator(ptr: Int64, actionPtr: Int64): Int64
foreign func nativeToolBarAddWidget(ptr: Int64, widgetPtr: Int64): Int64
foreign func nativeToolBarInsertWidget(ptr: Int64, actionPtr: Int64, widgetPtr: Int64): Int64

/**
 * The class is QToolBar inherited from QWidget
 * @author wathinst
 */
public class QToolBar <: QWidget {
    /**
     * The Function is init constructor
     *
     * @param parent of QWidget, and the Default value is QWidget(0)
     */
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeToolBarCreate(parent.ptr)
            }
        )
    }

    /**
     * The Function is delete
     *
     */
    public override func delete() {
        unsafe {
            nativeToolBarDelete(ptr)
        }
    }

    /**
     * The Function is addAction
     *
     * @param action of String
     *
     * @return Type of QAction
     */
    public func addAction(action: String): QAction {
        let actionPrt = unsafe {
            nativeToolBarAddActionStr(ptr, CString(action))
        }
        return QAction(actionPrt)
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
            nativeToolBarAddActionStrIcon(ptr, icon.ptr, CString(action))
        }
        return QAction(actionPrt)
    }

    /**
     * The Function is addAction
     *
     * @param action of QAction
     */
    public func addAction(action: QAction) {
        unsafe {
            nativeToolBarAddAction(ptr, action.ptr)
        }
    }

    /**
     * The Function is addSeparator
     *
     * @return Type of QAction
     */
    public func addSeparator(): QAction {
        let actionPrt = unsafe {
            nativeToolBarAddSeparator(ptr)
        }
        return QAction(actionPrt)
    }

    /**
     * The Function is insertSeparator
     *
     * @param before of QAction
     *
     * @return Type of QAction
     */
    public func insertSeparator(before: QAction): QAction {
        let actionPrt = unsafe {
            nativeToolBarInsertSeparator(ptr, before.ptr)
        }
        return QAction(actionPrt)
    }

    /**
     * The Function is addSeparator
     *
     * @param widget of QWidget
     *
     * @return Type of QAction
     */
    public func addSeparator(widget: QWidget): QAction {
        let actionPrt = unsafe {
            nativeToolBarAddWidget(ptr, widget.ptr)
        }
        return QAction(actionPrt)
    }

    /**
     * The Function is insertWidget
     *
     * @param before of QAction
     * @param widget of QWidget
     *
     * @return Type of QAction
     */
    public func insertWidget(before: QAction, widget: QWidget): QAction {
        let actionPrt = unsafe {
            nativeToolBarInsertWidget(ptr, before.ptr, widget.ptr)
        }
        return QAction(actionPrt)
    }
}
