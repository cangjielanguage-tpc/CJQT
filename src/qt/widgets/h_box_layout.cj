package qt.widgets

foreign func nativeHBoxLayoutCreate(parentPtr: Int64): Int64
foreign func nativeHBoxLayoutDelete(ptr: Int64): Unit

public class QHBoxLayout <: QBoxLayout {
    public init(parent!: QWidget = QWidget()) {
        super(
            unsafe {
                nativeHBoxLayoutCreate(parent.ptr)
            }
        )
    }

    public override func delete() {
        unsafe {
            nativeHBoxLayoutDelete(ptr)
        }
    }
}