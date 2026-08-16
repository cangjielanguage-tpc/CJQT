package cjqt.core

foreign func nativeDataStreamCreate(byteArrayPtr: Int64, mode: Int32): Int64
foreign func nativeDataStreamDelete(ptr: Int64): Unit
foreign func nativeDataStreamWriteInt(ptr: Int64, value: Int32): Unit
foreign func nativeDataStreamReadInt(ptr: Int64): Int32
foreign func nativeDataStreamWriteString(ptr: Int64, str: CString): Unit
foreign func nativeDataStreamReadString(ptr: Int64): CString
foreign func nativeDataStreamWriteDouble(ptr: Int64, value: Float64): Unit
foreign func nativeDataStreamReadDouble(ptr: Int64): Float64
foreign func nativeDataStreamAtEnd(ptr: Int64): Bool

public enum QDataStreamMode {
    | ReadOnly
    | WriteOnly
    | ReadWrite
    | Append

    public func value(): Int32 {
        return match (this) {
            case ReadOnly => 0x0001
            case WriteOnly => 0x0002
            case ReadWrite => 0x0003
            case Append => 0x0004
        }
    }
}

public class QDataStream {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(byteArray: QByteArray, mode: QDataStreamMode) {
        this.ptr = unsafe {
            nativeDataStreamCreate(byteArray.ptr, mode.value())
        }
    }

    public func delete(): Unit {
        unsafe {
            nativeDataStreamDelete(ptr)
        }
    }

    public func writeInt(value: Int64): Unit {
        unsafe {
            nativeDataStreamWriteInt(ptr, Int32(value))
        }
    }

    public func readInt(): Int64 {
        return Int64(unsafe {
            nativeDataStreamReadInt(ptr)
        })
    }

    public func writeString(str: String): Unit {
        unsafe {
            let s = LibC.mallocCString(str)
            nativeDataStreamWriteString(ptr, s)
            LibC.free(s)
        }
    }

    public func readString(): String {
        return unsafe {
            nativeDataStreamReadString(ptr).toString()
        }
    }

    public func writeDouble(value: Float64): Unit {
        unsafe {
            nativeDataStreamWriteDouble(ptr, value)
        }
    }

    public func readDouble(): Float64 {
        return unsafe {
            nativeDataStreamReadDouble(ptr)
        }
    }

    public func atEnd(): Bool {
        return unsafe {
            nativeDataStreamAtEnd(ptr)
        }
    }
}
