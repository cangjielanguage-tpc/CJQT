package cjqt.gui

foreign func nativeRegexValidatorCreate(pattern: CString, parentPtr: Int64): Int64
foreign func nativeRegexValidatorDelete(ptr: Int64): Unit
foreign func nativeRegexValidatorValidate(ptr: Int64, input: CString, pos: Int32): Int32

public class QRegularExpressionValidator {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(pattern: String) {
        this.ptr = unsafe {
            let p = LibC.mallocCString(pattern)
            let r = nativeRegexValidatorCreate(p, 0)
            LibC.free(p)
            r
        }
    }

    public func delete(): Unit {
        unsafe { nativeRegexValidatorDelete(ptr) }
    }

    public func validate(input: String, pos!: Int64 = 0): QValidatorState {
        let state = unsafe {
            let i = LibC.mallocCString(input)
            let r = nativeRegexValidatorValidate(ptr, i, Int32(pos))
            LibC.free(i)
            r
        }
        return QValidatorState.convert(state)
    }
}
