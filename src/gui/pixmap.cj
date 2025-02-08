package cjqt.gui

//foreign function
foreign func nativePixmapCreateWithWH(w: Int32, h: Int32): Int64
foreign func nativePixmapGetWidth(ptr: Int64): Int32
foreign func nativePixmapGetHeight(ptr: Int64): Int32
foreign func nativePixmapDelete(ptr: Int64): Unit
foreign func nativePixmapFill(ptr: Int64, colorPtr: UInt32): Unit

public open class QPixmap <: QPaintDevice {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr=ptr
    }
    public init(w: Int64, h: Int64) {
        let ptr=(
            unsafe {
                nativePixmapCreateWithWH(Int32(w), Int32(h))
            }
        )
        this.ptr=ptr
    }
    public func getPtr(): Int64 {
        return this.ptr
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
    public open  func delete() {
        unsafe {
            nativePixmapDelete(this.ptr)
        }
    }

    public func fill(color: QColor): Unit {
        unsafe { nativePixmapFill(this.ptr, color.ptr) }
    }
}
