package cjqt.gui

foreign func nativeFontMetricsCreate(fontPtr: Int64): Int64
foreign func nativeFontMetricsDelete(ptr: Int64): Unit
foreign func nativeFontMetricsHeight(ptr: Int64): Int32
foreign func nativeFontMetricsAscent(ptr: Int64): Int32
foreign func nativeFontMetricsDescent(ptr: Int64): Int32
foreign func nativeFontMetricsWidth(ptr: Int64, text: CString): Int32
foreign func nativeFontMetricsHorizontalAdvance(ptr: Int64, text: CString): Int32

public class QFontMetrics {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(font: QFont) {
        this.ptr = unsafe {
            nativeFontMetricsCreate(font.ptr)
        }
    }

    public func delete(): Unit {
        unsafe {
            nativeFontMetricsDelete(ptr)
        }
    }

    public func height(): Int64 {
        return Int64(unsafe {
            nativeFontMetricsHeight(ptr)
        })
    }

    public func ascent(): Int64 {
        return Int64(unsafe {
            nativeFontMetricsAscent(ptr)
        })
    }

    public func descent(): Int64 {
        return Int64(unsafe {
            nativeFontMetricsDescent(ptr)
        })
    }

    public func width(text: String): Int64 {
        return Int64(unsafe {
            let t = LibC.mallocCString(text)
            let r = nativeFontMetricsWidth(ptr, t)
            LibC.free(t)
            r
        })
    }

    public func horizontalAdvance(text: String): Int64 {
        return Int64(unsafe {
            let t = LibC.mallocCString(text)
            let r = nativeFontMetricsHorizontalAdvance(ptr, t)
            LibC.free(t)
            r
        })
    }
}
