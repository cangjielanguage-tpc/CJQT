package cjqt.qt.gui

import cjqt.qt.core.QRect

//foreign function
foreign func nativePolygonCreate(): Int64
foreign func nativePolygonCreateWithSize(size: Int32): Int64
foreign func nativePolygonCreateWithRect(rectPtr: Int64, closed: Bool): Int64
foreign func nativePolygonDelete(ptr: Int64): Unit

public open class QPolygon {
    public let ptr: Int64

    public init() {
        this.ptr = unsafe { nativePolygonCreate() }
    }
    public init(ptr: Int64) {
        this.ptr = ptr
    }
    public init(size: Int32) {
        this.ptr = unsafe{nativePolygonCreateWithSize(size)}
    }
    public init(rectangle: QRect, closed!: Bool = false) {
        this.ptr = unsafe {
            nativePolygonCreateWithRect(rectangle.ptr, closed)
        }
    }

    public open func delete() {
        unsafe { nativePolygonDelete(this.ptr) }
    }
}
