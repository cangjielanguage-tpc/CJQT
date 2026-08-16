package cjqt.core

foreign func nativeFileInfoCreate(path: CString): Int64
foreign func nativeFileInfoDelete(ptr: Int64): Unit
foreign func nativeFileInfoExists(ptr: Int64): Bool
foreign func nativeFileInfoFilePath(ptr: Int64): CString
foreign func nativeFileInfoFileName(ptr: Int64): CString
foreign func nativeFileInfoAbsoluteFilePath(ptr: Int64): CString
foreign func nativeFileInfoIsDir(ptr: Int64): Bool
foreign func nativeFileInfoIsFile(ptr: Int64): Bool
foreign func nativeFileInfoIsReadable(ptr: Int64): Bool
foreign func nativeFileInfoIsWritable(ptr: Int64): Bool
foreign func nativeFileInfoSize(ptr: Int64): Int64
foreign func nativeFileInfoSuffix(ptr: Int64): CString
foreign func nativeFileInfoCompleteSuffix(ptr: Int64): CString

public class QFileInfo {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(path: String) {
        this.ptr = unsafe {
            let p = LibC.mallocCString(path)
            let r = nativeFileInfoCreate(p)
            LibC.free(p)
            r
        }
    }

    public func delete(): Unit {
        unsafe {
            nativeFileInfoDelete(ptr)
        }
    }

    public func exists(): Bool {
        return unsafe {
            nativeFileInfoExists(ptr)
        }
    }

    public func filePath(): String {
        return unsafe {
            nativeFileInfoFilePath(ptr).toString()
        }
    }

    public func fileName(): String {
        return unsafe {
            nativeFileInfoFileName(ptr).toString()
        }
    }

    public func absoluteFilePath(): String {
        return unsafe {
            nativeFileInfoAbsoluteFilePath(ptr).toString()
        }
    }

    public func isDir(): Bool {
        return unsafe {
            nativeFileInfoIsDir(ptr)
        }
    }

    public func isFile(): Bool {
        return unsafe {
            nativeFileInfoIsFile(ptr)
        }
    }

    public func isReadable(): Bool {
        return unsafe {
            nativeFileInfoIsReadable(ptr)
        }
    }

    public func isWritable(): Bool {
        return unsafe {
            nativeFileInfoIsWritable(ptr)
        }
    }

    public func size(): Int64 {
        return unsafe {
            nativeFileInfoSize(ptr)
        }
    }

    public func suffix(): String {
        return unsafe {
            nativeFileInfoSuffix(ptr).toString()
        }
    }

    public func completeSuffix(): String {
        return unsafe {
            nativeFileInfoCompleteSuffix(ptr).toString()
        }
    }
}
