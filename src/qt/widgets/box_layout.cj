package qt.widgets

foreign func nativeBoxLayoutCreate(parentPtr: Int64): Int64
foreign func nativeBoxLayoutAddWidget(ptr: Int64, widgetPtr: Int64): Unit
foreign func nativeBoxLayoutDelete(ptr: Int64): Unit

public open class QBoxLayout <: QLayout {
    public init(parent!: QWidget = QWidget()) {
        super(
            unsafe {
                nativeBoxLayoutCreate(parent.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public func addWidget(widget: QWidget) {
        unsafe {
            nativeBoxLayoutAddWidget(ptr, widget.ptr)
        }
    }

    public override open func delete() {
        unsafe {
            nativeBoxLayoutDelete(ptr)
        }
    }
}
