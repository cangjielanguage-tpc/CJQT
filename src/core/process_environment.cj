package cjqt.core

foreign func nativeProcessEnvCreate(): Int64
foreign func nativeProcessEnvSystemEnvironment(): Int64
foreign func nativeProcessEnvDelete(ptr: Int64): Unit
foreign func nativeProcessEnvIsEmpty(ptr: Int64): Bool
foreign func nativeProcessEnvContains(ptr: Int64, key: CString): Bool
foreign func nativeProcessEnvValue(ptr: Int64, key: CString): CString
foreign func nativeProcessEnvInsert(ptr: Int64, key: CString, value: CString): Unit
foreign func nativeProcessEnvRemove(ptr: Int64, key: CString): Unit
foreign func nativeProcessEnvKeys(ptr: Int64): Int64

public class QProcessEnvironment {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativeProcessEnvCreate() }
    }

    public static func systemEnvironment(): QProcessEnvironment {
        return QProcessEnvironment(unsafe { nativeProcessEnvSystemEnvironment() })
    }

    public func delete(): Unit {
        unsafe { nativeProcessEnvDelete(ptr) }
    }

    public func isEmpty(): Bool {
        return unsafe { nativeProcessEnvIsEmpty(ptr) }
    }

    public func contains(key: String): Bool {
        return unsafe {
            let k = LibC.mallocCString(key)
            let r = nativeProcessEnvContains(ptr, k)
            LibC.free(k)
            r
        }
    }

    public func value(key: String): String {
        return unsafe {
            let k = LibC.mallocCString(key)
            let r = nativeProcessEnvValue(ptr, k).toString()
            LibC.free(k)
            r
        }
    }

    public func insert(key: String, value: String): Unit {
        unsafe {
            let k = LibC.mallocCString(key)
            let v = LibC.mallocCString(value)
            nativeProcessEnvInsert(ptr, k, v)
            LibC.free(k)
            LibC.free(v)
        }
    }

    public func remove(key: String): Unit {
        unsafe {
            let k = LibC.mallocCString(key)
            nativeProcessEnvRemove(ptr, k)
            LibC.free(k)
        }
    }

    public func keys(): QStringList {
        return QStringList(ptr: unsafe { nativeProcessEnvKeys(ptr) })
    }
}
