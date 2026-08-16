package cjqt.core

foreign func nativeEasingCurveCreate(curveType: Int32): Int64
foreign func nativeEasingCurveDelete(ptr: Int64): Unit
foreign func nativeEasingCurveType(ptr: Int64): Int32
foreign func nativeEasingCurveSetType(ptr: Int64, curveType: Int32): Unit
foreign func nativeEasingCurveValueForProgress(ptr: Int64, progress: Float64): Float64

public enum QEasingCurveType {
    | Linear
    | InQuad
    | OutQuad
    | InOutQuad
    | InCubic
    | OutCubic
    | InOutCubic
    | InSine
    | OutSine
    | InOutSine

    public func value(): Int32 {
        return match (this) {
            case Linear => 0
            case InQuad => 1
            case OutQuad => 2
            case InOutQuad => 3
            case InCubic => 4
            case OutCubic => 5
            case InOutCubic => 6
            case InSine => 7
            case OutSine => 8
            case InOutSine => 9
        }
    }
}

public class QEasingCurve {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(curveType: QEasingCurveType) {
        this.ptr = unsafe { nativeEasingCurveCreate(curveType.value()) }
    }

    public func delete(): Unit {
        unsafe { nativeEasingCurveDelete(ptr) }
    }

    public func curveType(): QEasingCurveType {
        let t = unsafe { nativeEasingCurveType(ptr) }
        return match (t) {
            case 0 => QEasingCurveType.Linear
            case 1 => QEasingCurveType.InQuad
            case 2 => QEasingCurveType.OutQuad
            case 3 => QEasingCurveType.InOutQuad
            case 4 => QEasingCurveType.InCubic
            case 5 => QEasingCurveType.OutCubic
            case 6 => QEasingCurveType.InOutCubic
            case 7 => QEasingCurveType.InSine
            case 8 => QEasingCurveType.OutSine
            case _ => QEasingCurveType.InOutSine
        }
    }

    public func setType(curveType: QEasingCurveType) {
        unsafe { nativeEasingCurveSetType(ptr, curveType.value()) }
    }

    public func valueForProgress(progress: Float64): Float64 {
        return unsafe { nativeEasingCurveValueForProgress(ptr, progress) }
    }
}
