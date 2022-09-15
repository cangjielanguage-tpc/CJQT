package qt.gui

//foreign function
foreign func nativePixmapCreateWithWH(w: Int32, h: Int32): Int64
foreign func nativePixmapGetWidth(ptr: Int64): Int32
foreign func nativePixmapGetHeight(ptr: Int64): Int32
foreign func nativePixmapDelete(ptr: Int64): Unit
foreign func nativePixmapFill(ptr: Int64, colorPtr: Int64): Unit

public open class QPixmap <: QPaintDevice {
    public init(ptr: Int64) {
        super(ptr)
    }
    public init(w: Int64, h: Int64) {
        super(
            unsafe {
                nativePixmapCreateWithWH(Int32(w), Int32(h))
            }
        )
    }
    public func getWidth(): Int64 {
        return Int64(unsafe {
                nativePixmapGetWidth(this.ptr)
            })
    }
    public func getHeight(): Int64 {
        return Int64(unsafe {
                nativePixmapGetHeight(this.ptr)
            })
    }
    public open override func delete() {
        unsafe {
            nativePixmapDelete(this.ptr)
        }
    }

    public func fill(color: QColor): Unit {
        unsafe { nativePixmapFill(this.ptr, color.ptr) }
    }
}
