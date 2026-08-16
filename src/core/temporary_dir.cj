package cjqt.core

foreign func nativeTemporaryDirCreate(): Int64
foreign func nativeTemporaryDirDelete(ptr: Int64): Unit
foreign func nativeTemporaryDirIsValid(ptr: Int64): Bool
foreign func nativeTemporaryDirPath(ptr: Int64): CString
foreign func nativeTemporaryDirAutoRemove(ptr: Int64): Bool
foreign func nativeTemporaryDirSetAutoRemove(ptr: Int64, b: Bool): Unit

public class QTemporaryDir {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe {
            nativeTemporaryDirCreate()
        }
    }

    public func delete(): Unit {
        unsafe {
            nativeTemporaryDirDelete(ptr)
        }
    }

    public func isValid(): Bool {
        return unsafe {
            nativeTemporaryDirIsValid(ptr)
        }
    }

    public func path(): String {
        return unsafe {
            nativeTemporaryDirPath(ptr).toString()
        }
    }

    public func autoRemove(): Bool {
        return unsafe {
            nativeTemporaryDirAutoRemove(ptr)
        }
    }

    public func setAutoRemove(b: Bool): Unit {
        unsafe {
            nativeTemporaryDirSetAutoRemove(ptr, b)
        }
    }
}
