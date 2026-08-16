package cjqt.core

foreign func nativeJsonArrayCreate(): Int64
foreign func nativeJsonArrayDelete(ptr: Int64): Unit
foreign func nativeJsonArraySize(ptr: Int64): Int32
foreign func nativeJsonArrayIsEmpty(ptr: Int64): Bool
foreign func nativeJsonArrayAt(ptr: Int64, index: Int32): Int64
foreign func nativeJsonArrayAppend(ptr: Int64, valuePtr: Int64): Unit
foreign func nativeJsonArrayToString(ptr: Int64): CString
foreign func nativeJsonArrayFromString(str: CString): Int64

public class QJsonArray {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativeJsonArrayCreate() }
    }

    public func delete(): Unit {
        unsafe { nativeJsonArrayDelete(ptr) }
    }

    public func size(): Int64 {
        return Int64(unsafe { nativeJsonArraySize(ptr) })
    }

    public func isEmpty(): Bool {
        return unsafe { nativeJsonArrayIsEmpty(ptr) }
    }

    public func at(index: Int64): QJsonValue {
        return QJsonValue(unsafe { nativeJsonArrayAt(ptr, Int32(index)) })
    }

    public func append(value: QJsonValue): Unit {
        unsafe { nativeJsonArrayAppend(ptr, value.ptr) }
    }

    public func toString(): String {
        return unsafe { nativeJsonArrayToString(ptr).toString() }
    }

    public static func fromString(str: String): QJsonArray {
        let p = unsafe {
            let s = LibC.mallocCString(str)
            let r = nativeJsonArrayFromString(s)
            LibC.free(s)
            r
        }
        return QJsonArray(p)
    }
}
