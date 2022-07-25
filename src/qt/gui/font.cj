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

    public init(ptr: Int64) {
        this.ptr = ptr
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

public enum FontWeight {
    Thin | ExtraLight | Light | Normal | Medium | DemiBold | Bold | ExtraBold | Black

    public func value(): Int32 {
        return match (this) {
            case Thin => 0
            case ExtraLight => 12
            case Light => 25
            case Normal => 50
            case Medium => 57
            case DemiBold => 63
            case Bold => 75
            case ExtraBold => 81
            case Black => 87
        }
    }
}
