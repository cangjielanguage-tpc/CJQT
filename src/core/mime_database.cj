package cjqt.core

foreign func nativeMimeDatabaseCreate(): Int64
foreign func nativeMimeDatabaseDelete(ptr: Int64): Unit
foreign func nativeMimeDatabaseMimeTypeForName(ptr: Int64, name: CString): Int64
foreign func nativeMimeDatabaseMimeTypeForFile(ptr: Int64, fileName: CString): Int64

public class QMimeDatabase {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativeMimeDatabaseCreate() }
    }

    public func delete(): Unit {
        unsafe { nativeMimeDatabaseDelete(ptr) }
    }

    public func mimeTypeForName(name: String): QMimeType {
        return QMimeType(unsafe {
            let n = LibC.mallocCString(name)
            let r = nativeMimeDatabaseMimeTypeForName(ptr, n)
            LibC.free(n)
            r
        })
    }

    public func mimeTypeForFile(fileName: String): QMimeType {
        return QMimeType(unsafe {
            let f = LibC.mallocCString(fileName)
            let r = nativeMimeDatabaseMimeTypeForFile(ptr, f)
            LibC.free(f)
            r
        })
    }
}
