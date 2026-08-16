/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */

package cjqt.widgets

import cjqt.gui.*
import std.collection.*
import cjqt.tools.*
import cjqt.core.*

foreign func nativeWidgetCreate(parentPtr: Int64): Int64
foreign func nativeWidgetResize(ptr: Int64, w: Int32, h: Int32): Unit
foreign func nativeWidgetSetFixedSize(ptr: Int64, w: Int32, h: Int32): Unit
foreign func nativeWidgetShow(ptr: Int64): Unit
foreign func nativeWidgetHide(ptr: Int64): Unit
foreign func nativeWidgetIsVisible(ptr: Int64): Bool
foreign func nativeWidgetX(ptr: Int64): Int32
foreign func nativeWidgetY(ptr: Int64): Int32
foreign func nativeWidgetWidth(ptr: Int64): Int32
foreign func nativeWidgetHeight(ptr: Int64): Int32
foreign func nativeWidgetShowMinimized(ptr: Int64): Unit
foreign func nativeWidgetShowMaximized(ptr: Int64): Unit
foreign func nativeWidgetShowFullScreen(ptr: Int64): Unit
foreign func nativeWidgetShowNormal(ptr: Int64): Unit
foreign func nativeWidgetClose(ptr: Int64): Unit
foreign func nativeWidgetMove(ptr: Int64, ax: Int32, ay: Int32): Unit
foreign func nativeWidgetSetWindowTitle(ptr: Int64, title: CString): Unit
foreign func nativeWidgetWindowTitle(ptr: Int64): CString
foreign func nativeWidgetRepaint(ptr: Int64): Unit
foreign func nativeWidgetSetLayout(ptr: Int64, layoutPtr: Int64): Unit
foreign func nativeWidgetSetPalette(ptr: Int64, palettePtr: Int64): Unit
foreign func nativeWidgetSetAutoFillBackground(ptr: Int64, enabled: Int32): Unit
foreign func nativeWidgetSetGeometry(ptr: Int64, ax: Int32, ay: Int32, aw: Int32, ah: Int32): Unit
foreign func nativeWidgetSetFont(ptr: Int64, fontPtr: Int64): Unit
foreign func nativeWidgetDelete(ptr: Int64): Unit
foreign func nativeWidgetSetStyleSheet(ptr: Int64, styleSheet: CString): Unit
foreign func nativeWidgetSetWindowIcon(ptr: Int64, iconPtr: Int64): Unit
foreign func nativeWidgetRect(ptr: Int64): QRect
foreign func nativeWidgetSetMinimumWidth(ptr: Int64, width: Int32): Unit
foreign func nativeWidgetSetMinimumHeight(ptr: Int64, height: Int32): Unit
foreign func nativeWidgetSetMaximumWidth(ptr: Int64, width: Int32): Unit
foreign func nativeWidgetSetMaximumHeight(ptr: Int64, height: Int32): Unit
foreign func nativeWidgetSetFixedWidth(ptr: Int64, width: Int32): Unit
foreign func nativeWidgetSetFixedHeight(ptr: Int64, height: Int32): Unit
foreign func nativeWidgetSetToolTip(ptr: Int64, title: CString): Unit
foreign func nativeWidgetToolTip(ptr: Int64): CString
foreign func nativeWidgetSetSizePolicy(ptr: Int64, horizontal: Int32, vertical: Int32): Unit
foreign func nativeWidgetAreaSetAttribute(ptr: Int64, attribute: Int32, on: Bool): Unit

foreign func nativeWidgetSetPaintEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit
foreign func nativeWidgetSetMousePressEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit
foreign func nativeWidgetSetMouseReleaseEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit
foreign func nativeWidgetSetMouseMoveEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit
foreign func nativeWidgetSetKeyPressEvent(ptr: Int64, callback: CFunc<(Int64, Int64) -> Unit>): Unit

foreign func nativeWidgetUpdate(ptr: Int64): Unit
@C
func paintersEventCallback(ptr: Int64, eventPtr: Int64): Unit {
    let event = QPaintersEvent(eventPtr)
    try {
        QWidgetCallbackMap.paintersEvent[ptr](event)
    } catch (e: Exception) {
        println(e)
    }
}

@C
func mousePressEventCallback(ptr: Int64, eventPtr: Int64): Unit {
    let event = QMouseEvent(eventPtr)
    try {
        QWidgetCallbackMap.mousePressEvent[ptr](event)
    } catch (e: Exception) {
        println(e)
    }
}

@C
func mouseReleaseEventCallback(ptr: Int64, eventPtr: Int64): Unit {
    let event = QMouseEvent(eventPtr)
    try {
        QWidgetCallbackMap.mouseReleaseEvent[ptr](event)
    } catch (e: Exception) {
        println(e)
    }
}

@C
func mouseMoveEventCallback(ptr: Int64, eventPtr: Int64): Unit {
    let event = QMouseEvent(eventPtr)
    try {
        QWidgetCallbackMap.mouseMoveEvent[ptr](event)
    } catch (e: Exception) {
        println(e)
    }
}

@C
func keyPressEventCallback(ptr: Int64, eventPtr: Int64): Unit {
    let event = QKeyEvent(eventPtr)
    try {
        QWidgetCallbackMap.keyPressEvent[ptr](event)
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
     * The Function is isVisible
     *
     */
    public func isVisible(): Bool {
        let result = unsafe {
            nativeWidgetIsVisible(ptr)
        }
        return result
    }

    /**
     * The Function is x
     *
     */
    public func x(): Int64 {
        let result = unsafe {
            nativeWidgetX(ptr)
        }
        return Int64(result)
    }

    /**
     * The Function is y
     *
     */
    public func y(): Int64 {
        let result = unsafe {
            nativeWidgetY(ptr)
        }
        return Int64(result)
    }

    /**
     * The Function is width
     *
     */
    public func width(): Int32 {
        let result = unsafe {
            nativeWidgetWidth(ptr)
        }
        return Int32(result)
    }

    /**
     * The Function is height
     *
     */
    public func height(): Int64 {
        let result = unsafe {
            nativeWidgetHeight(ptr)
        }
        return Int64(result)
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
            let t=LibC.mallocCString(title)
            nativeWidgetSetWindowTitle(ptr, t)
            LibC.free(t)
        }
    }

    public func windowTitle(): String {
        let result = unsafe {
            nativeWidgetWindowTitle(ptr)
        }
        return result.toString()
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
     * The Function is setStyleSheet
     *
     * @param styleSheet of String
     */
    public func setStyleSheet(styleSheet: String) {
        unsafe {
            let s=LibC.mallocCString(styleSheet)
            nativeWidgetSetStyleSheet(ptr,s )
            LibC.free(s)
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
        let rect = unsafe {
            nativeWidgetRect(this.ptr)
        }
        return rect
    }

    /**
     * The Function is setMinimumWidth
     *
     * @param width of Int32
     */
    public func setMinimumWidth(width: Int64) {
        unsafe {
            nativeWidgetSetMinimumWidth(ptr, Int32(width))
        }
    }

    /**
     * The Function is setMinimumHeight
     *
     * @param height of Int32
     */
    public func setMinimumHeight(height: Int64) {
        unsafe {
            nativeWidgetSetMinimumHeight(ptr, Int32(height))
        }
    }

    /**
     * The Function is setMaximumWidth
     *
     * @param width of Int32
     */
    public func setMaximumWidth(width: Int64) {
        unsafe {
            nativeWidgetSetMaximumWidth(ptr, Int32(width))
        }
    }

    /**
     * The Function is setMaximumHeight
     *
     * @param height of Int32
     */
    public func setMaximumHeight(height: Int64) {
        unsafe {
            nativeWidgetSetMaximumHeight(ptr, Int32(height))
        }
    }

    /**
     * The Function is setFixedWidth
     *
     * @param width of Int32
     */
    public func setFixedWidth(width: Int64) {
        unsafe {
            nativeWidgetSetFixedWidth(ptr, Int32(width))
        }
    }

    /**
     * The Function is setFixedHeight
     *
     * @param height of Int32
     */
    public func setFixedHeight(height: Int64) {
        unsafe {
            nativeWidgetSetFixedHeight(ptr, Int32(height))
        }
    }

    public func setToolTip(tip: String) {
        unsafe {
            let t=LibC.mallocCString(tip)
            nativeWidgetSetToolTip(ptr, t)
            LibC.free(t)
        }
    }

    public func toolTip(): String {
        let result = unsafe {
            nativeWidgetToolTip(ptr)
        }
        return result.toString()
    }

    public func setSizePolicy(horizontal: Int64, vertical: Int64) {
        unsafe {
            nativeWidgetSetSizePolicy(ptr, Int32(horizontal), Int32(vertical))
        }
    }

    public func setAttribute(attribute: WidgetAttribute, on: Bool) {
        unsafe {
            nativeWidgetAreaSetAttribute(ptr, attribute.value(), on)
        }
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
        QWidgetCallbackMap.paintersEvent.add(ptr, callback)
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
        QWidgetCallbackMap.mousePressEvent.add(ptr, callback)
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
        QWidgetCallbackMap.mouseReleaseEvent.add(ptr, callback)
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
        QWidgetCallbackMap.mouseMoveEvent.add(ptr, callback)
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
        QWidgetCallbackMap.keyPressEvent.add(ptr, callback)
        unsafe {
            nativeWidgetSetKeyPressEvent(ptr, keyPressEventCallback)
        }
    }
    
    public func update(){
        unsafe {
            nativeWidgetUpdate(ptr)
        }
    }
}
