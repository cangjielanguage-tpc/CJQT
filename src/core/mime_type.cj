package cjqt.core

foreign func nativeMimeTypeCreate(): Int64
foreign func nativeMimeTypeDelete(ptr: Int64): Unit
foreign func nativeMimeTypeIsValid(ptr: Int64): Bool
foreign func nativeMimeTypeIsDefault(ptr: Int64): Bool
foreign func nativeMimeTypeName(ptr: Int64): CString
foreign func nativeMimeTypeComment(ptr: Int64): CString
foreign func nativeMimeTypeSuffixes(ptr: Int64): Int64

public class QMimeType {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativeMimeTypeCreate() }
    }

    public func delete(): Unit {
        unsafe { nativeMimeTypeDelete(ptr) }
    }

    public func isValid(): Bool {
        return unsafe { nativeMimeTypeIsValid(ptr) }
    }

    public func isDefault(): Bool {
        return unsafe { nativeMimeTypeIsDefault(ptr) }
    }

    public func name(): String {
        return unsafe { nativeMimeTypeName(ptr).toString() }
    }

    public func comment(): String {
        return unsafe { nativeMimeTypeComment(ptr).toString() }
    }

    public func suffixes(): QStringList {
        return QStringList(ptr: unsafe { nativeMimeTypeSuffixes(ptr) })
    }
}
