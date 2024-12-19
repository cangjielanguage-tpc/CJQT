package cjqt.core

internal import std.math.*

//foreign function
// foreign func nativePointFCreate(xpos: Float64, ypos: Float64): Int64
// foreign func nativePointFCreateWithPoint(pointPtr: Int64): Int64
// foreign func nativePointFDelete(ptr: Int64): Unit
// foreign func nativePointFIsNull(ptr: Int64): Bool
// foreign func nativePointFManhattanLength(ptr: Int64): Float64
// foreign func nativePointFRx(ptr: Int64): Float64
// foreign func nativePointFRy(ptr: Int64): Float64
// foreign func nativePointFSetX(ptr: Int64, x: Float64): Unit
// foreign func nativePointFSetY(ptr: Int64, y: Float64): Unit
// foreign func nativePointFToPoint(ptr: Int64): Int64
// foreign func nativePointFTransposed(ptr: Int64): Int64
// foreign func nativePointFX(ptr: Int64): Float64
// foreign func nativePointFY(ptr: Int64): Float64

@C
public  struct QPointF {
    // public let ptr: Int64
    
    public var x:Float64=0.0;
    public var y:Float64=0.0;

    // public init(ptr: Int64) {
    //     this.ptr = ptr
    // }
    public init(xpos: Float64, ypos: Float64) {
        this.x=xpos
        this.y=ypos
        // this.ptr = unsafe { nativePointFCreate(xpos, ypos) }
    }
    public init(point: QPoint) {
        this.x=Float64(point.x)
        this.y=Float64(point.y)
        // this.ptr = unsafe { nativePointFCreateWithPoint(point.ptr) }
    }
    public func delete(): Unit {
        // unsafe { nativePointFDelete(this.ptr) }
    }
    public func isNull(): Bool {
        return x==0.0&&y==0.0
    }

    public func manhattanLength(): Float64 {
        return abs(this.x) + abs(this.y)
    }
    // public func rx(): Float64 {
    //     return unsafe { nativePointFRx(this.ptr) }
    // }
    // public func ry(): Float64 {
    //     return unsafe { nativePointFRy(this.ptr) }
    // }
    // public func setX(x: Float64): Unit {
    //     unsafe { nativePointFSetX(this.ptr, x) }
    // }
    // public func setY(y: Float64): Unit {
    //     unsafe { nativePointFSetY(this.ptr, y) }
    // }
    public func toPoint(): QPoint {
        return QPoint(Int32(round(this.x)),Int32(round(this.y)))
        //仓颉的round函数为 IEEE-754 的向最近舍入规则，计算浮点数的舍入值。如果该浮点数有两个最近整数，则向偶数舍入。
        // let pointPtr = unsafe { nativePointFToPoint(this.ptr) }
        // return  QPoint(pointPtr)
    }
    public func transposed(): QPointF {
        // let pointFPtr = unsafe { nativePointFTransposed(this.ptr) }
        return QPointF(this.y,this.x)
    }
    // public func x(): Float64 {
    //     return unsafe { nativePointFX(this.ptr) }
    // }
    // public func y(): Float64 {
    //     return unsafe { nativePointFY(this.ptr) }
    // }
}
