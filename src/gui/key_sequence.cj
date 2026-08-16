package cjqt.gui

foreign func nativeKeySequenceCreate(str: CString): Int64
foreign func nativeKeySequenceDelete(ptr: Int64): Unit
foreign func nativeKeySequenceToString(ptr: Int64): CString
foreign func nativeKeySequenceIsEmpty(ptr: Int64): Bool
foreign func nativeKeySequenceCount(ptr: Int64): Int32

public class QKeySequence {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(str: String) {
        this.ptr = unsafe {
            let s = LibC.mallocCString(str)
            let r = nativeKeySequenceCreate(s)
            LibC.free(s)
            r
        }
    }

    public func delete(): Unit {
        unsafe {
            nativeKeySequenceDelete(ptr)
        }
    }

    public func toString(): String {
        return unsafe {
            nativeKeySequenceToString(ptr).toString()
        }
    }

    public func isEmpty(): Bool {
        return unsafe {
            nativeKeySequenceIsEmpty(ptr)
        }
    }

    public func count(): Int64 {
        return Int64(unsafe {
            nativeKeySequenceCount(ptr)
        })
    }
}
