package cjqt.widgets

foreign func nativeFileSystemModelCreate(parentPtr: Int64): Int64
foreign func nativeFileSystemModelDelete(ptr: Int64): Unit
foreign func nativeFileSystemModelSetRootPath(ptr: Int64, path: CString): Unit
foreign func nativeFileSystemModelRootPath(ptr: Int64): CString
foreign func nativeFileSystemModelRowCount(ptr: Int64): Int32

public class QFileSystemModel {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativeFileSystemModelCreate(0) }
    }

    public func delete(): Unit {
        unsafe { nativeFileSystemModelDelete(ptr) }
    }

    public func setRootPath(path: String) {
        unsafe {
            let p = LibC.mallocCString(path)
            nativeFileSystemModelSetRootPath(ptr, p)
            LibC.free(p)
        }
    }

    public func rootPath(): String {
        return unsafe { nativeFileSystemModelRootPath(ptr).toString() }
    }

    public func rowCount(): Int64 {
        return Int64(unsafe { nativeFileSystemModelRowCount(ptr) })
    }
}
