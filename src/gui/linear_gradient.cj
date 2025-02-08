package cjqt.gui

foreign func nativeLinearGradientCreate (xStart:Float64,yStart:Float64,xFinalStop:Float64,yFinalStop:Float64):Int64

public class QLinearGradient <:QGradient {
    
    
    public init(ptr: Int64) {
        super(ptr)
    }

    public init(xStart:Float64,yStart:Float64,xFinalStop:Float64,yFinalStop:Float64) {
        super(
            unsafe {
                nativeLinearGradientCreate(xStart,yStart,xFinalStop,yFinalStop)
            }
        )
    }

}