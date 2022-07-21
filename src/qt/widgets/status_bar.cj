package qt.widgets

foreign func nativeStatusBarCreate(parentPtr: Int64): Int64
foreign func nativeStatusBarDelete(ptr: Int64): Unit

foreign func nativeStatusBarAddWidget(ptr: Int64, widgetPtr: Int64, stretch: Int32): Unit
foreign func nativeStatusBarInsertWidget(ptr: Int64, index: Int32, widgetPtr: Int64, stretch: Int32): Unit
foreign func nativeStatusBarAddPermanentWidget(ptr: Int64, widgetPtr: Int64, stretch: Int32): Unit
foreign func nativeStatusBarInsertPermanentWidget(ptr: Int64, index: Int32, widgetPtr: Int64, stretch: Int32): Unit
foreign func nativeStatusBarRemoveWidget(ptr: Int64, widgetPtr: Int64): Unit

foreign func nativeStatusBarCurrentMessage(ptr: Int64): CString
foreign func nativeStatusBarShowMessage(ptr: Int64, message: CString, timeout: Int32): Unit
foreign func nativeStatusBarClearMessage(ptr: Int64): Unit

public class QStatusBar <: QWidget {
    public init(parent!: QWidget = QWidget(0)) {
        super(unsafe {
            nativeStatusBarCreate(parent.ptr)
        })
    }

    public override func delete() {
        unsafe {
            nativeStatusBarDelete(ptr)
        }
    }

    public func addWidget(widget: QWidget, stretch!: Int64 = 0) {
        unsafe {
            nativeStatusBarAddWidget(ptr, widget.ptr, Int32(stretch))
        }
    }

    public func insertWidget(index: Int64, widget: QWidget, stretch!: Int64 = 0) {
        unsafe {
            nativeStatusBarInsertWidget(ptr, Int32(index), widget.ptr, Int32(stretch))
        }
    }

    public func addPermanentWidget(widget: QWidget, stretch!: Int64 = 0) {
        unsafe {
            nativeStatusBarAddPermanentWidget(ptr, widget.ptr, Int32(stretch))
        }
    }

    public func insertPermanentWidget(index: Int64, widget: QWidget, stretch!: Int64 = 0) {
        unsafe {
            nativeStatusBarInsertPermanentWidget(ptr, Int32(index), widget.ptr, Int32(stretch))
        }
    }

    public func removeWidget(widget: QWidget) {
        unsafe {
            nativeStatusBarRemoveWidget(ptr, widget.ptr)
        }
    }

    public func currentMessage(): String {
        let result = unsafe {
            nativeStatusBarCurrentMessage(ptr)
        }
        return result.toString()
    }

    public func showMessage(message: String, timeout!: Int64 = 0) {
        unsafe {
            nativeStatusBarShowMessage(ptr, CString(message), Int32(timeout))
        }
    }

    public func clearMessage() {
        unsafe {
            nativeStatusBarClearMessage(ptr)
        }
    }
}