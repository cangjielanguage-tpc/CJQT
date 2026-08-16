package cjqt.core

foreign func nativeUrlQueryCreate(): Int64
foreign func nativeUrlQueryCreateFromString(query: CString): Int64
foreign func nativeUrlQueryDelete(ptr: Int64): Unit
foreign func nativeUrlQueryIsEmpty(ptr: Int64): Bool
foreign func nativeUrlQueryQueryString(ptr: Int64): CString
foreign func nativeUrlQueryQueryItemValue(ptr: Int64, key: CString): CString
foreign func nativeUrlQueryAddQueryItem(ptr: Int64, key: CString, value: CString): Unit
foreign func nativeUrlQueryRemoveQueryItem(ptr: Int64, key: CString): Unit
foreign func nativeUrlQueryHasQueryItem(ptr: Int64, key: CString): Bool

public class QUrlQuery {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativeUrlQueryCreate() }
    }

    public init(query: String) {
        this.ptr = unsafe {
            let q = LibC.mallocCString(query)
            let r = nativeUrlQueryCreateFromString(q)
            LibC.free(q)
            r
        }
    }

    public func delete(): Unit {
        unsafe { nativeUrlQueryDelete(ptr) }
    }

    public func isEmpty(): Bool {
        return unsafe { nativeUrlQueryIsEmpty(ptr) }
    }

    public func query(): String {
        return unsafe { nativeUrlQueryQueryString(ptr).toString() }
    }

    public func queryItemValue(key: String): String {
        return unsafe {
            let k = LibC.mallocCString(key)
            let r = nativeUrlQueryQueryItemValue(ptr, k).toString()
            LibC.free(k)
            r
        }
    }

    public func addQueryItem(key: String, value: String): Unit {
        unsafe {
            let k = LibC.mallocCString(key)
            let v = LibC.mallocCString(value)
            nativeUrlQueryAddQueryItem(ptr, k, v)
            LibC.free(k)
            LibC.free(v)
        }
    }

    public func removeQueryItem(key: String): Unit {
        unsafe {
            let k = LibC.mallocCString(key)
            nativeUrlQueryRemoveQueryItem(ptr, k)
            LibC.free(k)
        }
    }

    public func hasQueryItem(key: String): Bool {
        return unsafe {
            let k = LibC.mallocCString(key)
            let r = nativeUrlQueryHasQueryItem(ptr, k)
            LibC.free(k)
            r
        }
    }
}
