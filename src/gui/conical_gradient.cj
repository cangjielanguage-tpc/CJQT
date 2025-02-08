package cjqt.gui


foreign func nativeConicalGradientCreate (cx:Float64,cy:Float64,startAngle:Float64):Int64

public class QConicalGradient <:QGradient {
    
    
    public init(ptr: Int64) {
        super(ptr)
    }

    public init(cx:Float64,cy:Float64,startAngle:Float64) {
        super(
            unsafe {
                nativeConicalGradientCreate(cx,cy,startAngle)
            }
        )
    }

}