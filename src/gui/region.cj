package cjqt.gui

foreign func nativeRegionCreate(x: Int32, y: Int32, w: Int32, h: Int32): Int64
foreign func nativeRegionCreateEmpty(): Int64
foreign func nativeRegionDelete(ptr: Int64): Unit
foreign func nativeRegionIsEmpty(ptr: Int64): Bool
foreign func nativeRegionIsNull(ptr: Int64): Bool
foreign func nativeRegionContains(ptr: Int64, x: Int32, y: Int32): Bool
foreign func nativeRegionBoundingRectWidth(ptr: Int64): Int32
foreign func nativeRegionBoundingRectHeight(ptr: Int64): Int32

public class QRegion {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(x: Int64, y: Int64, w: Int64, h: Int64) {
        this.ptr = unsafe {
            nativeRegionCreate(Int32(x), Int32(y), Int32(w), Int32(h))
        }
    }

    public init() {
        this.ptr = unsafe { nativeRegionCreateEmpty() }
    }

    public func delete(): Unit {
        unsafe { nativeRegionDelete(ptr) }
    }

    public func isEmpty(): Bool {
        return unsafe { nativeRegionIsEmpty(ptr) }
    }

    public func isNull(): Bool {
        return unsafe { nativeRegionIsNull(ptr) }
    }

    public func contains(x: Int64, y: Int64): Bool {
        return unsafe { nativeRegionContains(ptr, Int32(x), Int32(y)) }
    }

    public func boundingRectWidth(): Int64 {
        return Int64(unsafe { nativeRegionBoundingRectWidth(ptr) })
    }

    public func boundingRectHeight(): Int64 {
        return Int64(unsafe { nativeRegionBoundingRectHeight(ptr) })
    }
}
