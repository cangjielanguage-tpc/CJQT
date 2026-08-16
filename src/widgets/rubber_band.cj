package cjqt.widgets

foreign func nativeRubberBandCreate(shape: Int32, parentPtr: Int64): Int64
foreign func nativeRubberBandDelete(ptr: Int64): Unit
foreign func nativeRubberBandMove(ptr: Int64, x: Int32, y: Int32): Unit
foreign func nativeRubberBandResize(ptr: Int64, w: Int32, h: Int32): Unit
foreign func nativeRubberBandWidth(ptr: Int64): Int32
foreign func nativeRubberBandHeight(ptr: Int64): Int32

public enum QRubberBandShape {
    | Line
    | Rectangle

    public func value(): Int32 {
        return match (this) {
            case Line => 0
            case Rectangle => 1
        }
    }
}

public class QRubberBand <: QWidget {
    public init(shape: QRubberBandShape, parent: QWidget) {
        super(
            unsafe {
                nativeRubberBandCreate(shape.value(), parent.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeRubberBandDelete(ptr)
        }
    }

    public func moveBand(x: Int64, y: Int64) {
        unsafe { nativeRubberBandMove(ptr, Int32(x), Int32(y)) }
    }

    public func resizeBand(w: Int64, h: Int64) {
        unsafe { nativeRubberBandResize(ptr, Int32(w), Int32(h)) }
    }

    public func rubberBandWidth(): Int64 {
        return Int64(unsafe { nativeRubberBandWidth(ptr) })
    }

    public func rubberBandHeight(): Int64 {
        return Int64(unsafe { nativeRubberBandHeight(ptr) })
    }
}
