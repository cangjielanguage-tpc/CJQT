package cjqt.core

foreign func nativeDirCreate(path: CString): Int64
foreign func nativeDirDelete(ptr: Int64): Unit
foreign func nativeDirExists(ptr: Int64): Bool
foreign func nativeDirPath(ptr: Int64): CString
foreign func nativeDirAbsolutePath(ptr: Int64): CString
foreign func nativeDirMakePath(ptr: Int64, dirPath: CString): Bool
foreign func nativeDirRemove(ptr: Int64, fileName: CString): Bool
foreign func nativeDirRemoveRecursively(ptr: Int64): Bool
foreign func nativeDirIsEmpty(ptr: Int64): Bool
foreign func nativeDirEntryCount(ptr: Int64): Int32
foreign func nativeDirEntryList(ptr: Int64): Int64

public class QDir {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(path: String) {
        this.ptr = unsafe {
            let p = LibC.mallocCString(path)
            let r = nativeDirCreate(p)
            LibC.free(p)
            r
        }
    }

    public func delete(): Unit {
        unsafe {
            nativeDirDelete(ptr)
        }
    }

    public func exists(): Bool {
        return unsafe {
            nativeDirExists(ptr)
        }
    }

    public func path(): String {
        return unsafe {
            nativeDirPath(ptr).toString()
        }
    }

    public func absolutePath(): String {
        return unsafe {
            nativeDirAbsolutePath(ptr).toString()
        }
    }

    public func mkpath(dirPath: String): Bool {
        return unsafe {
            let p = LibC.mallocCString(dirPath)
            let r = nativeDirMakePath(ptr, p)
            LibC.free(p)
            r
        }
    }

    public func remove(fileName: String): Bool {
        return unsafe {
            let p = LibC.mallocCString(fileName)
            let r = nativeDirRemove(ptr, p)
            LibC.free(p)
            r
        }
    }

    public func removeRecursively(): Bool {
        return unsafe {
            nativeDirRemoveRecursively(ptr)
        }
    }

    public func isEmpty(): Bool {
        return unsafe {
            nativeDirIsEmpty(ptr)
        }
    }

    public func entryCount(): Int64 {
        return Int64(unsafe {
            nativeDirEntryCount(ptr)
        })
    }

    public func entryList(): QStringList {
        let listPtr = unsafe {
            nativeDirEntryList(ptr)
        }
        return QStringList(ptr: listPtr)
    }
}
