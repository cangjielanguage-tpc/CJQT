package cjqt.widgets

foreign func nativeToolBoxCreate(parentPtr: Int64): Int64
foreign func nativeToolBoxDelete(ptr: Int64): Unit
foreign func nativeToolBoxAddItem(ptr: Int64, widgetPtr: Int64, text: CString): Int32
foreign func nativeToolBoxCount(ptr: Int64): Int32
foreign func nativeToolBoxCurrentIndex(ptr: Int64): Int32
foreign func nativeToolBoxSetCurrentIndex(ptr: Int64, index: Int32): Unit
foreign func nativeToolBoxItemText(ptr: Int64, index: Int32): CString
foreign func nativeToolBoxSetItemText(ptr: Int64, index: Int32, text: CString): Unit
foreign func nativeToolBoxRemoveItem(ptr: Int64, index: Int32): Unit

public class QToolBox <: QWidget {
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeToolBoxCreate(parent.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeToolBoxDelete(ptr)
        }
    }

    public func addItem(widget: QWidget, text: String): Int64 {
        return Int64(unsafe {
            let t = LibC.mallocCString(text)
            let r = nativeToolBoxAddItem(ptr, widget.ptr, t)
            LibC.free(t)
            r
        })
    }

    public func count(): Int64 {
        return Int64(unsafe {
            nativeToolBoxCount(ptr)
        })
    }

    public func currentIndex(): Int64 {
        return Int64(unsafe {
            nativeToolBoxCurrentIndex(ptr)
        })
    }

    public func setCurrentIndex(index: Int64) {
        unsafe {
            nativeToolBoxSetCurrentIndex(ptr, Int32(index))
        }
    }

    public func itemText(index: Int64): String {
        return unsafe {
            nativeToolBoxItemText(ptr, Int32(index)).toString()
        }
    }

    public func setItemText(index: Int64, text: String) {
        unsafe {
            let t = LibC.mallocCString(text)
            nativeToolBoxSetItemText(ptr, Int32(index), t)
            LibC.free(t)
        }
    }

    public func removeItem(index: Int64) {
        unsafe {
            nativeToolBoxRemoveItem(ptr, Int32(index))
        }
    }
}
