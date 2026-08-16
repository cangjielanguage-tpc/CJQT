package cjqt.gui

foreign func nativeTextFormatCreate(): Int64
foreign func nativeTextFormatDelete(ptr: Int64): Unit
foreign func nativeTextFormatIsEmpty(ptr: Int64): Bool
foreign func nativeTextFormatIsValid(ptr: Int64): Bool
foreign func nativeTextFormatType(ptr: Int64): Int32
foreign func nativeTextFormatObjectType(ptr: Int64): Int32
foreign func nativeTextFormatSetProperty(ptr: Int64, propertyId: Int32, value: CString): Unit
foreign func nativeTextFormatStringProperty(ptr: Int64, propertyId: Int32): CString
foreign func nativeTextFormatSetFontPointSize(ptr: Int64, size: Float64): Unit
foreign func nativeTextFormatFontPointSize(ptr: Int64): Float64

public open class QTextFormat {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativeTextFormatCreate() }
    }

    public open func delete(): Unit {
        unsafe { nativeTextFormatDelete(ptr) }
    }

    public func isEmpty(): Bool {
        return unsafe { nativeTextFormatIsEmpty(ptr) }
    }

    public func isValid(): Bool {
        return unsafe { nativeTextFormatIsValid(ptr) }
    }

    public func formatType(): Int64 {
        return Int64(unsafe { nativeTextFormatType(ptr) })
    }

    public func objectType(): Int64 {
        return Int64(unsafe { nativeTextFormatObjectType(ptr) })
    }

    public func setProperty(propertyId: Int64, value: String) {
        unsafe {
            let v = LibC.mallocCString(value)
            nativeTextFormatSetProperty(ptr, Int32(propertyId), v)
            LibC.free(v)
        }
    }

    public func stringProperty(propertyId: Int64): String {
        return unsafe {
            nativeTextFormatStringProperty(ptr, Int32(propertyId)).toString()
        }
    }

    public open func setFontPointSize(size: Float64) {
        unsafe { nativeTextFormatSetFontPointSize(ptr, size) }
    }

    public open func fontPointSize(): Float64 {
        return unsafe { nativeTextFormatFontPointSize(ptr) }
    }
}
