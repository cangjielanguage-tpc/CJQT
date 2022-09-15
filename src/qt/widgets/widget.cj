/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package qt.widgets

import qt.gui.*
from std import collection.*
import qt.tools.QCallbackMap

foreign func nativeWidgetCreate(parentPtr: Int64): Int64
foreign func nativeWidgetResize(ptr: Int64, w: Int32, h: Int32): Unit
foreign func nativeWidgetSetFixedSize(ptr: Int64, w: Int32, h: Int32): Unit
foreign func nativeWidgetShow(ptr: Int64): Unit
foreign func nativeWidgetHide(ptr: Int64): Unit
foreign func nativeWidgetShowMinimized(ptr: Int64): Unit
foreign func nativeWidgetShowMaximized(ptr: Int64): Unit
foreign func nativeWidgetShowFullScreen(ptr: Int64): Unit
foreign func nativeWidgetShowNormal(ptr: Int64): Unit
foreign func nativeWidgetClose(ptr: Int64): Unit
foreign func nativeWidgetMove(ptr: Int64, ax: Int32, ay: Int32): Unit
foreign func nativeWidgetSetWindowTitle(ptr: Int64, title: CString): Unit
foreign func nativeWidgetRepaint(ptr: Int64): Unit
foreign func nativeWidgetSetLayout(ptr: Int64, layoutPtr: Int64): Unit
foreign func nativeWidgetSetPalette(ptr: Int64, palettePtr: Int64): Unit
foreign func nativeWidgetSetAutoFillBackground(ptr: Int64, enabled: Int32): Unit
foreign func nativeWidgetSetGeometry(ptr: Int64, ax: Int32, ay: Int32, aw: Int32, ah: Int32): Unit
foreign func nativeWidgetSetFont(ptr: Int64, fontPtr: Int64): Unit
foreign func nativeWidgetDelete(ptr: Int64): Unit
foreign func nativeWidgetSetStyleSheet(ptr: Int64, styleSheet: CString): Unit
foreign func nativeWidgetSetWindowIcon(ptr: Int64, iconPtr: Int64): Unit
foreign func nativeWidgetRect(ptr: Int64): Int64

foreign func nativeWidgetSetPaintEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit
foreign func nativeWidgetSetMousePressEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit
foreign func nativeWidgetSetMouseReleaseEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit
foreign func nativeWidgetSetMouseMoveEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit
foreign func nativeWidgetSetKeyPressEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit

@c
func paintersEventCallback(ptr: Int64, eventPtr: Int64): Unit {
    let event = QPaintersEvent(eventPtr)
    try {
        QWidgetCallbackMap.paintersEvent[ptr](event)
    } catch (e: Exception) {
        println(e)
    }
}

@c
func mousePressEventCallback(ptr: Int64, eventPtr: Int64): Unit {
    let event = QMouseEvent(eventPtr)
    try {
        QWidgetCallbackMap.mousePressEvent[ptr](event)
    } catch (e: Exception) {
        println(e)
    }
}

@c
func mouseReleaseEventCallback(ptr: Int64, eventPtr: Int64): Unit {
    let event = QMouseEvent(eventPtr)
    try {
        QWidgetCallbackMap.mouseReleaseEvent[ptr](event)
    } catch (e: Exception) {
        println(e)
    }
}

@c
func mouseMoveEventCallback(ptr: Int64, eventPtr: Int64): Unit {
    let event = QMouseEvent(eventPtr)
    try {
        QWidgetCallbackMap.mouseMoveEvent[ptr](event)
    } catch (e: Exception) {
        println(e)
    }
}

@c
func keyPressEventCallback(ptr: Int64, eventPtr: Int64): Unit {
    let event = QKeyEvent(eventPtr)
    try {
        QWidgetCallbackMap.keyPressEvent[ptr](event)
    } catch (e: Exception) {
        println(e)
    }
}

@c
func connectUnitCallback(code: Int64): Unit {
    try {
        QCallbackMap.connect[code]()
    } catch (e: Exception) {
        println(e)
    }
}

@c
func connectInt64Callback(code: Int64, data: Int32): Unit {
    try {
        QCallbackMap.connectInt64[code](Int64(data))
    } catch (e: Exception) {
        println(e)
    }
}

@c
func connectBoolCallback(code: Int64, data: Bool): Unit {
    try {
        QCallbackMap.connectBool[code](data)
    } catch (e: Exception) {
        println(e)
    }
}

@c
func connectCStringCallback(code: Int64, data: CString): Unit {
    try {
        QCallbackMap.connectString[code](data.toString())
    } catch (e: Exception) {
        println(e)
    }
}

/**
 * The class is QWidget
 * @author wathinst
 */
public open class QWidget <: QObject {
    /**
     * The Function is init constructor
     *
     */
    public init() {
        super(
            unsafe {
                nativeWidgetCreate(0)
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
                nativeWidgetCreate(parent.ptr)
            }
        )
    }

    /**
     * The Function is init constructor
     *
     * @param ptr of Int64
     */
    public init(ptr: Int64) {
        super(ptr)
    }

    /**
     * The Function is setFixedSize
     *
     * @param w of Int64
     * @param h of Int64
     */
    public func setFixedSize(w: Int64, h: Int64) {
        unsafe {
            nativeWidgetSetFixedSize(ptr, Int32(w), Int32(h))
        }
    }

    /**
     * The Function is resize
     *
     * @param w of Int64
     * @param h of Int64
     */
    public func resize(w: Int64, h: Int64) {
        unsafe {
            nativeWidgetResize(ptr, Int32(w), Int32(h))
        }
    }

    /**
     * The Function is show
     *
     */
    public func show() {
        unsafe {
            nativeWidgetShow(ptr)
        }
    }

    /**
     * The Function is hide
     *
     */
    public func hide() {
        unsafe {
            nativeWidgetHide(ptr)
        }
    }

    /**
     * The Function is showMinimized
     *
     */
    public func showMinimized() {
        unsafe {
            nativeWidgetShowMinimized(ptr)
        }
    }

    /**
     * The Function is showMaximized
     *
     */
    public func showMaximized() {
        unsafe {
            nativeWidgetShowMaximized(ptr)
        }
    }

    /**
     * The Function is showFullScreen
     *
     */
    public func showFullScreen() {
        unsafe {
            nativeWidgetShowFullScreen(ptr)
        }
    }

    /**
     * The Function is showNormal
     *
     */
    public func showNormal() {
        unsafe {
            nativeWidgetShowNormal(ptr)
        }
    }

    /**
     * The Function is close
     *
     */
    public func close() {
        unsafe {
            nativeWidgetClose(ptr)
        }
    }

    /**
     * The Function is move
     *
     * @param ax of Int32
     * @param ay of Int32
     */
    public func move(ax: Int32, ay: Int32) {
        unsafe {
            nativeWidgetMove(ptr, ax, ay)
        }
    }

    /**
     * The Function is setWindowTitle
     *
     * @param title of String
     */
    public func setWindowTitle(title: String) {
        unsafe {
            nativeWidgetSetWindowTitle(ptr, CString(title))
        }
    }

    /**
     * The Function is setLayout
     *
     * @param layout of QLayout
     */
    public open func setLayout(layout: QLayout) {
        unsafe {
            nativeWidgetSetLayout(ptr, layout.ptr)
        }
    }

    /**
     * The Function is setPalette
     *
     * @param palette of QPalette
     */
    public func setPalette(palette: QPalette) {
        unsafe {
            nativeWidgetSetPalette(ptr, palette.ptr)
        }
    }

    /**
     * The Function is setAutoFillBackground
     *
     * @param enabled of Bool
     */
    public func setAutoFillBackground(enabled: Bool) {
        unsafe {
            nativeWidgetSetAutoFillBackground(ptr, if (enabled) {
                    1
                } else {
                    0
                })
        }
    }

    /**
     * The Function is setGeometry
     *
     * @param ax of Int32
     * @param ay of Int32
     * @param aw of Int32
     * @param ah of Int32
     */
    public func setGeometry(ax: Int32, ay: Int32, aw: Int32, ah: Int32) {
        unsafe {
            nativeWidgetSetGeometry(ptr, ax, ay, aw, ah)
        }
    }

    /**
     * The Function is setFont
     *
     * @param font of QFont
     */
    public func setFont(font: QFont) {
        unsafe {
            nativeWidgetSetFont(ptr, font.ptr)
        }
    }

    /**
     * The Function is setStyleSheel
     *
     * @param styleSheet of String
     */
    public func setStyleSheel(styleSheet: String) {
        unsafe {
            nativeWidgetSetStyleSheet(ptr, CString(styleSheet))
        }
    }

    /**
     * The Function is setWindowIcon
     *
     * @param icon of QIcon
     */
    public func setWindowIcon(icon: QIcon): Unit {
        unsafe {
            nativeWidgetSetWindowIcon(ptr, icon.ptr)
        }
    }

    /**
     * The Function is rect
     *
     * @return Type of  QRect
     */
    public func rect(): QRect {
        let rectPtr = unsafe {
            nativeWidgetRect(this.ptr)
        }
        return QRect(rectPtr)
    }

    /**
     * The Function is repaint
     *
     */
    public open func repaint() {
        unsafe {
            nativeWidgetRepaint(ptr)
        }
    }

    /**
     * The Function is delete
     *
     */
    public open func delete() {
        QWidgetCallbackMap.paintersEvent.remove(ptr)
        QWidgetCallbackMap.mousePressEvent.remove(ptr)
        QWidgetCallbackMap.mouseReleaseEvent.remove(ptr)
        QWidgetCallbackMap.mouseMoveEvent.remove(ptr)
        QWidgetCallbackMap.keyPressEvent.remove(ptr)
        unsafe {
            nativeWidgetDelete(ptr)
        }
    }

    /**
     * The Function is setPaintEvent
     *
     * @param callback of (QPaintersEvent)->Unit
     */
    public func setPaintEvent(callback: (QPaintersEvent) -> Unit) {
        QWidgetCallbackMap.paintersEvent.put(ptr, callback)
        unsafe {
            nativeWidgetSetPaintEvent(ptr, paintersEventCallback)
        }
    }

    /**
     * The Function is setMousePressEvent
     *
     * @param callback of (QMouseEvent)->Unit
     */
    public func setMousePressEvent(callback: (QMouseEvent) -> Unit) {
        QWidgetCallbackMap.mousePressEvent.put(ptr, callback)
        unsafe {
            nativeWidgetSetMousePressEvent(ptr, mousePressEventCallback)
        }
    }

    /**
     * The Function is setMouseReleaseEvent
     *
     * @param callback of (QMouseEvent)->Unit
     */
    public func setMouseReleaseEvent(callback: (QMouseEvent) -> Unit) {
        QWidgetCallbackMap.mouseReleaseEvent.put(ptr, callback)
        unsafe {
            nativeWidgetSetMouseReleaseEvent(ptr, mouseReleaseEventCallback)
        }
    }

    /**
     * The Function is setMouseMoveEvent
     *
     * @param callback of (QMouseEvent)->Unit
     */
    public func setMouseMoveEvent(callback: (QMouseEvent) -> Unit) {
        QWidgetCallbackMap.mouseMoveEvent.put(ptr, callback)
        unsafe {
            nativeWidgetSetMouseMoveEvent(ptr, mouseMoveEventCallback)
        }
    }

    /**
     * The Function is setKeyPressEvent
     *
     * @param callback of (QKeyEvent)->Unit
     */
    public func setKeyPressEvent(callback: (QKeyEvent) -> Unit) {
        QWidgetCallbackMap.keyPressEvent.put(ptr, callback)
        unsafe {
            nativeWidgetSetKeyPressEvent(ptr, keyPressEventCallback)
        }
    }
}
