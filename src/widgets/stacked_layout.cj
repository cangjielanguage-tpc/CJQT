package cjqt.widgets

foreign func nativeStackedLayoutCreate(parentPtr: Int64): Int64
foreign func nativeStackedLayoutDelete(ptr: Int64): Unit
foreign func nativeStackedLayoutAddWidget(ptr: Int64, widgetPtr: Int64): Int32
foreign func nativeStackedLayoutCount(ptr: Int64): Int32
foreign func nativeStackedLayoutCurrentIndex(ptr: Int64): Int32
foreign func nativeStackedLayoutSetCurrentIndex(ptr: Int64, index: Int32): Unit
foreign func nativeStackedLayoutWidget(ptr: Int64, index: Int32): Int64

public class QStackedLayout <: QLayout {
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeStackedLayoutCreate(parent.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeStackedLayoutDelete(ptr)
        }
    }

    public func addWidget(widget: QWidget): Int64 {
        return Int64(unsafe {
            nativeStackedLayoutAddWidget(ptr, widget.ptr)
        })
    }

    public func count(): Int64 {
        return Int64(unsafe { nativeStackedLayoutCount(ptr) })
    }

    public func currentIndex(): Int64 {
        return Int64(unsafe { nativeStackedLayoutCurrentIndex(ptr) })
    }

    public func setCurrentIndex(index: Int64) {
        unsafe { nativeStackedLayoutSetCurrentIndex(ptr, Int32(index)) }
    }

    public func widget(index: Int64): QWidget {
        return QWidget(unsafe { nativeStackedLayoutWidget(ptr, Int32(index)) })
    }
}
