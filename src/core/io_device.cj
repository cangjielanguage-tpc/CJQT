package cjqt.core

foreign func nativeIoDeviceCreate(): Int64
foreign func nativeIoDeviceDelete(ptr: Int64): Unit
foreign func nativeIoDeviceOpen(ptr: Int64, mode: Int32): Bool
foreign func nativeIoDeviceClose(ptr: Int64): Unit
foreign func nativeIoDeviceIsOpen(ptr: Int64): Bool
foreign func nativeIoDeviceIsReadable(ptr: Int64): Bool
foreign func nativeIoDeviceIsWritable(ptr: Int64): Bool
foreign func nativeIoDeviceSize(ptr: Int64): Int64
foreign func nativeIoDeviceBytesAvailable(ptr: Int64): Int64
foreign func nativeIoDeviceAtEnd(ptr: Int64): Bool
foreign func nativeIoDeviceReadAll(ptr: Int64): CString
foreign func nativeIoDeviceWrite(ptr: Int64, data: CString): Int64

public open class QIODevice {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativeIoDeviceCreate() }
    }

    public open func delete(): Unit {
        unsafe { nativeIoDeviceDelete(ptr) }
    }

    public func open(mode: QIODeviceOpenMode): Bool {
        return unsafe { nativeIoDeviceOpen(ptr, mode.value()) }
    }

    public func close(): Unit {
        unsafe { nativeIoDeviceClose(ptr) }
    }

    public func isOpen(): Bool {
        return unsafe { nativeIoDeviceIsOpen(ptr) }
    }

    public func isReadable(): Bool {
        return unsafe { nativeIoDeviceIsReadable(ptr) }
    }

    public func isWritable(): Bool {
        return unsafe { nativeIoDeviceIsWritable(ptr) }
    }

    public func size(): Int64 {
        return unsafe { nativeIoDeviceSize(ptr) }
    }

    public func bytesAvailable(): Int64 {
        return unsafe { nativeIoDeviceBytesAvailable(ptr) }
    }

    public func atEnd(): Bool {
        return unsafe { nativeIoDeviceAtEnd(ptr) }
    }

    public func readAll(): String {
        return unsafe { nativeIoDeviceReadAll(ptr).toString() }
    }

    public func write(data: String): Int64 {
        return unsafe {
            let d = LibC.mallocCString(data)
            let r = nativeIoDeviceWrite(ptr, d)
            LibC.free(d)
            r
        }
    }

}
