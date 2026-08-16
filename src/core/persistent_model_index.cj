package cjqt.core

foreign func nativePersistentIndexCreate(row: Int32, column: Int32): Int64
foreign func nativePersistentIndexDelete(ptr: Int64): Unit
foreign func nativePersistentIndexRow(ptr: Int64): Int32
foreign func nativePersistentIndexColumn(ptr: Int64): Int32
foreign func nativePersistentIndexIsValid(ptr: Int64): Bool

public class QPersistentModelIndex {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativePersistentIndexCreate(0, 0) }
    }

    public func delete(): Unit {
        unsafe { nativePersistentIndexDelete(ptr) }
    }

    public func row(): Int64 {
        return Int64(unsafe { nativePersistentIndexRow(ptr) })
    }

    public func column(): Int64 {
        return Int64(unsafe { nativePersistentIndexColumn(ptr) })
    }

    public func isValid(): Bool {
        return unsafe { nativePersistentIndexIsValid(ptr) }
    }
}
