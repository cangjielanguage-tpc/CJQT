package qt.gui

foreign func nativeBrushCreate(colorPtr: Int64): Int64
foreign func nativeBrushDelete(ptr: Int64): Unit

public class QBrush {
    public let ptr: Int64

    public init(color: QColor) {
        ptr = unsafe {
            nativeBrushCreate(color.ptr)
        }
    }

    public func delete() {
        unsafe {
            nativeBrushDelete(ptr)
        }
    }
}