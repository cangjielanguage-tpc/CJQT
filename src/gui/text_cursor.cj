package cjqt.gui

foreign func nativeTextCursorCreate(docPtr: Int64): Int64
foreign func nativeTextCursorDelete(ptr: Int64): Unit
foreign func nativeTextCursorInsertText(ptr: Int64, text: CString): Unit
foreign func nativeTextCursorPosition(ptr: Int64): Int32
foreign func nativeTextCursorSetPosition(ptr: Int64, pos: Int32): Unit
foreign func nativeTextCursorSelectAll(ptr: Int64): Unit
foreign func nativeTextCursorClearSelection(ptr: Int64): Unit
foreign func nativeTextCursorHasSelection(ptr: Int64): Bool

public class QTextCursor {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(document: QTextDocument) {
        this.ptr = unsafe { nativeTextCursorCreate(document.ptr) }
    }

    public func delete(): Unit {
        unsafe { nativeTextCursorDelete(ptr) }
    }

    public func insertText(text: String) {
        unsafe {
            let t = LibC.mallocCString(text)
            nativeTextCursorInsertText(ptr, t)
            LibC.free(t)
        }
    }

    public func position(): Int64 {
        return Int64(unsafe { nativeTextCursorPosition(ptr) })
    }

    public func setPosition(pos: Int64) {
        unsafe { nativeTextCursorSetPosition(ptr, Int32(pos)) }
    }

    public func selectAll() {
        unsafe { nativeTextCursorSelectAll(ptr) }
    }

    public func clearSelection() {
        unsafe { nativeTextCursorClearSelection(ptr) }
    }

    public func hasSelection(): Bool {
        return unsafe { nativeTextCursorHasSelection(ptr) }
    }
}
