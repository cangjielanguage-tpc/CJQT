package cjqt.widgets

foreign func nativeShortcutCreate(keyStr: CString, parentPtr: Int64): Int64
foreign func nativeShortcutDelete(ptr: Int64): Unit
foreign func nativeShortcutSetEnabled(ptr: Int64, b: Bool): Unit
foreign func nativeShortcutIsEnabled(ptr: Int64): Bool

public class QShortcut {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(keyStr: String, parent: QWidget) {
        this.ptr = unsafe {
            let k = LibC.mallocCString(keyStr)
            let r = nativeShortcutCreate(k, parent.ptr)
            LibC.free(k)
            r
        }
    }

    public func delete(): Unit {
        unsafe { nativeShortcutDelete(ptr) }
    }

    public func setEnabled(b: Bool) {
        unsafe { nativeShortcutSetEnabled(ptr, b) }
    }

    public func isEnabled(): Bool {
        return unsafe { nativeShortcutIsEnabled(ptr) }
    }
}
