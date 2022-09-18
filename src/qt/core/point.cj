package qt.core

//foreign function
foreign func nativePointCreateWithXY(xpos: Int32, ypos: Int32): Int64
foreign func nativePointCreate(): Int64
foreign func nativePointDelete(ptr: Int64): Unit
foreign func nativePointRx(ptr: Int64): Int32
foreign func nativePointRy(ptr: Int64): Int32
foreign func nativePointX(ptr: Int64): Int32
foreign func nativePointY(ptr: Int64): Int32

public open class QPoint {
    public let ptr: Int64

    public init() {
        this.ptr = unsafe { nativePointCreate() }
    }
    public init(ptr: Int64) {
        this.ptr = ptr
    }
    public init(xpos: Int64, ypos: Int64) {
        this.ptr = unsafe { nativePointCreateWithXY(Int32(xpos), Int32(ypos)) }
    }

    public open func delete(): Unit {
        unsafe { nativePointDelete(this.ptr) }
    }
    public func rx(): Int64 {
        let rx = unsafe { nativePointRx(this.ptr) }
        return Int64(rx)
    }
    public func ry(): Int64 {
        let ry = unsafe { nativePointRy(this.ptr) }
        return Int64(ry)
    }
    public func x(): Int64 {
        let x = unsafe { nativePointX(this.ptr) }
        return Int64(x)
    }
    public func y(): Int64 {
        let y = unsafe { nativePointY(this.ptr) }
        return Int64(y)
    }
}
