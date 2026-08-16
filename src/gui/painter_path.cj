package cjqt.gui

foreign func nativePainterPathCreate(): Int64
foreign func nativePainterPathDelete(ptr: Int64): Unit
foreign func nativePainterPathMoveTo(ptr: Int64, x: Float64, y: Float64): Unit
foreign func nativePainterPathLineTo(ptr: Int64, x: Float64, y: Float64): Unit
foreign func nativePainterPathCubicTo(ptr: Int64, c1x: Float64, c1y: Float64, c2x: Float64, c2y: Float64, ex: Float64, ey: Float64): Unit
foreign func nativePainterPathCloseSubpath(ptr: Int64): Unit
foreign func nativePainterPathIsEmpty(ptr: Int64): Bool
foreign func nativePainterPathContains(ptr: Int64, x: Float64, y: Float64): Bool
foreign func nativePainterPathLength(ptr: Int64): Float64
foreign func nativePainterPathElementCount(ptr: Int64): Int32

public class QPainterPath {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe {
            nativePainterPathCreate()
        }
    }

    public func delete(): Unit {
        unsafe {
            nativePainterPathDelete(ptr)
        }
    }

    public func moveTo(x: Float64, y: Float64): Unit {
        unsafe {
            nativePainterPathMoveTo(ptr, x, y)
        }
    }

    public func lineTo(x: Float64, y: Float64): Unit {
        unsafe {
            nativePainterPathLineTo(ptr, x, y)
        }
    }

    public func cubicTo(c1x: Float64, c1y: Float64, c2x: Float64, c2y: Float64, ex: Float64, ey: Float64): Unit {
        unsafe {
            nativePainterPathCubicTo(ptr, c1x, c1y, c2x, c2y, ex, ey)
        }
    }

    public func closeSubpath(): Unit {
        unsafe {
            nativePainterPathCloseSubpath(ptr)
        }
    }

    public func isEmpty(): Bool {
        return unsafe {
            nativePainterPathIsEmpty(ptr)
        }
    }

    public func contains(x: Float64, y: Float64): Bool {
        return unsafe {
            nativePainterPathContains(ptr, x, y)
        }
    }

    public func length(): Float64 {
        return unsafe {
            nativePainterPathLength(ptr)
        }
    }

    public func elementCount(): Int64 {
        return Int64(unsafe {
            nativePainterPathElementCount(ptr)
        })
    }
}
