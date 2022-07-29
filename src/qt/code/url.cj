package qt.code

// from std import ffi.c.CString

foreign func nativeUrlCreate(url: CString, parsingMode: Int32): Int64
foreign func nativeUrlToString(ptr: Int64): CString
foreign func nativeUrlIsValid(ptr: Int64): Bool
foreign func nativeUrlDelete(ptr: Int64): Unit

public class QUrl {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(url: String) {
        ptr = unsafe {
            nativeUrlCreate(CString(url), 1)
        }
    }

    public init(url: String, parsingMode: Int32) {
        ptr = unsafe {
            nativeUrlCreate(CString(url), parsingMode)
        }
    }

    public func toString(): String {
        unsafe {
            nativeUrlToString(ptr).toString()
        }
    }

    public func isValid(): Bool {
        unsafe {
            nativeUrlIsValid(ptr)
        }
    }

    public func delete() {
        unsafe {
            nativeUrlDelete(ptr)
        }
    }
}
