package cjqt.widgets

foreign func nativeErrorMessageCreate(parentPtr: Int64): Int64
foreign func nativeErrorMessageDelete(ptr: Int64): Unit
foreign func nativeErrorMessageShowMessage(ptr: Int64, message: CString): Unit

public class QErrorMessage <: QWidget {
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeErrorMessageCreate(parent.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeErrorMessageDelete(ptr)
        }
    }

    public func showMessage(message: String) {
        unsafe {
            let m = LibC.mallocCString(message)
            nativeErrorMessageShowMessage(ptr, m)
            LibC.free(m)
        }
    }
}
