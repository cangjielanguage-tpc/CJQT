package cjqt.core

foreign func nativeSaveFileCreate(path: CString): Int64
foreign func nativeSaveFileDelete(ptr: Int64): Unit
foreign func nativeSaveFileOpen(ptr: Int64): Bool
foreign func nativeSaveFileWrite(ptr: Int64, data: CString): Int64
foreign func nativeSaveFileCommit(ptr: Int64): Bool
foreign func nativeSaveFileCancelWriting(ptr: Int64): Unit
foreign func nativeSaveFileFileName(ptr: Int64): CString

public class QSaveFile {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(path: String) {
        this.ptr = unsafe {
            let p = LibC.mallocCString(path)
            let r = nativeSaveFileCreate(p)
            LibC.free(p)
            r
        }
    }

    public func delete(): Unit {
        unsafe { nativeSaveFileDelete(ptr) }
    }

    public func open(): Bool {
        return unsafe { nativeSaveFileOpen(ptr) }
    }

    public func write(data: String): Int64 {
        return unsafe {
            let d = LibC.mallocCString(data)
            let r = nativeSaveFileWrite(ptr, d)
            LibC.free(d)
            r
        }
    }

    public func commit(): Bool {
        return unsafe { nativeSaveFileCommit(ptr) }
    }

    public func cancelWriting(): Unit {
        unsafe { nativeSaveFileCancelWriting(ptr) }
    }

    public func fileName(): String {
        return unsafe { nativeSaveFileFileName(ptr).toString() }
    }
}
