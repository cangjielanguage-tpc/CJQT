package cjqt.gui

foreign func nativeFontInfoCreate(fontPtr: Int64): Int64
foreign func nativeFontInfoDelete(ptr: Int64): Unit
foreign func nativeFontInfoFamily(ptr: Int64): CString
foreign func nativeFontInfoPointSize(ptr: Int64): Int32
foreign func nativeFontInfoPixelSize(ptr: Int64): Int32
foreign func nativeFontInfoBold(ptr: Int64): Bool
foreign func nativeFontInfoItalic(ptr: Int64): Bool

public class QFontInfo {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(font: QFont) {
        this.ptr = unsafe { nativeFontInfoCreate(font.ptr) }
    }

    public func delete(): Unit {
        unsafe { nativeFontInfoDelete(ptr) }
    }

    public func family(): String {
        return unsafe { nativeFontInfoFamily(ptr).toString() }
    }

    public func pointSize(): Int64 {
        return Int64(unsafe { nativeFontInfoPointSize(ptr) })
    }

    public func pixelSize(): Int64 {
        return Int64(unsafe { nativeFontInfoPixelSize(ptr) })
    }

    public func bold(): Bool {
        return unsafe { nativeFontInfoBold(ptr) }
    }

    public func italic(): Bool {
        return unsafe { nativeFontInfoItalic(ptr) }
    }
}
