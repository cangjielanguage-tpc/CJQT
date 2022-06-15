package qt.gui

foreign func nativeColorCreate(r: Int32, g: Int32, b: Int32, a: Int32): Int64
foreign func nativeColorDelete(ptr: Int64): Unit

public class QColor {
    public let ptr: Int64

    public init(r: Int32, g: Int32, b: Int32, a: Int32) {
        ptr = unsafe {
            nativeColorCreate(r, g, b, a)
        }
    }

    public func delete() {
        unsafe {
            nativeColorDelete(ptr)
        }
    }
}
