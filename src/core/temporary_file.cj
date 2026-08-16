package cjqt.core

foreign func nativeTemporaryFileCreate(): Int64
foreign func nativeTemporaryFileDelete(ptr: Int64): Unit
foreign func nativeTemporaryFileOpen(ptr: Int64): Bool
foreign func nativeTemporaryFileFileName(ptr: Int64): CString
foreign func nativeTemporaryFileWrite(ptr: Int64, data: CString): Int64
foreign func nativeTemporaryFileReadAll(ptr: Int64): CString
foreign func nativeTemporaryFileAutoRemove(ptr: Int64): Bool
foreign func nativeTemporaryFileSetAutoRemove(ptr: Int64, b: Bool): Unit

public class QTemporaryFile {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe {
            nativeTemporaryFileCreate()
        }
    }

    public func delete(): Unit {
        unsafe {
            nativeTemporaryFileDelete(ptr)
        }
    }

    public func open(): Bool {
        return unsafe {
            nativeTemporaryFileOpen(ptr)
        }
    }

    public func fileName(): String {
        return unsafe {
            nativeTemporaryFileFileName(ptr).toString()
        }
    }

    public func write(data: String): Int64 {
        return unsafe {
            let d = LibC.mallocCString(data)
            let r = nativeTemporaryFileWrite(ptr, d)
            LibC.free(d)
            r
        }
    }

    public func readAll(): String {
        return unsafe {
            nativeTemporaryFileReadAll(ptr).toString()
        }
    }

    public func autoRemove(): Bool {
        return unsafe {
            nativeTemporaryFileAutoRemove(ptr)
        }
    }

    public func setAutoRemove(b: Bool): Unit {
        unsafe {
            nativeTemporaryFileSetAutoRemove(ptr, b)
        }
    }
}
