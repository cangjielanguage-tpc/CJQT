package qt.gui

foreign func nativePenCreate(colorPtr: Int64, thickness: Int32): Int64
foreign func nativePenDelete(ptr: Int64): Unit

public class QPen {
    public let ptr: Int64

    public init(color: QColor, thickness: Int32) {
        ptr = unsafe {
            nativePenCreate(color.ptr, thickness)
        }
    }

    public func delete() {
        unsafe {
            nativePenDelete(ptr)
        }
    }
}
