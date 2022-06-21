package qt.gui

foreign func nativePaletteCreate(): Int64
foreign func nativePaletteCreateForColor(colorPtr: Int64): Int64
foreign func nativePaletteCreateForPalette(palettePtr: Int64): Int64
foreign func nativePaletteSetColor(ptr: Int64, colorRole: Int32, colorPtr: Int64): Unit
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

    public func setColor(colorRole: ColorRole, color: QColor) {
        unsafe {
            nativePaletteSetColor(ptr, colorRole.value(), color.ptr)
        }
    }

    public func delete() {
        unsafe {
            nativePenDelete(ptr)
        }
    }
}

public enum ColorRole {
    WindowText |
    Button |
    Light |
    Midlight |
    Dark |
    Mid |
    Text |
    BrightText |
    ButtonText |
    Base |
    Window |
    Shadow |
    Highlight |
    HighlightedText |
    Link |
    LinkVisited |
    AlternateBase |
    NoRole |
    ToolTipBase |
    ToolTipText |
    PlaceholderText |
    NColorRoles

    public func value(): Int32 {
        return match (this) {
            case WindowText => 0
            case Button => 1
            case Light => 2
            case Midlight => 3
            case Dark => 4
            case _ => 0
        }
    }
}
