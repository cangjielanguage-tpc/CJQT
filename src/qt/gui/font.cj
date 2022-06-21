package qt.gui

foreign func nativeFontCreate(fontPtr: Int64): Int64
foreign func nativeFontSetPointSize(ptr: Int64, size: Int32): Unit
foreign func nativeFontDelete(ptr: Int64): Unit

public class QFont {
    public let ptr: Int64

    public init() {
        ptr = unsafe {
            nativeFontCreate(0)
        }
    }

    public init(font: QFont) {
        ptr = unsafe {
            nativeFontCreate(font.ptr)
        }
    }

    public func setPointSize(size: Int64) {
        unsafe {
            nativeFontSetPointSize(ptr, Int32(size))
        }
    }

    public func delete() {
        unsafe {
            nativeFontDelete(ptr)
        }
    }
}