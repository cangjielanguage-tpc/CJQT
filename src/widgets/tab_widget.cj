package cjqt.widgets

import cjqt.gui.*
import cjqt.core.*

foreign func nativeTabWidgetCreate(parentPtr: Int64): Int64
foreign func nativeTabWidgetDelete(ptr: Int64): Unit

foreign func nativeTabWidgetAddTab(ptr: Int64, widgetPtr: Int64, text: CString): Unit
foreign func nativeTabWidgetAddTabWithIcon(ptr: Int64, widgetPtr: Int64, iconPtr: Int64, text: CString): Unit
foreign func nativeTabWidgetInsertTab(ptr: Int64, widgetPtr: Int64, index: Int32, text: CString): Unit
foreign func nativeTabWidgetInsertTabWithIcon(ptr: Int64, widgetPtr: Int64, index: Int32, iconPtr: Int64, text: CString): Unit
foreign func nativeTabWidgetRemoveTab(ptr: Int64, index: Int32): Unit
foreign func nativeTabWidgetIsTabEnabled(ptr: Int64, index: Int32): Bool
foreign func nativeTabWidgetSetTabEnabled(ptr: Int64, index: Int32, enabl: Bool): Unit
foreign func nativeTabWidgetSetTabText(ptr: Int64, index: Int32, text: CString): Unit
foreign func nativeTabWidgetTabText(ptr: Int64, index: Int32): CString
foreign func nativeTabWidgetSetTabIcon(ptr: Int64, index: Int32, iconPtr: Int64): Unit
foreign func nativeTabWidgetTabIcon(ptr: Int64, index: Int32): Int64
foreign func nativeTabWidgetCurrentIndex(ptr: Int64): Int32
foreign func nativeTabWidgetCurrentWidget(ptr: Int64): Int64
foreign func nativeTabWidgetWidget(ptr: Int64, index: Int32): Int64
foreign func nativeTabWidgetIndexOf(ptr: Int64, widgetPtr: Int64): Int32
foreign func nativeTabWidgetCount(ptr: Int64): Int32
foreign func nativeTabWidgetIconSize(ptr: Int64): QSize
foreign func nativeTabWidgetSetIconSize(ptr: Int64, sizeW: Int32,sizeH: Int32): Unit
foreign func nativeTabWidgetUsesScrollButtons(ptr: Int64): Bool
foreign func nativeTabWidgetSetUsesScrollButtons(ptr: Int64, useButtons: Bool): Unit
foreign func nativeTabWidgetTabsClosable(ptr: Int64): Bool
foreign func nativeTabWidgetSetTabsClosable(ptr: Int64, closable: Bool): Unit
foreign func nativeTabWidgetIsMovable(ptr: Int64): Bool
foreign func nativeTabWidgetSetMovable(ptr: Int64, movable: Bool): Unit
foreign func nativeTabWidgetDocumentMode(ptr: Int64): Bool
foreign func nativeTabWidgetSetDocumentMode(ptr: Int64, documentMode: Bool): Unit
foreign func nativeTabWidgetTabBarAutoHide(ptr: Int64): Bool
foreign func nativeTabWidgetSetTabBarAutoHide(ptr: Int64, hide: Bool): Unit
foreign func nativeTabWidgetClear(ptr: Int64): Unit
foreign func nativeTabWidgetTabBar(ptr: Int64): Int64

foreign func nativeTabWidgetConnectCurrentChanged(
    ptr: Int64,
    code: Int64,
    callback: CFunc<(Int64, CPointer<Unit>) -> Unit>
): Unit

foreign func nativeTabWidgetConnectTabCloseRequested(
    ptr: Int64,
    code: Int64,
    callback: CFunc<(Int64, CPointer<Unit>) -> Unit>
): Unit

foreign func nativeTabWidgetConnectTabBarClicked(
    ptr: Int64,
    code: Int64,
    callback: CFunc<(Int64, CPointer<Unit>) -> Unit>
): Unit

foreign func nativeTabWidgetConnectTabBarDoubleClicked(
    ptr: Int64,
    code: Int64,
    callback: CFunc<(Int64, CPointer<Unit>) -> Unit>
): Unit

public class QTabWidget <: QWidget {
    public let currentChanged: QWidgetSignal<Int64>
    public let tabCloseRequested: QWidgetSignal<Int64>
    public let tabBarClicked: QWidgetSignal<Int64>
    public let tabBarDoubleClicked: QWidgetSignal<Int64>

    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeTabWidgetCreate(parent.ptr)
            }
        )
        currentChanged = QWidgetSignal(
            "currentChanged",
            ptr,
            connectCb: {
                code, callback => unsafe { nativeTabWidgetConnectCurrentChanged(ptr, code, callback) }
            }
        )
        tabCloseRequested = QWidgetSignal(
            "tabCloseRequested",
            ptr,
            connectCb: {
                code, callback => unsafe { nativeTabWidgetConnectTabCloseRequested(ptr, code, callback) }
            }
        )
        tabBarClicked = QWidgetSignal(
            "tabBarClicked",
            ptr,
            connectCb: {
                code, callback => unsafe { nativeTabWidgetConnectTabBarClicked(ptr, code, callback) }
            }
        )
        tabBarDoubleClicked = QWidgetSignal(
            "tabBarDoubleClicked",
            ptr,
            connectCb: {
                code, callback => unsafe { nativeTabWidgetConnectTabBarDoubleClicked(ptr, code, callback) }
            }
        )
    }

    public override func delete() {
        unsafe {
            nativeTabWidgetDelete(ptr)
        }
    }

    public func addTab(widget: QWidget, text: String) {
        unsafe {
            let t=LibC.mallocCString(text)
            nativeTabWidgetAddTab(ptr, widget.ptr, t)
            LibC.free(t)
        }
    }

    public func addTab(widget: QWidget, icon: QIcon, text: String) {
        unsafe {
            let t=LibC.mallocCString(text)
            nativeTabWidgetAddTabWithIcon(ptr, widget.ptr, icon.ptr, t)
            LibC.free(t)
        }
    }

    public func insertTab(index: Int64, widget: QWidget, text: String) {
        unsafe {
            let t=LibC.mallocCString(text)
            nativeTabWidgetInsertTab(ptr, widget.ptr, Int32(index), t)
            LibC.free(t)
        }
    }

    public func insertTab(index: Int64, widget: QWidget, icon: QIcon, text: String) {
        unsafe {
            let t=LibC.mallocCString(text)
            nativeTabWidgetInsertTabWithIcon(ptr, widget.ptr, Int32(index), icon.ptr, t)
            LibC.free(t)
        }
    }

    public func removeTab(index: Int64) {
        unsafe {
            nativeTabWidgetRemoveTab(ptr, Int32(index))
        }
    }

    public func isTabEnabled(index: Int64) {
        unsafe {
            nativeTabWidgetIsTabEnabled(ptr, Int32(index))
        }
    }

    public func setTabEnabled(index: Int64, enabl: Bool) {
        unsafe {
            nativeTabWidgetSetTabEnabled(ptr, Int32(index), enabl)
        }
    }

    public func tabText(index: Int64): String {
        let result = unsafe {
            nativeTabWidgetTabText(ptr, Int32(index))
        }
        return result.toString()
    }

    public func setTabText(index: Int64, text: String) {
        unsafe {
            let t=LibC.mallocCString(text)
            nativeTabWidgetSetTabText(ptr, Int32(index), t)
            LibC.free(t)
        }
    }

    public func tabIcon(index: Int64): QIcon {
        let iconPtr = unsafe {
            nativeTabWidgetTabIcon(ptr, Int32(index))
        }
        return QIcon(iconPtr)
    }

    public func setTabIcon(index: Int64, icon: QIcon) {
        unsafe {
            nativeTabWidgetSetTabIcon(ptr, Int32(index), icon.ptr)
        }
    }

    public func currentIndex(): Int64 {
        let index = unsafe {
            nativeTabWidgetCurrentIndex(ptr)
        }
        return Int64(index)
    }

    public func currentWidget(): QWidget {
        let index = unsafe {
            nativeTabWidgetCurrentWidget(ptr)
        }
        return QWidget(index)
    }

    public func widget(index: Int64): QWidget {
        let idx = unsafe {
            nativeTabWidgetWidget(ptr, Int32(index))
        }
        return QWidget(idx)
    }

    public func indexOf(widget: QWidget): Int64 {
        let count = unsafe {
            nativeTabWidgetIndexOf(ptr, widget.ptr)
        }
        return Int64(count)
    }

    public func count(): Int64 {
        let count = unsafe {
            nativeTabWidgetCount(ptr)
        }
        return Int64(count)
    }

    public func iconSize(): QSize {
        let size = unsafe {
            nativeTabWidgetIconSize(ptr)
        }
        return size
    }

    public func setIconSize(size: QSize) {
        unsafe {
            nativeTabWidgetSetIconSize(ptr, size.width,size.height)
        }
    }

    public func usesScrollButtons(): Bool {
        return unsafe {
            nativeTabWidgetUsesScrollButtons(ptr)
        }
    }

    public func setUsesScrollButtons(useButtons: Bool) {
        unsafe {
            nativeTabWidgetSetUsesScrollButtons(ptr, useButtons)
        }
    }

    public func tabsClosable(): Bool {
        return unsafe {
            nativeTabWidgetTabsClosable(ptr)
        }
    }

    public func setTabsClosable(closable: Bool) {
        unsafe {
            nativeTabWidgetSetTabsClosable(ptr, closable)
        }
    }

    public func isMovable(): Bool {
        return unsafe {
            nativeTabWidgetIsMovable(ptr)
        }
    }

    public func setMovable(movable: Bool) {
        unsafe {
            nativeTabWidgetSetMovable(ptr, movable)
        }
    }

    public func documentMode(): Bool {
        return unsafe {
            nativeTabWidgetDocumentMode(ptr)
        }
    }

    public func setDocumentMode(documentMode: Bool) {
        unsafe {
            nativeTabWidgetSetDocumentMode(ptr, documentMode)
        }
    }

    public func tabBarAutoHide(): Bool {
        return unsafe {
            nativeTabWidgetTabBarAutoHide(ptr)
        }
    }

    public func setTabBarAutoHide(hide: Bool) {
        unsafe {
            nativeTabWidgetSetTabBarAutoHide(ptr, hide)
        }
    }

    public func clear() {
        unsafe {
            nativeTabWidgetClear(ptr)
        }
    }

    public func tabBar(): QTabBar {
        let tabBarPtr = unsafe {
            nativeTabWidgetTabBar(ptr)
        }
        return QTabBar(ptr: tabBarPtr)
    }
}
