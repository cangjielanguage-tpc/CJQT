/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package qt.widgets

foreign func nativePainterCreate(widgetPtr: Int64): Int64
foreign func nativePainterCreateWithDevice(devicePtr: Int64): Int64
foreign func nativePainterDelete(ptr: Int64): Unit

foreign func nativePainterSetPen(ptr: Int64, penPtr: Int64): Unit
foreign func nativePainterSetBrush(ptr: Int64, brushPtr: Int64): Unit
foreign func nativePainterSetOpacity(ptr: Int64, opacity: Float32): Unit
foreign func nativePainterDrawLine(ptr: Int64, x: Int32, y: Int32, x1: Int32, y1: Int32): Unit
foreign func nativePainterDrawRect(ptr: Int64, x: Int32, y: Int32, width: Int32, height: Int32): Unit
foreign func nativePainterDrawPixmap(ptr: Int64, x: Int32, y: Int32, width: Int32, height: Int32, pixmapPtr: Int64): Unit
foreign func nativePainterTranslate(ptr: Int64, dx: Float64, dy: Float64): Unit
foreign func nativePainterTranslateWithPoint(ptr: Int64, pointPrt: Int64): Unit
foreign func nativePainterTranslateWithPointF(ptr: Int64, pointFPrt: Int64): Unit
foreign func nativePainterDrawPolyline(ptr: Int64, polygonFPtr: Int64): Unit

/**
 * The class is QPainter
 * @author wathinst
 */
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
            nativePainterCreateWithDevice(device.ptr)
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
            nativePainterTranslateWithPoint(this.ptr, offset.ptr)
        }
    }

    /**
     * The Function is translate
     *
     * @param offset of QPointF
     */
    public func translate(offset: QPointF): Unit {
        unsafe {
            nativePainterTranslateWithPointF(this.ptr, offset.ptr)
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
}
