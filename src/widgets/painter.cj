/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package cjqt.widgets

import cjqt.gui.*
import cjqt.core.*

foreign func nativePainterCreate(widgetPtr: Int64): Int64
foreign func nativePainterCreateWithDevice(devicePtr: Int64): Int64
foreign func nativePainterDelete(ptr: Int64): Unit

foreign func nativePainterPen(ptr: Int64): Int64
foreign func nativePainterSetPen(ptr: Int64, penPtr: Int64): Unit
foreign func nativePainterSetFont(ptr: Int64, fontPtr: Int64): Unit
foreign func nativePainterSetBrush(ptr: Int64, brushPtr: Int64): Unit
foreign func nativePainterSetOpacity(ptr: Int64, opacity: Float32): Unit
foreign func nativePainterDrawLine(ptr: Int64, x: Int32, y: Int32, x1: Int32, y1: Int32): Unit
foreign func nativePainterDrawRect(ptr: Int64, x: Int32, y: Int32, width: Int32, height: Int32): Unit
foreign func nativePainterDrawRoundedRect(ptr: Int64, x: Int32, y: Int32, width: Int32, height: Int32,xRadius:Float64,yRadius:Float64): Unit
foreign func nativePainterDrawRoundedRectR(ptr: Int64, rectPtr: Int64, xRadius:Float64,yRadius:Float64, mode: Int32): Unit
foreign func nativePainterDrawRoundedRectF(ptr: Int64,x:Float64,y:Float64,width:Float64,height:Float64, xRadius:Float64,yRadius:Float64, mode: Int32): Unit
foreign func nativePainterDrawPixmap(ptr: Int64, x: Int32, y: Int32, width: Int32, height: Int32, pixmapPtr: Int64): Unit
foreign func nativePainterTranslate(ptr: Int64, dx: Float64, dy: Float64): Unit
foreign func nativePainterTranslateWithPoint(ptr: Int64, x: Int32, y: Int32): Unit
foreign func nativePainterTranslateWithPointF(ptr: Int64, pointFPrt: Int64): Unit
foreign func nativePainterDrawPolyline(ptr: Int64, polygonFPtr: Int64): Unit
foreign func nativePainterDrawLineF(ptr: Int64,p1x: Float64,p1y: Float64, p2x: Float64, p2y: Float64): Unit

foreign func nativePainterDrawPolygonF(ptr: Int64, polygonFPtr: Int64): Unit
foreign func nativePainterDrawPolygon(ptr: Int64, polygontr: Int64): Unit

foreign func nativePainterDrawStaticTextPointF(ptr:Int64, x:Float64, y:Float64,staticText:CString): Unit
foreign func nativePainterDrawStaticTextPoint(ptr:Int64, topLeftPositionPtr:Int64,staticText:CString): Unit
foreign func nativePainterDrawStaticText(ptr:Int64, x:Int32, y:Int32,staticText:CString): Unit
foreign func nativePainterDrawTextPointF(ptr:Int64, x:Float64,y:Float64,text:CString): Unit
foreign func nativePainterDrawTextPoint(ptr:Int64, topLeftPositionPtr:Int64,text:CString): Unit
foreign func nativePainterDrawText(ptr:Int64, x:Int32, y:Int32,text:CString): Unit
foreign func nativePainterDrawTextRectFFlag(ptr:Int64 ,x:Float64,y:Float64,w:Float64,h:Float64, flags:Int16, text:CString): Unit
foreign func nativePainterDrawTextRectFlag(ptr:Int64, r:Int64, flags:Int16, text:CString): Unit
foreign func drawnativePainterDrawTextXYFlag(ptr:Int64, x:Int32, y:Int32, w:Int32, h:Int32, flags:Int16,text:CString): Unit
foreign func nativePainterDrawTextOption(ptr:Int64,x:Float64,y:Float64,w:Float64,h:Float64, text:CString, optionPtr:Int64): Unit

foreign func nativePainterSetRenderHints(ptr:Int64, hints:Int16,on:Bool): Unit

foreign func nativePainterSave(ptr:Int64):Unit
foreign func nativePainterRestore(ptr:Int64):Unit
foreign func nativePainterBrush(ptr:Int64):Int64
foreign func nativePainterFont(ptr:Int64):Int64

/**
 * The class is QPainter
 * @author wathinst
 */
public enum RenderHint {
    Antialiasing | TextAntialiasing | SmoothPixmapTransform | HighQualityAntialiasing |NonCosmeticDefaultPen|Qt4CompatiblePainting|LosslessImageRendering

    /**
     * The Function is value
     *
     * @return Type  of  Int16
     */
    public func value(): Int16 {
        match (this) {
            case Antialiasing => 0x01
            case TextAntialiasing => 0x02
            case SmoothPixmapTransform => 0x04
            case HighQualityAntialiasing => 0x08
            case NonCosmeticDefaultPen=> 0x10
            case Qt4CompatiblePainting => 0x20
            case LosslessImageRendering=> 0x40
        }
    }

    /**
     * The Function is conver
     *
     * @param RenderHint of Int16
     *
     * @return Type  of   Enum RenderHint
     */
    public static func convert(renderHint: Int16): RenderHint {
        match (renderHint) {
            case 0x01 => Antialiasing
            case 0x02 => TextAntialiasing
            case 0x04 => SmoothPixmapTransform
            case 0x08 => HighQualityAntialiasing
            case 0x10 => NonCosmeticDefaultPen
            case 0x20 => Qt4CompatiblePainting
            case 0x40 => LosslessImageRendering
            case _ => Antialiasing
        }
    }
}
public class QPainter {
    /** let member ptr type is Int64 */
    public let ptr: Int64

    /**
     * The Function is init constructor
     *
     */
    public init(ptr!: Int64 = 0) {
        this.ptr = unsafe {
            nativePainterCreate(ptr)
        }
    }
	/**
     * The Function is init constructor
     *
     * @param widget of QWidget
     */
    public init(widget: QWidget) {
        ptr = unsafe {
            nativePainterCreate(widget.ptr)
        }
    }

    /**
     * The Function is init constructor
     *
     * @param device of QPaintDevice
     */
    public init(device: QPaintDevice) {
        ptr = unsafe {
            nativePainterCreateWithDevice(device.getPtr())
        }
    }

    /**
     * The Function is setPen
     *
     * @param pen of QPen
     */
    public func setPen(pen: QPen) {
        unsafe {
            nativePainterSetPen(ptr, pen.ptr)
        }
    }
    
    public func pen() {
        let penPtr=unsafe {
            nativePainterPen(ptr)
        }
        return QPen(penPtr)
    }
    
    
    public func setFont(font:QFont){
        unsafe {
            nativePainterSetFont(ptr, font.ptr)
        }
    }


    /**
     * The Function is setBrush
     *
     * @param brush of QBrush
     */
    public func setBrush(brush: QBrush) {
        unsafe {
            nativePainterSetBrush(ptr, brush.ptr)
        }
    }

    /**
     * The Function is drawLine
     *
     * @param x of Int64
     * @param y of Int64
     * @param x1 of Int64
     * @param y1 of Int64
     */
    public func drawLine(x: Int64, y: Int64, x1: Int64, y1: Int64) {
        unsafe {
            nativePainterDrawLine(ptr, Int32(x), Int32(y), Int32(x1), Int32(y1))
        }
    }

    public func drawLine(p1: QPointF, p2: QPointF) {
        unsafe {
            nativePainterDrawLineF(ptr,p1.x,p1.y, p2.x,p2.y)
        }
    }


    /**
     * The Function is drawRect
     *
     * @param x of Int64
     * @param y of Int64
     * @param width of Int64
     * @param height of Int64
     */
    public func drawRect(x: Int64, y: Int64, width: Int64, height: Int64) {
        unsafe {
            nativePainterDrawRect(ptr, Int32(x), Int32(y), Int32(width), Int32(height))
        }
    }

    public func drawRoundedRect(x: Int32, y: Int32, width: Int32, height: Int32,  xRadius:Float64,  yRadius:Float64){
        unsafe {
            nativePainterDrawRoundedRect(ptr, Int32(x), Int32(y), Int32(width), Int32(height),xRadius,yRadius)
        }
    }
    

    public func drawRoundedRect(rect:QRectF,  xRadius:Float64,  yRadius:Float64){
        unsafe {
            nativePainterDrawRoundedRectF(this.ptr,rect.x,rect.y,rect.width,rect.height, xRadius,yRadius,0)
        }
    }
    

    public func drawRoundedRect(rect:QRect,  xRadius:Float64,  yRadius:Float64){
        unsafe {
            nativePainterDrawRoundedRect(this.ptr,rect.x,rect.y,rect.width,rect.height, xRadius,yRadius)
        }
    }

    /**
     * The Function is delete
     *
     */
    public func delete() {
        unsafe {
            nativePainterDelete(ptr)
        }
    }

    /**
     * The Function is translate
     *
     * @param dx of Float64
     * @param dy of Float64
     */
    public func translate(dx: Float64, dy: Float64): Unit {
        unsafe {
            nativePainterTranslate(this.ptr, dx, dy)
        }
    }

    /**
     * The Function is translate
     *
     * @param offset of QPoint
     */
    public func translate(offset: QPoint): Unit {
        unsafe {
            nativePainterTranslateWithPoint(this.ptr, offset.x, offset.y)
        }
    }

    /**
     * The Function is translate
     *
     * @param offset of QPointF
     */
    public func translate(offset: QPointF): Unit {
        unsafe {
            nativePainterTranslate(this.ptr, offset.x,offset.y)
        }
    }

    /**
     * The Function is drawPolyline
     *
     * @param points of QPolygonF
     */
    public func drawPolyline(points: QPolygonF): Unit {
        unsafe {
            nativePainterDrawPolyline(this.ptr, points.ptr)
        }
    }
    
 
    public func drawPolygon(points:QPolygonF): Unit{
        unsafe {
            nativePainterDrawPolygonF(this.ptr, points.ptr)
        }
    }

    public func drawPolygon(points:QPolygon): Unit{
        unsafe {
            nativePainterDrawPolygon(this.ptr, points.ptr)
        }
    }

    public func drawStaticText(topLeftPosition:QPointF, staticText:String): Unit {
        unsafe {
            let s=LibC.mallocCString(staticText);
            nativePainterDrawStaticTextPointF(this.ptr,topLeftPosition.x,topLeftPosition.y,s)
            LibC.free(s)
        }
    }
    public func drawStaticText(topLeftPosition:QPoint,staticText:String): Unit {        
        unsafe {
            let s=LibC.mallocCString(staticText);
            nativePainterDrawStaticText(this.ptr, topLeftPosition.x,topLeftPosition.y,s)
            LibC.free(s)
        }
    }
    public func drawStaticText(left:Int32, top:Int32, staticText:String): Unit {        
        unsafe {
            let s=LibC.mallocCString(staticText);
            nativePainterDrawStaticText(this.ptr, left,top,s)
            LibC.free(s)
        }
    }

    public func  drawText(p:QPointF, str:String): Unit {        
        unsafe {
            let s=LibC.mallocCString(str)
            nativePainterDrawTextPointF(this.ptr, p.x,p.y,s)
            LibC.free(s)
        }
    }
    public func drawText(p:QPoint, str:String): Unit {        
        unsafe {
            let s=LibC.mallocCString(str)
            nativePainterDrawText(this.ptr, p.x,p.y,s)
            LibC.free(s)
        }
    }
    public func drawText(x:Int32, y:Int32, str:String): Unit {        
        unsafe {
            let s=LibC.mallocCString(str)
            nativePainterDrawText(this.ptr, x,y,s)
            LibC.free(s)
        }
    }
    
    public func drawText(r:QRectF, flags:Alignment, text:String): Unit {        
        unsafe {
            let t=LibC.mallocCString(text)
            nativePainterDrawTextRectFFlag(ptr,r.x,r.y,r.width,r.height, flags.value(),t)
            LibC.free(t)
        }
    }
    
    public func drawText(r:QRect, flags:Alignment, text:String): Unit {        
        unsafe {
            let t=LibC.mallocCString(text)
            drawnativePainterDrawTextXYFlag(ptr,r.x,r.y,r.width,r.height, flags.value(),t)
            LibC.free(t)
        }
    }
    
    public func drawText(x:Int32, y:Int32,w:Int32, h:Int32, flags:Alignment, text:String): Unit {        
        unsafe {
            let t=LibC.mallocCString(text)
            drawnativePainterDrawTextXYFlag(ptr,x, y, w, h, flags.value(),t)
            LibC.free(t)
        }
    }
    

    public func drawText(r:QRectF, text:String, o:QTextOption): Unit {        
        unsafe {
            let t=LibC.mallocCString(text)
            nativePainterDrawTextOption(this.ptr, r.x,r.y,r.width,r.height,t,o.ptr)
            LibC.free(t)
        }
    }
    
    public func drawText(r:QRectF, text:String): Unit {        
        unsafe {
            let t=LibC.mallocCString(text)
            nativePainterDrawTextOption(this.ptr, r.x,r.y,r.width,r.height,t,0)
            LibC.free(t)
        }
    }
    

    public func setRenderHint(hint:RenderHint ){
        unsafe {
            nativePainterSetRenderHints(this.ptr, hint.value(),true)
        }

    }

    public func setRenderHints(hints:Int16){
        unsafe {
            nativePainterSetRenderHints(this.ptr, hints,true)
        }

    }

    public func save(){
        unsafe{
            nativePainterSave(ptr)
        }
    }
    public func restore(){
        unsafe{
            nativePainterRestore(ptr)  
        }
    }
    public func brush(){
        let brushPtr= unsafe{
        	nativePainterBrush(ptr)
        }
        return QBrush(brushPtr)
    }
    public func font(){
        let fontPtr =unsafe{
            nativePainterFont(ptr)
        }
        return QFont(fontPtr)
    }
}
