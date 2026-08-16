package cjqt.gui

foreign func nativeFontMetricsFCreate(fontPtr: Int64): Int64
foreign func nativeFontMetricsFDelete(ptr: Int64): Unit
foreign func nativeFontMetricsFHeight(ptr: Int64): Float64
foreign func nativeFontMetricsFAscent(ptr: Int64): Float64
foreign func nativeFontMetricsFWidth(ptr: Int64, text: CString): Float64
foreign func nativeFontMetricsFHorizontalAdvance(ptr: Int64, text: CString): Float64

public class QFontMetricsF {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(font: QFont) {
        this.ptr = unsafe { nativeFontMetricsFCreate(font.ptr) }
    }

    public func delete(): Unit {
        unsafe { nativeFontMetricsFDelete(ptr) }
    }

    public func height(): Float64 {
        return unsafe { nativeFontMetricsFHeight(ptr) }
    }

    public func ascent(): Float64 {
        return unsafe { nativeFontMetricsFAscent(ptr) }
    }

    public func width(text: String): Float64 {
        return unsafe {
            let t = LibC.mallocCString(text)
            let r = nativeFontMetricsFWidth(ptr, t)
            LibC.free(t)
            r
        }
    }

    public func horizontalAdvance(text: String): Float64 {
        return unsafe {
            let t = LibC.mallocCString(text)
            let r = nativeFontMetricsFHorizontalAdvance(ptr, t)
            LibC.free(t)
            r
        }
    }
}
