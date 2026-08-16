package cjqt.core

foreign func nativeDirIteratorCreate(path: CString): Int64
foreign func nativeDirIteratorDelete(ptr: Int64): Unit
foreign func nativeDirIteratorHasNext(ptr: Int64): Bool
foreign func nativeDirIteratorNext(ptr: Int64): CString
foreign func nativeDirIteratorFileName(ptr: Int64): CString

public class QDirIterator {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(path: String) {
        this.ptr = unsafe {
            let p = LibC.mallocCString(path)
            let r = nativeDirIteratorCreate(p)
            LibC.free(p)
            r
        }
    }

    public func delete(): Unit {
        unsafe {
            nativeDirIteratorDelete(ptr)
        }
    }

    public func hasNext(): Bool {
        return unsafe {
            nativeDirIteratorHasNext(ptr)
        }
    }

    public func next(): String {
        return unsafe {
            nativeDirIteratorNext(ptr).toString()
        }
    }

    public func fileName(): String {
        return unsafe {
            nativeDirIteratorFileName(ptr).toString()
        }
    }
}
