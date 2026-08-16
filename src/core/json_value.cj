package cjqt.core

foreign func nativeJsonValueCreateNull(): Int64
foreign func nativeJsonValueCreateBool(value: Bool): Int64
foreign func nativeJsonValueCreateInt(value: Int64): Int64
foreign func nativeJsonValueCreateDouble(value: Float64): Int64
foreign func nativeJsonValueCreateString(value: CString): Int64
foreign func nativeJsonValueCreateArray(arrayPtr: Int64): Int64
foreign func nativeJsonValueCreateObject(objectPtr: Int64): Int64
foreign func nativeJsonValueDelete(ptr: Int64): Unit
foreign func nativeJsonValueIsNull(ptr: Int64): Bool
foreign func nativeJsonValueIsBool(ptr: Int64): Bool
foreign func nativeJsonValueIsDouble(ptr: Int64): Bool
foreign func nativeJsonValueIsString(ptr: Int64): Bool
foreign func nativeJsonValueIsArray(ptr: Int64): Bool
foreign func nativeJsonValueIsObject(ptr: Int64): Bool
foreign func nativeJsonValueToBool(ptr: Int64): Bool
foreign func nativeJsonValueToDouble(ptr: Int64): Float64
foreign func nativeJsonValueToInt(ptr: Int64): Int32
foreign func nativeJsonValueToString(ptr: Int64): CString
foreign func nativeJsonValueToArray(ptr: Int64): Int64
foreign func nativeJsonValueToObject(ptr: Int64): Int64

public class QJsonValue {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativeJsonValueCreateNull() }
    }

    public init(value: Bool) {
        this.ptr = unsafe { nativeJsonValueCreateBool(value) }
    }

    public init(value: Float64) {
        this.ptr = unsafe { nativeJsonValueCreateDouble(value) }
    }

    public init(value: String) {
        this.ptr = unsafe {
            let s = LibC.mallocCString(value)
            let r = nativeJsonValueCreateString(s)
            LibC.free(s)
            r
        }
    }

    public init(array: QJsonArray) {
        this.ptr = unsafe { nativeJsonValueCreateArray(array.ptr) }
    }

    public init(object: QJsonObject) {
        this.ptr = unsafe { nativeJsonValueCreateObject(object.ptr) }
    }

    public func delete(): Unit {
        unsafe { nativeJsonValueDelete(ptr) }
    }

    public func isNull(): Bool {
        return unsafe { nativeJsonValueIsNull(ptr) }
    }

    public func isBool(): Bool {
        return unsafe { nativeJsonValueIsBool(ptr) }
    }

    public func isDouble(): Bool {
        return unsafe { nativeJsonValueIsDouble(ptr) }
    }

    public func isString(): Bool {
        return unsafe { nativeJsonValueIsString(ptr) }
    }

    public func isArray(): Bool {
        return unsafe { nativeJsonValueIsArray(ptr) }
    }

    public func isObject(): Bool {
        return unsafe { nativeJsonValueIsObject(ptr) }
    }

    public func toBool(): Bool {
        return unsafe { nativeJsonValueToBool(ptr) }
    }

    public func toDouble(): Float64 {
        return unsafe { nativeJsonValueToDouble(ptr) }
    }

    public func toInt(): Int64 {
        return Int64(unsafe { nativeJsonValueToInt(ptr) })
    }

    public func toString(): String {
        return unsafe { nativeJsonValueToString(ptr).toString() }
    }

    public func toArray(): QJsonArray {
        return QJsonArray(unsafe { nativeJsonValueToArray(ptr) })
    }

    public func toObject(): QJsonObject {
        return QJsonObject(unsafe { nativeJsonValueToObject(ptr) })
    }

    public static func intValue(value: Int64): QJsonValue {
        return QJsonValue(unsafe { nativeJsonValueCreateInt(value) })
    }
}
