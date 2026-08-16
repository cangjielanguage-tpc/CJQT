package cjqt.core

foreign func nativeSharedMemoryCreate(key: CString): Int64
foreign func nativeSharedMemoryDelete(ptr: Int64): Unit
foreign func nativeSharedMemoryCreateMemory(ptr: Int64, size: Int32): Bool
foreign func nativeSharedMemoryAttach(ptr: Int64): Bool
foreign func nativeSharedMemoryDetach(ptr: Int64): Bool
foreign func nativeSharedMemoryIsAttached(ptr: Int64): Bool
foreign func nativeSharedMemorySize(ptr: Int64): Int32

public class QSharedMemory {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(key: String) {
        this.ptr = unsafe {
            let k = LibC.mallocCString(key)
            let r = nativeSharedMemoryCreate(k)
            LibC.free(k)
            r
        }
    }

    public func delete(): Unit {
        unsafe { nativeSharedMemoryDelete(ptr) }
    }

    public func create(size: Int64): Bool {
        return unsafe { nativeSharedMemoryCreateMemory(ptr, Int32(size)) }
    }

    public func attach(): Bool {
        return unsafe { nativeSharedMemoryAttach(ptr) }
    }

    public func detach(): Bool {
        return unsafe { nativeSharedMemoryDetach(ptr) }
    }

    public func isAttached(): Bool {
        return unsafe { nativeSharedMemoryIsAttached(ptr) }
    }

    public func sharedMemorySize(): Int64 {
        return Int64(unsafe { nativeSharedMemorySize(ptr) })
    }
}
