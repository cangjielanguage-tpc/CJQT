package cjqt.widgets

foreign func nativeFormLayoutCreate(parentPtr: Int64): Int64
foreign func nativeFormLayoutDelete(ptr: Int64): Unit
foreign func nativeFormLayoutAddRow(ptr: Int64, label: CString, fieldPtr: Int64): Unit
foreign func nativeFormLayoutAddRowWidget(ptr: Int64, labelPtr: Int64, fieldPtr: Int64): Unit
foreign func nativeFormLayoutAddRowSpanning(ptr: Int64, widgetPtr: Int64): Unit
foreign func nativeFormLayoutRowCount(ptr: Int64): Int32

public class QFormLayout <: QLayout {
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeFormLayoutCreate(parent.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeFormLayoutDelete(ptr)
        }
    }

    public func addRow(label: String, field: QWidget) {
        unsafe {
            let l = LibC.mallocCString(label)
            nativeFormLayoutAddRow(ptr, l, field.ptr)
            LibC.free(l)
        }
    }

    public func addRow(label: QWidget, field: QWidget) {
        unsafe {
            nativeFormLayoutAddRowWidget(ptr, label.ptr, field.ptr)
        }
    }

    public func addRow(widget: QWidget) {
        unsafe {
            nativeFormLayoutAddRowSpanning(ptr, widget.ptr)
        }
    }

    public func rowCount(): Int64 {
        return Int64(unsafe {
            nativeFormLayoutRowCount(ptr)
        })
    }
}
