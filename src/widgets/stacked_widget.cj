package cjqt.widgets

foreign func nativeStackedWidgetCreate(parentPtr: Int64): Int64
foreign func nativeStackedWidgetDelete(ptr: Int64): Unit
foreign func nativeStackedWidgetAddWidget(ptr: Int64, widgetPtr: Int64): Int32
foreign func nativeStackedWidgetCount(ptr: Int64): Int32
foreign func nativeStackedWidgetCurrentIndex(ptr: Int64): Int32
foreign func nativeStackedWidgetSetCurrentIndex(ptr: Int64, index: Int32): Unit
foreign func nativeStackedWidgetSetCurrentWidget(ptr: Int64, widgetPtr: Int64): Unit
foreign func nativeStackedWidgetWidget(ptr: Int64, index: Int32): Int64
foreign func nativeStackedWidgetRemoveWidget(ptr: Int64, widgetPtr: Int64): Unit

public class QStackedWidget <: QWidget {
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeStackedWidgetCreate(parent.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeStackedWidgetDelete(ptr)
        }
    }

    public func addWidget(widget: QWidget): Int64 {
        return Int64(unsafe {
            nativeStackedWidgetAddWidget(ptr, widget.ptr)
        })
    }

    public func count(): Int64 {
        return Int64(unsafe {
            nativeStackedWidgetCount(ptr)
        })
    }

    public func currentIndex(): Int64 {
        return Int64(unsafe {
            nativeStackedWidgetCurrentIndex(ptr)
        })
    }

    public func setCurrentIndex(index: Int64) {
        unsafe {
            nativeStackedWidgetSetCurrentIndex(ptr, Int32(index))
        }
    }

    public func setCurrentWidget(widget: QWidget) {
        unsafe {
            nativeStackedWidgetSetCurrentWidget(ptr, widget.ptr)
        }
    }

    public func widget(index: Int64): QWidget {
        let w = unsafe {
            nativeStackedWidgetWidget(ptr, Int32(index))
        }
        return QWidget(w)
    }

    public func removeWidget(widget: QWidget) {
        unsafe {
            nativeStackedWidgetRemoveWidget(ptr, widget.ptr)
        }
    }
}
