package cjqt.core

foreign func nativeRegexCreate(pattern: CString): Int64
foreign func nativeRegexDelete(ptr: Int64): Unit
foreign func nativeRegexPattern(ptr: Int64): CString
foreign func nativeRegexIsValid(ptr: Int64): Bool
foreign func nativeRegexErrorString(ptr: Int64): CString
foreign func nativeRegexMatch(ptr: Int64, str: CString): Int64
foreign func nativeRegexMatchDelete(ptr: Int64): Unit
foreign func nativeRegexMatchHasMatch(ptr: Int64): Bool
foreign func nativeRegexMatchHasPartialMatch(ptr: Int64): Bool
foreign func nativeRegexMatchCaptured(ptr: Int64, index: Int32): CString
foreign func nativeRegexMatchCapturedCount(ptr: Int64): Int32

public class QRegularExpression {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(pattern: String) {
        this.ptr = unsafe {
            let p = LibC.mallocCString(pattern)
            let r = nativeRegexCreate(p)
            LibC.free(p)
            r
        }
    }

    public func delete(): Unit {
        unsafe {
            nativeRegexDelete(ptr)
        }
    }

    public func pattern(): String {
        return unsafe {
            nativeRegexPattern(ptr).toString()
        }
    }

    public func isValid(): Bool {
        return unsafe {
            nativeRegexIsValid(ptr)
        }
    }

    public func errorString(): String {
        return unsafe {
            nativeRegexErrorString(ptr).toString()
        }
    }

    public func matchText(str: String): QRegularExpressionMatch {
        return QRegularExpressionMatch(unsafe {
            let s = LibC.mallocCString(str)
            let r = nativeRegexMatch(ptr, s)
            LibC.free(s)
            r
        })
    }
}

public class QRegularExpressionMatch {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public func delete(): Unit {
        unsafe {
            nativeRegexMatchDelete(ptr)
        }
    }

    public func hasMatch(): Bool {
        return unsafe {
            nativeRegexMatchHasMatch(ptr)
        }
    }

    public func hasPartialMatch(): Bool {
        return unsafe {
            nativeRegexMatchHasPartialMatch(ptr)
        }
    }

    public func captured(index!: Int64 = 0): String {
        return unsafe {
            nativeRegexMatchCaptured(ptr, Int32(index)).toString()
        }
    }

    public func capturedCount(): Int64 {
        return Int64(unsafe {
            nativeRegexMatchCapturedCount(ptr)
        })
    }
}
