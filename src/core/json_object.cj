package cjqt.core

foreign func nativeJsonObjectCreate(): Int64
foreign func nativeJsonObjectDelete(ptr: Int64): Unit
foreign func nativeJsonObjectSize(ptr: Int64): Int32
foreign func nativeJsonObjectIsEmpty(ptr: Int64): Bool
foreign func nativeJsonObjectContains(ptr: Int64, key: CString): Bool
foreign func nativeJsonObjectValue(ptr: Int64, key: CString): Int64
foreign func nativeJsonObjectInsert(ptr: Int64, key: CString, valuePtr: Int64): Unit
foreign func nativeJsonObjectRemove(ptr: Int64, key: CString): Unit
foreign func nativeJsonObjectKeys(ptr: Int64): Int64
foreign func nativeJsonObjectToString(ptr: Int64): CString
foreign func nativeJsonObjectFromString(str: CString): Int64

public class QJsonObject {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativeJsonObjectCreate() }
    }

    public func delete(): Unit {
        unsafe { nativeJsonObjectDelete(ptr) }
    }

    public func size(): Int64 {
        return Int64(unsafe { nativeJsonObjectSize(ptr) })
    }

    public func isEmpty(): Bool {
        return unsafe { nativeJsonObjectIsEmpty(ptr) }
    }

    public func contains(key: String): Bool {
        return unsafe {
            let k = LibC.mallocCString(key)
            let r = nativeJsonObjectContains(ptr, k)
            LibC.free(k)
            r
        }
    }

    public func value(key: String): QJsonValue {
        return QJsonValue(unsafe {
            let k = LibC.mallocCString(key)
            let r = nativeJsonObjectValue(ptr, k)
            LibC.free(k)
            r
        })
    }

    public func insert(key: String, value: QJsonValue): Unit {
        unsafe {
            let k = LibC.mallocCString(key)
            nativeJsonObjectInsert(ptr, k, value.ptr)
            LibC.free(k)
        }
    }

    public func remove(key: String): Unit {
        unsafe {
            let k = LibC.mallocCString(key)
            nativeJsonObjectRemove(ptr, k)
            LibC.free(k)
        }
    }

    public func keys(): QStringList {
        return QStringList(ptr: unsafe { nativeJsonObjectKeys(ptr) })
    }

    public func toString(): String {
        return unsafe { nativeJsonObjectToString(ptr).toString() }
    }

    public static func fromString(str: String): QJsonObject {
        let p = unsafe {
            let s = LibC.mallocCString(str)
            let r = nativeJsonObjectFromString(s)
            LibC.free(s)
            r
        }
        return QJsonObject(p)
    }
}
