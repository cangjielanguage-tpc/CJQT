package qt.gui

foreign func nativePaletteCreate(): Int64
foreign func nativePaletteCreateForColor(colorPtr: Int64): Int64
foreign func nativePaletteCreateForPalette(palettePtr: Int64): Int64
foreign func nativePaletteDelete(ptr: Int64): Unit

public class QPalette {
    public let ptr: Int64

    public init(color: QColor) {
        ptr = unsafe {
            nativePaletteCreateForColor(color.ptr)
        }
    }

    public init(palette: QPalette) {
        ptr = unsafe {
            nativePaletteCreateForPalette(palette.ptr)
        }
    }

    public init() {
        ptr = unsafe {
            nativePaletteCreate()
        }
    }

    public func delete() {
        unsafe {
            nativePenDelete(ptr)
        }
    }
}
