package cjqt.core

foreign func nativeSignalMapperCreate(parentPtr: Int64): Int64
foreign func nativeSignalMapperDelete(ptr: Int64): Unit

public class QSignalMapper {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativeSignalMapperCreate(0) }
    }

    public func delete(): Unit {
        unsafe { nativeSignalMapperDelete(ptr) }
    }
}
