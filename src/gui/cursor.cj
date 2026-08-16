package cjqt.gui

import cjqt.core.*

foreign func nativeCursorCreate(): Int64
foreign func nativeCursorCreateWithShape(shape: Int32): Int64
foreign func nativeCursorDelete(ptr: Int64): Unit
foreign func nativeCursorShape(ptr: Int64): Int32
foreign func nativeCursorPosX(): Int32
foreign func nativeCursorPosY(): Int32
foreign func nativeCursorSetPos(x: Int32, y: Int32): Unit

public enum CursorShape {
    | ArrowCursor
    | UpArrowCursor
    | CrossCursor
    | WaitCursor
    | IBeamCursor
    | SizeVerCursor
    | SizeHorCursor
    | SizeBDiagCursor
    | SizeFDiagCursor
    | SizeAllCursor
    | BlankCursor
    | PointingHandCursor
    | ForbiddenCursor
    | OpenHandCursor
    | ClosedHandCursor
    | WhatsThisCursor
    | BusyCursor

    public func value(): Int32 {
        return match (this) {
            case ArrowCursor => 0
            case UpArrowCursor => 1
            case CrossCursor => 2
            case WaitCursor => 3
            case IBeamCursor => 4
            case SizeVerCursor => 5
            case SizeHorCursor => 6
            case SizeBDiagCursor => 7
            case SizeFDiagCursor => 8
            case SizeAllCursor => 9
            case BlankCursor => 10
            case PointingHandCursor => 11
            case ForbiddenCursor => 12
            case OpenHandCursor => 13
            case ClosedHandCursor => 14
            case WhatsThisCursor => 15
            case BusyCursor => 16
        }
    }
}

public class QCursor {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe {
            nativeCursorCreate()
        }
    }

    public init(shape: CursorShape) {
        this.ptr = unsafe {
            nativeCursorCreateWithShape(shape.value())
        }
    }

    public func delete(): Unit {
        unsafe {
            nativeCursorDelete(ptr)
        }
    }

    public func shape(): CursorShape {
        let s = unsafe {
            nativeCursorShape(ptr)
        }
        return match (s) {
            case 0 => CursorShape.ArrowCursor
            case 1 => CursorShape.UpArrowCursor
            case 2 => CursorShape.CrossCursor
            case 3 => CursorShape.WaitCursor
            case 4 => CursorShape.IBeamCursor
            case 5 => CursorShape.SizeVerCursor
            case 6 => CursorShape.SizeHorCursor
            case 7 => CursorShape.SizeBDiagCursor
            case 8 => CursorShape.SizeFDiagCursor
            case 9 => CursorShape.SizeAllCursor
            case 10 => CursorShape.BlankCursor
            case 11 => CursorShape.PointingHandCursor
            case 12 => CursorShape.ForbiddenCursor
            case 13 => CursorShape.OpenHandCursor
            case 14 => CursorShape.ClosedHandCursor
            case 15 => CursorShape.WhatsThisCursor
            case _ => CursorShape.BusyCursor
        }
    }

    public static func pos(): QPoint {
        let x = unsafe { nativeCursorPosX() }
        let y = unsafe { nativeCursorPosY() }
        return QPoint(x, y)
    }

    public static func setPos(x: Int64, y: Int64): Unit {
        unsafe {
            nativeCursorSetPos(Int32(x), Int32(y))
        }
    }
}
