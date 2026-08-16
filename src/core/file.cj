package cjqt.core

foreign func nativeFileCreate(path: CString): Int64
foreign func nativeFileDelete(ptr: Int64): Unit
foreign func nativeFileExists(ptr: Int64): Bool
foreign func nativeFileOpen(ptr: Int64, mode: Int32): Bool
foreign func nativeFileClose(ptr: Int64): Unit
foreign func nativeFileIsOpen(ptr: Int64): Bool
foreign func nativeFileFlush(ptr: Int64): Bool
foreign func nativeFileReadAll(ptr: Int64): CString
foreign func nativeFileWrite(ptr: Int64, data: CString, length: Int32): Int64
foreign func nativeFileSize(ptr: Int64): Int64
foreign func nativeFileFileName(ptr: Int64): CString
foreign func nativeFileRemove(ptr: Int64): Bool
foreign func nativeFileRename(ptr: Int64, newName: CString): Bool
foreign func nativeFileExistsPath(path: CString): Bool
foreign func nativeFileRemovePath(path: CString): Bool

public enum QIODeviceOpenMode {
    | NotOpen
    | ReadOnly
    | WriteOnly
    | ReadWrite
    | Append
    | Truncate

    public func value(): Int32 {
        return match (this) {
            case NotOpen => 0x0000
            case ReadOnly => 0x0001
            case WriteOnly => 0x0002
            case ReadWrite => 0x0003
            case Append => 0x0004
            case Truncate => 0x0008
        }
    }
}

public class QFile {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(path: String) {
        this.ptr = unsafe {
            let p = LibC.mallocCString(path)
            let r = nativeFileCreate(p)
            LibC.free(p)
            r
        }
    }

    public func delete(): Unit {
        unsafe {
            nativeFileDelete(ptr)
        }
    }

    public func exists(): Bool {
        return unsafe {
            nativeFileExists(ptr)
        }
    }

    public func open(mode: QIODeviceOpenMode): Bool {
        return unsafe {
            nativeFileOpen(ptr, mode.value())
        }
    }

    public func close(): Unit {
        unsafe {
            nativeFileClose(ptr)
        }
    }

    public func isOpen(): Bool {
        return unsafe {
            nativeFileIsOpen(ptr)
        }
    }

    public func flush(): Bool {
        return unsafe {
            nativeFileFlush(ptr)
        }
    }

    public func readAll(): String {
        return unsafe {
            nativeFileReadAll(ptr).toString()
        }
    }

    public func write(data: String): Int64 {
        return unsafe {
            let d = LibC.mallocCString(data)
            let r = nativeFileWrite(ptr, d, Int32(data.size))
            LibC.free(d)
            r
        }
    }

    public func size(): Int64 {
        return unsafe {
            nativeFileSize(ptr)
        }
    }

    public func fileName(): String {
        return unsafe {
            nativeFileFileName(ptr).toString()
        }
    }

    public func remove(): Bool {
        return unsafe {
            nativeFileRemove(ptr)
        }
    }

    public func rename(newName: String): Bool {
        return unsafe {
            let n = LibC.mallocCString(newName)
            let r = nativeFileRename(ptr, n)
            LibC.free(n)
            r
        }
    }

    public static func existsPath(path: String): Bool {
        return unsafe {
            let p = LibC.mallocCString(path)
            let r = nativeFileExistsPath(p)
            LibC.free(p)
            r
        }
    }

    public static func removePath(path: String): Bool {
        return unsafe {
            let p = LibC.mallocCString(path)
            let r = nativeFileRemovePath(p)
            LibC.free(p)
            r
        }
    }
}
