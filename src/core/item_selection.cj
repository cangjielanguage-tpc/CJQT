package cjqt.core

foreign func nativeItemSelectionCreate(): Int64
foreign func nativeItemSelectionDelete(ptr: Int64): Unit
foreign func nativeItemSelectionIsEmpty(ptr: Int64): Bool
foreign func nativeItemSelectionCount(ptr: Int64): Int32
foreign func nativeItemSelectionClear(ptr: Int64): Unit

public class QItemSelection {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativeItemSelectionCreate() }
    }

    public func delete(): Unit {
        unsafe { nativeItemSelectionDelete(ptr) }
    }

    public func isEmpty(): Bool {
        return unsafe { nativeItemSelectionIsEmpty(ptr) }
    }

    public func count(): Int64 {
        return Int64(unsafe { nativeItemSelectionCount(ptr) })
    }

    public func clear() {
        unsafe { nativeItemSelectionClear(ptr) }
    }
}
