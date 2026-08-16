package cjqt.core

foreign func nativeFileSystemWatcherCreate(): Int64
foreign func nativeFileSystemWatcherDelete(ptr: Int64): Unit
foreign func nativeFileSystemWatcherAddPath(ptr: Int64, path: CString): Bool
foreign func nativeFileSystemWatcherRemovePath(ptr: Int64, path: CString): Bool
foreign func nativeFileSystemWatcherFiles(ptr: Int64): Int64
foreign func nativeFileSystemWatcherDirectories(ptr: Int64): Int64

public class QFileSystemWatcher {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe {
            nativeFileSystemWatcherCreate()
        }
    }

    public func delete(): Unit {
        unsafe {
            nativeFileSystemWatcherDelete(ptr)
        }
    }

    public func addPath(path: String): Bool {
        return unsafe {
            let p = LibC.mallocCString(path)
            let r = nativeFileSystemWatcherAddPath(ptr, p)
            LibC.free(p)
            r
        }
    }

    public func removePath(path: String): Bool {
        return unsafe {
            let p = LibC.mallocCString(path)
            let r = nativeFileSystemWatcherRemovePath(ptr, p)
            LibC.free(p)
            r
        }
    }

    public func files(): QStringList {
        return QStringList(ptr: unsafe { nativeFileSystemWatcherFiles(ptr) })
    }

    public func directories(): QStringList {
        return QStringList(ptr: unsafe { nativeFileSystemWatcherDirectories(ptr) })
    }
}
