package qt.gui

foreign func nativeColorCreate(r: Int32, g: Int32, b: Int32, a: Int32): Int64
foreign func nativeColorDelete(ptr: Int64): Unit

public class QColor {
    public let ptr: Int64

    public static let Black = QColor(0xFF000000)
    public static let DarkGray = QColor(0xFF444444)
    public static let Gray = QColor(0xFF888888)
    public static let LightGray = QColor(0xFFCCCCCC)
    public static let White = QColor(0xFFFFFFFF)
    public static let Red = QColor(0xFFFF0000)
    public static let Green = QColor(0xFF00FF00)
    public static let Blue = QColor(0xFF0000FF)
    public static let Yellow = QColor(0xFFFFFF00)
    public static let Cyan = QColor(0xFF00FFFF)
    public static let Magenta = QColor(0xFFFF00FF)
    public static let Transparent = QColor(0x00000000)

    public init(argb: UInt32) {
        let a = (argb >> 24) & 0xFF
        let r = (argb >> 16) & 0xFF
        let g = (argb >> 8) & 0xFF
        let b = argb & 0xFF
        ptr = unsafe {
            nativeColorCreate(Int32(r), Int32(g), Int32(b), Int32(a))
        }
    }

    public init(r: UInt8, g: UInt8, b: UInt8, a: UInt8) {
        ptr = unsafe {
            nativeColorCreate(Int32(r), Int32(g), Int32(b), Int32(a))
        }
    }

    public func delete() {
        unsafe {
            nativeColorDelete(ptr)
        }
    }
}
