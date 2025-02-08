package cjqt.gui


foreign func nativeGradientSetColorAt(ptr:Int64 ,pos:Float64,colorPtr:UInt32):Unit

public open class QGradient{
    
    public let ptr: Int64
    
    public init(ptr: Int64) {
        this.ptr = ptr
    }    

    public func setColorAt(pos:Float64, color:QColor):Unit{
        unsafe {
            nativeGradientSetColorAt(ptr,pos,color.ptr)
        }
    }

}