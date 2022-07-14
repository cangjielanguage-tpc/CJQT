package qt.widgets

foreign func nativeVBoxLayoutCreate(parentPtr: Int64): Int64
foreign func nativeVBoxLayoutDelete(ptr: Int64): Unit

public class QVBoxLayout <: QBoxLayout {
    public init(parent!: QWidget = QWidget()) {
        super(
            unsafe {
                nativeVBoxLayoutCreate(parent.ptr)
            }
        )
    }

    public override func delete() {
        unsafe {
            nativeVBoxLayoutDelete(ptr)
        }
    }
}
