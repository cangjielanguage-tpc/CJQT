package cjqt.gui

foreign func nativeIntValidatorCreate(bottom: Int32, top: Int32, parentPtr: Int64): Int64
foreign func nativeIntValidatorDelete(ptr: Int64): Unit
foreign func nativeIntValidatorSetRange(ptr: Int64, bottom: Int32, top: Int32): Unit
foreign func nativeIntValidatorBottom(ptr: Int64): Int32
foreign func nativeIntValidatorTop(ptr: Int64): Int32
foreign func nativeIntValidatorValidate(ptr: Int64, input: CString, pos: Int32): Int32

public class QIntValidator {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(bottom: Int64, top: Int64) {
        this.ptr = unsafe {
            nativeIntValidatorCreate(Int32(bottom), Int32(top), 0)
        }
    }

    public func delete(): Unit {
        unsafe {
            nativeIntValidatorDelete(ptr)
        }
    }

    public func setRange(bottom: Int64, top: Int64): Unit {
        unsafe {
            nativeIntValidatorSetRange(ptr, Int32(bottom), Int32(top))
        }
    }

    public func bottom(): Int64 {
        return Int64(unsafe {
            nativeIntValidatorBottom(ptr)
        })
    }

    public func top(): Int64 {
        return Int64(unsafe {
            nativeIntValidatorTop(ptr)
        })
    }

    public func validate(input: String, pos!: Int64 = 0): QValidatorState {
        let state = unsafe {
            let i = LibC.mallocCString(input)
            let r = nativeIntValidatorValidate(ptr, i, Int32(pos))
            LibC.free(i)
            r
        }
        return QValidatorState.convert(state)
    }
}
