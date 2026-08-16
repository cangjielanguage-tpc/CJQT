package cjqt.widgets

import cjqt.core.*

foreign func nativeButtonGroupCreate(parentPtr: Int64): Int64
foreign func nativeButtonGroupDelete(ptr: Int64): Unit
foreign func nativeButtonGroupAddButton(ptr: Int64, buttonPtr: Int64, id: Int32): Unit
foreign func nativeButtonGroupRemoveButton(ptr: Int64, buttonPtr: Int64): Unit
foreign func nativeButtonGroupCheckedId(ptr: Int64): Int32
foreign func nativeButtonGroupSetExclusive(ptr: Int64, exclusive: Bool): Unit
foreign func nativeButtonGroupIsExclusive(ptr: Int64): Bool

public class QButtonGroup {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe {
            nativeButtonGroupCreate(0)
        }
    }

    public func delete(): Unit {
        unsafe {
            nativeButtonGroupDelete(ptr)
        }
    }

    public func addButton(button: QWidget, id: Int64) {
        unsafe {
            nativeButtonGroupAddButton(ptr, button.ptr, Int32(id))
        }
    }

    public func removeButton(button: QWidget) {
        unsafe {
            nativeButtonGroupRemoveButton(ptr, button.ptr)
        }
    }

    public func checkedId(): Int64 {
        return Int64(unsafe {
            nativeButtonGroupCheckedId(ptr)
        })
    }

    public func setExclusive(exclusive: Bool) {
        unsafe {
            nativeButtonGroupSetExclusive(ptr, exclusive)
        }
    }

    public func isExclusive(): Bool {
        return unsafe {
            nativeButtonGroupIsExclusive(ptr)
        }
    }
}
