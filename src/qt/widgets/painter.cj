package qt.widgets

import qt.gui.*

foreign func nativePainterCreate(widgetPtr: Int64): Int64
foreign func nativePainterDelete(ptr: Int64): Unit

foreign func nativePainterSetPen(ptr: Int64, penPtr: Int64): Unit
foreign func nativePainterSetBrush(ptr: Int64, brushPtr: Int64): Unit
foreign func nativePainterSetOpacity(ptr: Int64, opacity: Float32): Unit
foreign func nativePainterDrawLine(ptr: Int64, x: Int32, y: Int32, x1: Int32, y1: Int32): Unit
foreign func nativePainterDrawRect(ptr: Int64, x: Int32, y: Int32, width: Int32, height: Int32): Unit
foreign func nativePainterDrawPixmap(ptr: Int64, x: Int32, y: Int32, width: Int32, height: Int32, pixmapPtr: Int64): Unit

public class QPainter {
    public let ptr: Int64

    public init() {
        ptr = unsafe {
            nativePainterCreate(0)
        }
    }

    public init(widget: QWidget) {
        ptr = unsafe {
            nativePainterCreate(widget.ptr)
        }
    }

    public func setPen(pen: QPen) {
        unsafe {
            nativePainterSetPen(ptr, pen.ptr)
        }
    }

    public func drawLine(x: Int32, y: Int32, x1: Int32, y1: Int32) {
        unsafe {
            nativePainterDrawLine(ptr, x, y, x1, y1)
        }
    }

    public func drawRect(x: Int32, y: Int32, width: Int32, height: Int32) {
        unsafe {
            nativePainterDrawRect(ptr, x, y, width, height)
        }
    }

    public func delete() {
        unsafe {
            nativePainterDelete(ptr)
        }
    }
}
