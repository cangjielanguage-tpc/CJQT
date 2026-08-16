package cjqt.core

foreign func nativeBufferCreate(): Int64
foreign func nativeBufferDelete(ptr: Int64): Unit
foreign func nativeBufferOpen(ptr: Int64, mode: Int32): Bool
foreign func nativeBufferSetData(ptr: Int64, data: CString): Unit
foreign func nativeBufferData(ptr: Int64): CString
foreign func nativeBufferSize(ptr: Int64): Int32

public class QBuffer {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativeBufferCreate() }
    }

    public func delete() {
        unsafe { nativeBufferDelete(ptr) }
    }

    public func open(mode: QIODeviceOpenMode): Bool {
        return unsafe { nativeBufferOpen(ptr, mode.value()) }
    }

    public func setData(data: String) {
        unsafe {
            let d = LibC.mallocCString(data)
            nativeBufferSetData(ptr, d)
            LibC.free(d)
        }
    }

    public func data(): String {
        return unsafe { nativeBufferData(ptr).toString() }
    }

    public func bufferSize(): Int64 {
        return Int64(unsafe { nativeBufferSize(ptr) })
    }
}
