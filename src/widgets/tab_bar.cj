package cjqt.widgets

import cjqt.gui.*
import cjqt.core.*

foreign func nativeTabBarCreate(parentPtr: Int64): Int64
foreign func nativeTabBarDelete(ptr: Int64): Unit

foreign func nativeTabBarAddTab(ptr: Int64, text: CString): Unit
foreign func nativeTabBarAddTabWithIcon(ptr: Int64, iconPtr: Int64, text: CString): Unit
foreign func nativeTabBarInsertTab(ptr: Int64, index: Int32, text: CString): Unit
foreign func nativeTabBarInsertTabWithIcon(ptr: Int64, index: Int32, iconPtr: Int64, text: CString): Unit
foreign func nativeTabBarRemoveTab(ptr: Int64, index: Int32): Unit
foreign func nativeTabBarMoveTab(ptr: Int64, fromIndex: Int32, toIndex: Int32): Unit
foreign func nativeTabBarIsTabEnabled(ptr: Int64, index: Int32): Bool
foreign func nativeTabBarSetTabEnabled(ptr: Int64, index: Int32, enabl: Bool): Unit
foreign func nativeTabBarSetTabText(ptr: Int64, index: Int32, text: CString): Unit
foreign func nativeTabBarTabText(ptr: Int64, index: Int32): CString
foreign func nativeTabBarSetTabTextColor(ptr: Int64, index: Int32, colorPtr: Int64): Unit
foreign func nativeTabBarTabTextColor(ptr: Int64, index: Int32): Int64
foreign func nativeTabBarSetTabIcon(ptr: Int64, index: Int32, iconPtr: Int64): Unit
foreign func nativeTabBarTabIcon(ptr: Int64, index: Int32): Int64
foreign func nativeTabBarTabRect(ptr: Int64, index: Int32): Int64
foreign func nativeTabBarTabAt(ptr: Int64, pointPtr: Int64): Int32
foreign func nativeTabBarCurrentIndex(ptr: Int64): Int32
foreign func nativeTabBarCount(ptr: Int64): Int32
foreign func nativeTabBarDrawBase(ptr: Int64): Bool
foreign func nativeTabBarSetDrawBase(ptr: Int64, drawTheBase: Bool): Unit
foreign func nativeTabBarIconSize(ptr: Int64): Int64
foreign func nativeTabBarSetIconSize(ptr: Int64, sizePtr: Int64): Unit
foreign func nativeTabBarUsesScrollButtons(ptr: Int64): Bool
foreign func nativeTabBarSetUsesScrollButtons(ptr: Int64, useButtons: Bool): Unit
foreign func nativeTabBarTabsClosable(ptr: Int64): Bool
foreign func nativeTabBarSetTabsClosable(ptr: Int64, closable: Bool): Unit
foreign func nativeTabBarExpanding(ptr: Int64): Bool
foreign func nativeTabBarSetExpanding(ptr: Int64, expanding: Bool): Unit
foreign func nativeTabBarIsMovable(ptr: Int64): Bool
foreign func nativeTabBarSetMovable(ptr: Int64, movable: Bool): Unit
foreign func nativeTabBarDocumentMode(ptr: Int64): Bool
foreign func nativeTabBarSetDocumentMode(ptr: Int64, documentMode: Bool): Unit
foreign func nativeTabBarAutoHide(ptr: Int64): Bool
foreign func nativeTabBarSetAutoHide(ptr: Int64, hide: Bool): Unit
foreign func nativeTabBarChangeCurrentOnDrag(ptr: Int64): Bool
foreign func nativeTabBarSetChangeCurrentOnDrag(ptr: Int64, change: Bool): Unit

foreign func nativeTabBarConnectCurrentChanged(
    ptr: Int64,
    code: Int64,
    callback: CFunc<(Int64, CPointer<Unit>) -> Unit>
): Unit

foreign func nativeTabBarConnectTabCloseRequested(
    ptr: Int64,
    code: Int64,
    callback: CFunc<(Int64, CPointer<Unit>) -> Unit>
): Unit

foreign func nativeTabBarConnectTabMoved(
    ptr: Int64,
    code: Int64,
    callback: CFunc<(Int64, CPointer<Unit>) -> Unit>
): Unit

foreign func nativeTabBarConnectTabBarClicked(
    ptr: Int64,
    code: Int64,
    callback: CFunc<(Int64, CPointer<Unit>) -> Unit>
): Unit

foreign func nativeTabBarConnectTabBarDoubleClicked(
    ptr: Int64,
    code: Int64,
    callback: CFunc<(Int64, CPointer<Unit>) -> Unit>
): Unit

public class QTabBar <: QWidget {
    public let currentChanged: QWidgetSignal<Int64>
    public let tabCloseRequested: QWidgetSignal<Int64>
    public let tabMoved: QWidgetSignal<(Int64, Int64)>
    public let tabBarClicked: QWidgetSignal<Int64>
    public let tabBarDoubleClicked: QWidgetSignal<Int64>

    public init(ptr!: Int64 = 0, parent!: QWidget = QWidget(0)) {
        super(
            if (ptr != 0) {
                ptr
            } else {
                unsafe {
                    nativeTabBarCreate(parent.ptr)
                }
            }
        )
        currentChanged = QWidgetSignal(
            "currentChanged",
            ptr,
            connectCb: {
                code, callback => unsafe { nativeTabBarConnectCurrentChanged(ptr, code, callback) }
            }
        )
        tabCloseRequested = QWidgetSignal(
            "tabCloseRequested",
            ptr,
            connectCb: {
                code, callback => unsafe { nativeTabBarConnectTabCloseRequested(ptr, code, callback) }
            }
        )
        tabMoved = QWidgetSignal(
            "tabMoved",
            ptr,
            connectCb: {
                code, callback => unsafe { nativeTabBarConnectTabMoved(ptr, code, callback) }
            }
        )
        tabBarClicked = QWidgetSignal(
            "tabBarClicked",
            ptr,
            connectCb: {
                code, callback => unsafe { nativeTabBarConnectTabBarClicked(ptr, code, callback) }
            }
        )
        tabBarDoubleClicked = QWidgetSignal(
            "tabBarDoubleClicked",
            ptr,
            connectCb: {
                code, callback => unsafe { nativeTabBarConnectTabBarDoubleClicked(ptr, code, callback) }
            }
        )
    }

    public override func delete() {
        unsafe {
            nativeTabBarDelete(ptr)
        }
    }

    public func addTab(text: String) {
        unsafe {
            nativeTabBarAddTab(ptr, LibC.mallocCString(text))
        }
    }

    public func addTab(icon: QIcon, text: String) {
        unsafe {
            nativeTabBarAddTabWithIcon(ptr, icon.ptr, LibC.mallocCString(text))
        }
    }

    public func insertTab(index: Int64, text: String) {
        unsafe {
            nativeTabBarInsertTab(ptr, Int32(index), LibC.mallocCString(text))
        }
    }

    public func insertTab(index: Int64, icon: QIcon, text: String) {
        unsafe {
            nativeTabBarInsertTabWithIcon(ptr, Int32(index), icon.ptr, LibC.mallocCString(text))
        }
    }

    public func removeTab(index: Int64) {
        unsafe {
            nativeTabBarRemoveTab(ptr, Int32(index))
        }
    }

    public func moveTab(fromIndex: Int64, toIndex: Int64) {
        unsafe {
            nativeTabBarMoveTab(ptr, Int32(fromIndex), Int32(toIndex))
        }
    }

    public func isTabEnabled(index: Int64) {
        unsafe {
            nativeTabBarIsTabEnabled(ptr, Int32(index))
        }
    }

    public func setTabEnabled(index: Int64, enabl: Bool) {
        unsafe {
            nativeTabBarSetTabEnabled(ptr, Int32(index), enabl)
        }
    }

    public func tabText(index: Int64): String {
        let result = unsafe {
            nativeTabBarTabText(ptr, Int32(index))
        }
        return result.toString()
    }

    public func setTabText(index: Int64, text: String) {
        unsafe {
            nativeTabBarSetTabText(ptr, Int32(index), LibC.mallocCString(text))
        }
    }

    public func tabTextColor(index: Int64): QColor {
        let colorPtr = unsafe {
            nativeTabBarTabTextColor(ptr, Int32(index))
        }
        return QColor(ptr: colorPtr)
    }

    public func setTabTextColor(index: Int64, color: QColor) {
        unsafe {
            nativeTabBarSetTabTextColor(ptr, Int32(index), color.ptr)
        }
    }

    public func tabIcon(index: Int64): QIcon {
        let iconPtr = unsafe {
            nativeTabBarTabIcon(ptr, Int32(index))
        }
        return QIcon(iconPtr)
    }

    public func setTabIcon(index: Int64, icon: QIcon) {
        unsafe {
            nativeTabBarSetTabIcon(ptr, Int32(index), icon.ptr)
        }
    }

    public func tabRect(index: Int64): QRect {
        let rectPtr = unsafe {
            nativeTabBarTabRect(ptr, Int32(index))
        }
        return QRect(rectPtr)
    }

    public func tabAt(point: QPoint): Int64 {
        let index = unsafe {
            nativeTabBarTabAt(ptr, point.ptr)
        }
        return Int64(index)
    }

    public func currentIndex(): Int64 {
        let index = unsafe {
            nativeTabBarCurrentIndex(ptr)
        }
        return Int64(index)
    }

    public func count(): Int64 {
        let count = unsafe {
            nativeTabBarCount(ptr)
        }
        return Int64(count)
    }

    public func drawBase(): Bool {
        return unsafe {
            nativeTabBarDrawBase(ptr)
        }
    }

    public func setDrawBase(drawTheBase: Bool) {
        unsafe {
            nativeTabBarSetDrawBase(ptr, drawTheBase)
        }
    }

    public func iconSize(): QSize {
        let sizePtr = unsafe {
            nativeTabBarIconSize(ptr)
        }
        return QSize(sizePtr)
    }

    public func setIconSize(size: QSize) {
        unsafe {
            nativeTabBarSetIconSize(ptr, size.ptr)
        }
    }

    public func usesScrollButtons(): Bool {
        return unsafe {
            nativeTabBarUsesScrollButtons(ptr)
        }
    }

    public func setUsesScrollButtons(useButtons: Bool) {
        unsafe {
            nativeTabBarSetUsesScrollButtons(ptr, useButtons)
        }
    }

    public func tabsClosable(): Bool {
        return unsafe {
            nativeTabBarTabsClosable(ptr)
        }
    }

    public func setTabsClosable(closable: Bool) {
        unsafe {
            nativeTabBarSetTabsClosable(ptr, closable)
        }
    }

    public func expanding(): Bool {
        return unsafe {
            nativeTabBarExpanding(ptr)
        }
    }

    public func setExpanding(expanding: Bool) {
        unsafe {
            nativeTabBarSetExpanding(ptr, expanding)
        }
    }

    public func isMovable(): Bool {
        return unsafe {
            nativeTabBarIsMovable(ptr)
        }
    }

    public func setMovable(movable: Bool) {
        unsafe {
            nativeTabBarSetMovable(ptr, movable)
        }
    }

    public func documentMode(): Bool {
        return unsafe {
            nativeTabBarDocumentMode(ptr)
        }
    }

    public func setDocumentMode(documentMode: Bool) {
        unsafe {
            nativeTabBarSetDocumentMode(ptr, documentMode)
        }
    }

    public func autoHide(): Bool {
        return unsafe {
            nativeTabBarAutoHide(ptr)
        }
    }

    public func setAutoHide(hide: Bool) {
        unsafe {
            nativeTabBarSetAutoHide(ptr, hide)
        }
    }

    public func changeCurrentOnDrag(): Bool {
        return unsafe {
            nativeTabBarChangeCurrentOnDrag(ptr)
        }
    }

    public func setChangeCurrentOnDrag(change: Bool) {
        unsafe {
            nativeTabBarSetChangeCurrentOnDrag(ptr, change)
        }
    }
}
