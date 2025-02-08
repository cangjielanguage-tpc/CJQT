package cjqt.gui


foreign func nativeRadialGradientCreate (cx:Float64,cy:Float64,radius:Float64):Int64

public class QRadialGradient <:QGradient {
    public init(ptr: Int64) {
        super(ptr)
    }
    public init(cx: Float64,cy: Float64,radius: Float64) {
        super (unsafe{
            nativeRadialGradientCreate(cx,cy,radius)
        })
    }
}