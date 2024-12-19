package cjqt.core

//foreign funtion
// foreign func nativeRectFCreate(): Int64
// foreign func nativeRectFCreateWithRect(rectPtr: Int64): Int64
// foreign func nativeRectFCreateWithXYWH(x: Float64, y: Float64, width: Float64, height: Float64): Int64
// foreign func nativeRectFCreateWithTwoPoint(x1: Float64, y1: Float64, x2: Float64, y2: Float64): Int64
// foreign func nativeRectFCreateWithPointAndSize(topLeftPtr: Int64, sizePtr: Int64): Int64
// foreign func nativeRectFDelete(ptr: Int64): Unit
@C
public  struct QRectF {
    // public let ptr: Int64
    
    public var x:Float64=0.0;
    public var y:Float64=0.0;
    public var width:Float64=0.0;
    public var height:Float64=0.0;

    // public init() {
    //     this.ptr = unsafe { nativeRectFCreate() }
    // }
    // public init(ptr: Int64) {
    //     this.ptr = ptr
    // }
    // public init(rect: QRect) {
    //     this.ptr = unsafe {
    //         nativeRectFCreateWithRect(rect.ptr)
    //     }
    // }
    public init(x: Float64, y: Float64, width: Float64, height: Float64) {
        this.x=x
        this.y=y
        this.width=width
        this.height=height
        // this.ptr = unsafe { nativeRectFCreateWithXYWH(x, y, width, height) }
    }
    public init(topLeft: QPointF, bottomRight: QPointF) {
        this.x=topLeft.x
        this.y=topLeft.y
        this.width=bottomRight.x-x
        this.height=bottomRight.y-y
        // this.ptr = unsafe { nativeRectFCreateWithTwoPoint(topLeft.x,topLeft.y, bottomRight.x,bottomRight.y) }
    }
    public init(topLeft: QPointF, size: QSizeF) {
        this.x=topLeft.x
        this.y=topLeft.y
        this.width=size.width
        this.height=size.height
        // this.ptr = unsafe { nativeRectFCreateWithPointAndSize(topLeft.ptr, size.ptr) }
    }
    public  func delete() {
        // unsafe { nativeRectFDelete(this.ptr) }
    }
}
