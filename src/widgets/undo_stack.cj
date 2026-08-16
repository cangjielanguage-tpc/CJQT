package cjqt.widgets

foreign func nativeUndoStackCreate(parentPtr: Int64): Int64
foreign func nativeUndoStackDelete(ptr: Int64): Unit
foreign func nativeUndoStackUndo(ptr: Int64): Unit
foreign func nativeUndoStackRedo(ptr: Int64): Unit
foreign func nativeUndoStackCount(ptr: Int64): Int32
foreign func nativeUndoStackCanUndo(ptr: Int64): Bool
foreign func nativeUndoStackCanRedo(ptr: Int64): Bool
foreign func nativeUndoStackIsClean(ptr: Int64): Bool
foreign func nativeUndoStackClear(ptr: Int64): Unit
foreign func nativeUndoCommandCreate(text: CString): Int64
foreign func nativeUndoCommandDelete(ptr: Int64): Unit
foreign func nativeUndoCommandSetText(ptr: Int64, text: CString): Unit
foreign func nativeUndoCommandText(ptr: Int64): CString
foreign func nativeUndoCommandChildCount(ptr: Int64): Int32

public class QUndoCommand {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(text: String) {
        this.ptr = unsafe {
            let t = LibC.mallocCString(text)
            let r = nativeUndoCommandCreate(t)
            LibC.free(t)
            r
        }
    }

    public func delete(): Unit {
        unsafe { nativeUndoCommandDelete(ptr) }
    }

    public func setText(text: String) {
        unsafe {
            let t = LibC.mallocCString(text)
            nativeUndoCommandSetText(ptr, t)
            LibC.free(t)
        }
    }

    public func text(): String {
        return unsafe { nativeUndoCommandText(ptr).toString() }
    }

    public func childCount(): Int64 {
        return Int64(unsafe { nativeUndoCommandChildCount(ptr) })
    }
}

public class QUndoStack {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativeUndoStackCreate(0) }
    }

    public func delete(): Unit {
        unsafe { nativeUndoStackDelete(ptr) }
    }

    public func undo() {
        unsafe { nativeUndoStackUndo(ptr) }
    }

    public func redo() {
        unsafe { nativeUndoStackRedo(ptr) }
    }

    public func count(): Int64 {
        return Int64(unsafe { nativeUndoStackCount(ptr) })
    }

    public func canUndo(): Bool {
        return unsafe { nativeUndoStackCanUndo(ptr) }
    }

    public func canRedo(): Bool {
        return unsafe { nativeUndoStackCanRedo(ptr) }
    }

    public func isClean(): Bool {
        return unsafe { nativeUndoStackIsClean(ptr) }
    }

    public func clear() {
        unsafe { nativeUndoStackClear(ptr) }
    }
}
