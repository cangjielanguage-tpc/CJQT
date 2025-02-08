package cjqt.core

//foreign function
// foreign func nativePointCreateWithXY(xpos: Int32, ypos: Int32): Int64
// foreign func nativePointCreate(): Int64
// foreign func nativePointDelete(ptr: Int64): Unit
// foreign func nativePointRx(ptr: Int64): Int32
// foreign func nativePointRy(ptr: Int64): Int32
// foreign func nativePointX(ptr: Int64): Int32
// foreign func nativePointY(ptr: Int64): Int32
@C
public struct QPoint {
    // public let ptr: Int64
    public var x:Int32=0;
    public var y:Int32=0;


    // public init() {
    //     this.ptr = unsafe { nativePointCreate() }
    // }
    // public init(ptr: Int64) {
    //     this.ptr = ptr
    // }
    public init(xpos: Int32, ypos: Int32) {
        this.x=xpos
        this.y=ypos
        // this.ptr = unsafe { nativePointCreateWithXY(Int32(xpos), Int32(ypos)) }
    }

    public  func delete(): Unit {
        // unsafe { nativePointDelete(this.ptr) }
    }
    // public func rx(): Int32 {
    //     // let rx = unsafe { nativePointRx(this.ptr) }
    //     return x
    // }
    // public func ry(): Int32 {
    //     // let ry = unsafe { nativePointRy(this.ptr) }
    //     return y
    // }
    // public func setX(xpos: Int32) {
    //     this.x=xpos
    //     // let x = unsafe { nativePointX(this.ptr) }
    //     // return Int64(x)
    // }
    // public func setY(ypos: Int32) {
    //     this.y=ypos
    //     // let y = unsafe { nativePointY(this.ptr) }
    //     // return Int64(y)
    // }
}
