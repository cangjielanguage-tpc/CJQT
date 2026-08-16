package cjqt.core

foreign func nativeUuidCreate(): Int64
foreign func nativeUuidCreateFromString(str: CString): Int64
foreign func nativeUuidDelete(ptr: Int64): Unit
foreign func nativeUuidToString(ptr: Int64): CString
foreign func nativeUuidIsNull(ptr: Int64): Bool

public class QUuid {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe {
            nativeUuidCreate()
        }
    }

    public init(str: String) {
        this.ptr = unsafe {
            let s = LibC.mallocCString(str)
            let r = nativeUuidCreateFromString(s)
            LibC.free(s)
            r
        }
    }

    public func delete(): Unit {
        unsafe {
            nativeUuidDelete(ptr)
        }
    }

    public func toString(): String {
        return unsafe {
            nativeUuidToString(ptr).toString()
        }
    }

    public func isNull(): Bool {
        return unsafe {
            nativeUuidIsNull(ptr)
        }
    }
}
