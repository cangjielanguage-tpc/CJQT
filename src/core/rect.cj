package cjqt.core

//c
foreign func nativeRectCreate(x: Int32, y: Int32, width: Int32, height: Int32): Int64
foreign func nativeRectDelete(ptr: Int64): Unit
foreign func nativeRectWidth(ptr: Int64):Int32
foreign func nativeRectHeight(ptr: Int64):Int32
foreign func nativeRectX(ptr: Int64):Int32
foreign func nativeRectY(ptr: Int64):Int32

@C
public  struct QRect {
    // public let ptr: Int64
    public var x:Int32=0;
    public var y:Int32=0;
    public var width:Int32=0;
    public var height:Int32=0;

    public init(x: Int32, y: Int32, width: Int32, height: Int32) {
        this.x=x
        this.y=y
        this.width=width
        this.height=height

        // ptr = unsafe {
        //     nativeRectCreate(Int32(x), Int32(y), Int32(width), Int32(height))
        // }
    }
    // public init(ptr: Int64) {
    //     this.ptr = ptr
    // }

    public  func delete() {
        // return unsafe {
        //     nativeRectDelete(this.ptr)
        // }
    }
    // public func width():Int32{
    //     return unsafe {
    //         nativeRectWidth(this.ptr)
    //     }
    // }
    // public func height():Int32{
    //     return unsafe {
    //         nativeRectHeight(this.ptr)
    //     }
    // }
    // public func x():Int32{
    //     return unsafe {
    //         nativeRectX(this.ptr)
    //     }
    // }
    // public func y():Int32{
    //     return unsafe {
    //         nativeRectY(this.ptr)
    //     }
    // }
}
