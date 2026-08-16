package cjqt.core

foreign func nativeSettingsCreate(organization: CString, app: CString): Int64
foreign func nativeSettingsDelete(ptr: Int64): Unit
foreign func nativeSettingsValue(ptr: Int64, key: CString): CString
foreign func nativeSettingsSetValue(ptr: Int64, key: CString, value: CString): Unit
foreign func nativeSettingsContains(ptr: Int64, key: CString): Bool
foreign func nativeSettingsRemove(ptr: Int64, key: CString): Unit
foreign func nativeSettingsSync(ptr: Int64): Unit
foreign func nativeSettingsAllKeys(ptr: Int64): Int64

public class QSettings {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(organization: String, app: String) {
        this.ptr = unsafe {
            let o = LibC.mallocCString(organization)
            let a = LibC.mallocCString(app)
            let r = nativeSettingsCreate(o, a)
            LibC.free(o)
            LibC.free(a)
            r
        }
    }

    public func delete(): Unit {
        unsafe {
            nativeSettingsDelete(ptr)
        }
    }

    public func value(key: String): String {
        return unsafe {
            let k = LibC.mallocCString(key)
            let r = nativeSettingsValue(ptr, k).toString()
            LibC.free(k)
            r
        }
    }

    public func setValue(key: String, value: String): Unit {
        unsafe {
            let k = LibC.mallocCString(key)
            let v = LibC.mallocCString(value)
            nativeSettingsSetValue(ptr, k, v)
            LibC.free(k)
            LibC.free(v)
        }
    }

    public func contains(key: String): Bool {
        return unsafe {
            let k = LibC.mallocCString(key)
            let r = nativeSettingsContains(ptr, k)
            LibC.free(k)
            r
        }
    }

    public func remove(key: String): Unit {
        unsafe {
            let k = LibC.mallocCString(key)
            nativeSettingsRemove(ptr, k)
            LibC.free(k)
        }
    }

    public func sync(): Unit {
        unsafe {
            nativeSettingsSync(ptr)
        }
    }

    public func allKeys(): QStringList {
        let listPtr = unsafe {
            nativeSettingsAllKeys(ptr)
        }
        return QStringList(ptr: listPtr)
    }
}
