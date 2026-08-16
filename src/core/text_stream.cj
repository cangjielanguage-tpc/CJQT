package cjqt.core

foreign func nativeTextStreamCreate(byteArrayPtr: Int64, mode: Int32): Int64
foreign func nativeTextStreamDelete(ptr: Int64): Unit
foreign func nativeTextStreamWriteString(ptr: Int64, str: CString): Unit
foreign func nativeTextStreamReadLine(ptr: Int64): CString
foreign func nativeTextStreamReadAll(ptr: Int64): CString
foreign func nativeTextStreamAtEnd(ptr: Int64): Bool

public class QTextStream {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(byteArray: QByteArray, mode: QDataStreamMode) {
        this.ptr = unsafe {
            nativeTextStreamCreate(byteArray.ptr, mode.value())
        }
    }

    public func delete(): Unit {
        unsafe {
            nativeTextStreamDelete(ptr)
        }
    }

    public func write(str: String): Unit {
        unsafe {
            let s = LibC.mallocCString(str)
            nativeTextStreamWriteString(ptr, s)
            LibC.free(s)
        }
    }

    public func readLine(): String {
        return unsafe {
            nativeTextStreamReadLine(ptr).toString()
        }
    }

    public func readAll(): String {
        return unsafe {
            nativeTextStreamReadAll(ptr).toString()
        }
    }

    public func atEnd(): Bool {
        return unsafe {
            nativeTextStreamAtEnd(ptr)
        }
    }
}
