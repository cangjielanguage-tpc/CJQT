package cjqt.widgets

import cjqt.gui.*

foreign func nativeSystemTrayIconCreate(parentPtr: Int64): Int64
foreign func nativeSystemTrayIconDelete(ptr: Int64): Unit
foreign func nativeSystemTrayIconSetIcon(ptr: Int64, iconPtr: Int64): Unit
foreign func nativeSystemTrayIconSetToolTip(ptr: Int64, tip: CString): Unit
foreign func nativeSystemTrayIconToolTip(ptr: Int64): CString
foreign func nativeSystemTrayIconSetVisible(ptr: Int64, visible: Bool): Unit
foreign func nativeSystemTrayIconIsVisible(ptr: Int64): Bool
foreign func nativeSystemTrayIconShowMessage(ptr: Int64, title: CString, message: CString): Unit

public class QSystemTrayIcon {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativeSystemTrayIconCreate(0) }
    }

    public func delete(): Unit {
        unsafe { nativeSystemTrayIconDelete(ptr) }
    }

    public func setIcon(icon: QIcon) {
        unsafe { nativeSystemTrayIconSetIcon(ptr, icon.ptr) }
    }

    public func setToolTip(tip: String) {
        unsafe {
            let t = LibC.mallocCString(tip)
            nativeSystemTrayIconSetToolTip(ptr, t)
            LibC.free(t)
        }
    }

    public func toolTip(): String {
        return unsafe { nativeSystemTrayIconToolTip(ptr).toString() }
    }

    public func setVisible(visible: Bool) {
        unsafe { nativeSystemTrayIconSetVisible(ptr, visible) }
    }

    public func isVisible(): Bool {
        return unsafe { nativeSystemTrayIconIsVisible(ptr) }
    }

    public func showMessage(title: String, message: String) {
        unsafe {
            let t = LibC.mallocCString(title)
            let m = LibC.mallocCString(message)
            nativeSystemTrayIconShowMessage(ptr, t, m)
            LibC.free(t)
            LibC.free(m)
        }
    }
}
