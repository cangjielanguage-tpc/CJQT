package cjqt.core

foreign func nativeLockFileCreate(path: CString): Int64
foreign func nativeLockFileDelete(ptr: Int64): Unit
foreign func nativeLockFileLock(ptr: Int64): Bool
foreign func nativeLockFileTryLock(ptr: Int64, timeout: Int32): Bool
foreign func nativeLockFileUnlock(ptr: Int64): Unit
foreign func nativeLockFileIsLocked(ptr: Int64): Bool
foreign func nativeLockFileSetStaleLockTime(ptr: Int64, ms: Int32): Unit
foreign func nativeLockFileRemoveStaleLockFile(ptr: Int64): Unit

public class QLockFile {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(path: String) {
        this.ptr = unsafe {
            let p = LibC.mallocCString(path)
            let r = nativeLockFileCreate(p)
            LibC.free(p)
            r
        }
    }

    public func delete(): Unit {
        unsafe { nativeLockFileDelete(ptr) }
    }

    public func lock(): Bool {
        return unsafe { nativeLockFileLock(ptr) }
    }

    public func tryLock(timeout!: Int64 = 0): Bool {
        return unsafe { nativeLockFileTryLock(ptr, Int32(timeout)) }
    }

    public func unlock() {
        unsafe { nativeLockFileUnlock(ptr) }
    }

    public func isLocked(): Bool {
        return unsafe { nativeLockFileIsLocked(ptr) }
    }

    public func setStaleLockTime(ms: Int64) {
        unsafe { nativeLockFileSetStaleLockTime(ptr, Int32(ms)) }
    }

    public func removeStaleLockFile() {
        unsafe { nativeLockFileRemoveStaleLockFile(ptr) }
    }
}
