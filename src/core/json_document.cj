package cjqt.core

foreign func nativeJsonDocumentCreate(): Int64
foreign func nativeJsonDocumentCreateFromArray(arrayPtr: Int64): Int64
foreign func nativeJsonDocumentCreateFromObject(objectPtr: Int64): Int64
foreign func nativeJsonDocumentDelete(ptr: Int64): Unit
foreign func nativeJsonDocumentIsNull(ptr: Int64): Bool
foreign func nativeJsonDocumentIsEmpty(ptr: Int64): Bool
foreign func nativeJsonDocumentIsArray(ptr: Int64): Bool
foreign func nativeJsonDocumentIsObject(ptr: Int64): Bool
foreign func nativeJsonDocumentArray(ptr: Int64): Int64
foreign func nativeJsonDocumentObject(ptr: Int64): Int64
foreign func nativeJsonDocumentToJson(ptr: Int64): CString
foreign func nativeJsonDocumentFromJson(str: CString): Int64

public class QJsonDocument {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativeJsonDocumentCreate() }
    }

    public init(array: QJsonArray) {
        this.ptr = unsafe { nativeJsonDocumentCreateFromArray(array.ptr) }
    }

    public init(object: QJsonObject) {
        this.ptr = unsafe { nativeJsonDocumentCreateFromObject(object.ptr) }
    }

    public func delete(): Unit {
        unsafe { nativeJsonDocumentDelete(ptr) }
    }

    public func isNull(): Bool {
        return unsafe { nativeJsonDocumentIsNull(ptr) }
    }

    public func isEmpty(): Bool {
        return unsafe { nativeJsonDocumentIsEmpty(ptr) }
    }

    public func isArray(): Bool {
        return unsafe { nativeJsonDocumentIsArray(ptr) }
    }

    public func isObject(): Bool {
        return unsafe { nativeJsonDocumentIsObject(ptr) }
    }

    public func array(): QJsonArray {
        return QJsonArray(unsafe { nativeJsonDocumentArray(ptr) })
    }

    public func object(): QJsonObject {
        return QJsonObject(unsafe { nativeJsonDocumentObject(ptr) })
    }

    public func toJson(): String {
        return unsafe { nativeJsonDocumentToJson(ptr).toString() }
    }

    public static func fromJson(str: String): QJsonDocument {
        let p = unsafe {
            let s = LibC.mallocCString(str)
            let r = nativeJsonDocumentFromJson(s)
            LibC.free(s)
            r
        }
        return QJsonDocument(p)
    }
}
