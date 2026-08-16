package cjqt.core

foreign func nativeByteArrayCreate(): Int64
foreign func nativeByteArrayCreateFromString(str: CString): Int64
foreign func nativeByteArrayDelete(ptr: Int64): Unit
foreign func nativeByteArraySize(ptr: Int64): Int32
foreign func nativeByteArrayIsEmpty(ptr: Int64): Bool
foreign func nativeByteArrayToCString(ptr: Int64): CString
foreign func nativeByteArrayAt(ptr: Int64, index: Int32): Int8
foreign func nativeByteArrayAppend(ptr: Int64, data: CString): Unit
foreign func nativeByteArrayPrepend(ptr: Int64, data: CString): Unit
foreign func nativeByteArrayClear(ptr: Int64): Unit
foreign func nativeByteArrayContains(ptr: Int64, data: CString): Bool
foreign func nativeByteArrayIndexOf(ptr: Int64, data: CString): Int32

public class QByteArray {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe {
            nativeByteArrayCreate()
        }
    }

    public init(str: String) {
        this.ptr = unsafe {
            let s = LibC.mallocCString(str)
            let r = nativeByteArrayCreateFromString(s)
            LibC.free(s)
            r
        }
    }

    public func delete(): Unit {
        unsafe {
            nativeByteArrayDelete(ptr)
        }
    }

    public func size(): Int64 {
        return Int64(unsafe {
            nativeByteArraySize(ptr)
        })
    }

    public func isEmpty(): Bool {
        return unsafe {
            nativeByteArrayIsEmpty(ptr)
        }
    }

    public func toString(): String {
        return unsafe {
            nativeByteArrayToCString(ptr).toString()
        }
    }

    public func at(index: Int64): Int64 {
        return Int64(unsafe {
            nativeByteArrayAt(ptr, Int32(index))
        })
    }

    public func append(data: String): Unit {
        unsafe {
            let d = LibC.mallocCString(data)
            nativeByteArrayAppend(ptr, d)
            LibC.free(d)
        }
    }

    public func prepend(data: String): Unit {
        unsafe {
            let d = LibC.mallocCString(data)
            nativeByteArrayPrepend(ptr, d)
            LibC.free(d)
        }
    }

    public func clear(): Unit {
        unsafe {
            nativeByteArrayClear(ptr)
        }
    }

    public func contains(data: String): Bool {
        return unsafe {
            let d = LibC.mallocCString(data)
            let r = nativeByteArrayContains(ptr, d)
            LibC.free(d)
            r
        }
    }

    public func indexOf(data: String): Int64 {
        return Int64(unsafe {
            let d = LibC.mallocCString(data)
            let r = nativeByteArrayIndexOf(ptr, d)
            LibC.free(d)
            r
        })
    }
}
