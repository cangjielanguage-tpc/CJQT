package cjqt.gui

foreign func nativePainterPathStrokerCreate(): Int64
foreign func nativePainterPathStrokerDelete(ptr: Int64): Unit
foreign func nativePainterPathStrokerSetWidth(ptr: Int64, width: Float64): Unit
foreign func nativePainterPathStrokerWidth(ptr: Int64): Float64
foreign func nativePainterPathStrokerCreateStroke(ptr: Int64, pathPtr: Int64): Int64

public class QPainterPathStroker {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativePainterPathStrokerCreate() }
    }

    public func delete(): Unit {
        unsafe { nativePainterPathStrokerDelete(ptr) }
    }

    public func setWidth(width: Float64) {
        unsafe { nativePainterPathStrokerSetWidth(ptr, width) }
    }

    public func width(): Float64 {
        return unsafe { nativePainterPathStrokerWidth(ptr) }
    }

    public func createStroke(path: QPainterPath): QPainterPath {
        return QPainterPath(unsafe { nativePainterPathStrokerCreateStroke(ptr, path.ptr) })
    }
}
