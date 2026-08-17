package cjqt.multimedia

import cjqt.core.*

foreign func nativeMediaContentCreate(url: CString): Int64
foreign func nativeMediaContentDelete(ptr: Int64): Unit
foreign func nativeMediaContentIsNull(ptr: Int64): Bool
foreign func nativeMediaContentCanonicalUrl(ptr: Int64): CString
foreign func nativeMediaContentRequestUrl(ptr: Int64): CString

public class QMediaContent {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(url: String) {
        this.ptr = unsafe {
            let u = LibC.mallocCString(url)
            let r = nativeMediaContentCreate(u)
            LibC.free(u)
            r
        }
    }

    public func delete(): Unit {
        unsafe { nativeMediaContentDelete(ptr) }
    }

    public func isNull(): Bool {
        return unsafe { nativeMediaContentIsNull(ptr) }
    }

    public func canonicalUrl(): String {
        return unsafe { nativeMediaContentCanonicalUrl(ptr).toString() }
    }

    public func requestUrl(): String {
        return unsafe { nativeMediaContentRequestUrl(ptr).toString() }
    }
}
