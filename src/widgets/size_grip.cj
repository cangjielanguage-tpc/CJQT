package cjqt.widgets

foreign func nativeSizeGripCreate(parentPtr: Int64): Int64
foreign func nativeSizeGripDelete(ptr: Int64): Unit

public class QSizeGrip <: QWidget {
    public init(parent: QWidget) {
        super(
            unsafe {
                nativeSizeGripCreate(parent.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeSizeGripDelete(ptr)
        }
    }
}
