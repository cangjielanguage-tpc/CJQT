package cjqt.gui

import cjqt.core.*

foreign func nativeResizeEventCreate(w1: Int32, h1: Int32, w2: Int32, h2: Int32): Int64
foreign func nativeResizeEventDelete(ptr: Int64): Unit
foreign func nativeResizeEventWidth(ptr: Int64): Int32
foreign func nativeResizeEventHeight(ptr: Int64): Int32
foreign func nativeResizeEventOldWidth(ptr: Int64): Int32
foreign func nativeResizeEventOldHeight(ptr: Int64): Int32

public class QResizeEvent <: QEvent {
    public init(ptr: Int64) {
        super(ptr)
    }

    public init(size: QSize, oldSize: QSize) {
        super(unsafe {
            nativeResizeEventCreate(Int32(size.width), Int32(size.height), Int32(oldSize.width), Int32(oldSize.height))
        })
    }

    public override func delete() {
        unsafe { nativeResizeEventDelete(ptr) }
    }

    public func size(): QSize {
        return QSize(unsafe { nativeResizeEventWidth(ptr) }, unsafe { nativeResizeEventHeight(ptr) })
    }

    public func oldSize(): QSize {
        return QSize(unsafe { nativeResizeEventOldWidth(ptr) }, unsafe { nativeResizeEventOldHeight(ptr) })
    }

    public func width(): Int64 {
        return Int64(unsafe { nativeResizeEventWidth(ptr) })
    }

    public func height(): Int64 {
        return Int64(unsafe { nativeResizeEventHeight(ptr) })
    }
}
