package cjqt.core

foreign func nativeVersionNumberCreate(major: Int32, minor: Int32, patch: Int32): Int64
foreign func nativeVersionNumberFromString(str: CString): Int64
foreign func nativeVersionNumberDelete(ptr: Int64): Unit
foreign func nativeVersionNumberMajor(ptr: Int64): Int32
foreign func nativeVersionNumberMinor(ptr: Int64): Int32
foreign func nativeVersionNumberPatch(ptr: Int64): Int32
foreign func nativeVersionNumberToString(ptr: Int64): CString
foreign func nativeVersionNumberIsNull(ptr: Int64): Bool

public class QVersionNumber {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(major: Int64, minor: Int64, patch: Int64) {
        this.ptr = unsafe {
            nativeVersionNumberCreate(Int32(major), Int32(minor), Int32(patch))
        }
    }

    public static func fromString(str: String): QVersionNumber {
        return QVersionNumber(unsafe {
            let s = LibC.mallocCString(str)
            let r = nativeVersionNumberFromString(s)
            LibC.free(s)
            r
        })
    }

    public func delete(): Unit {
        unsafe { nativeVersionNumberDelete(ptr) }
    }

    public func majorVersion(): Int64 {
        return Int64(unsafe { nativeVersionNumberMajor(ptr) })
    }

    public func minorVersion(): Int64 {
        return Int64(unsafe { nativeVersionNumberMinor(ptr) })
    }

    public func patchVersion(): Int64 {
        return Int64(unsafe { nativeVersionNumberPatch(ptr) })
    }

    public func toString(): String {
        return unsafe { nativeVersionNumberToString(ptr).toString() }
    }

    public func isNull(): Bool {
        return unsafe { nativeVersionNumberIsNull(ptr) }
    }
}
