package cjqt.widgets

import cjqt.gui.*
import cjqt.core.*

foreign func nativeScrollAreaCreate(parentPtr: Int64): Int64
foreign func nativeScrollAreaDelete(ptr: Int64): Unit

foreign func nativeScrollAreaSetWidget(ptr: Int64, widgetPtr: Int64): Unit
foreign func nativeScrollAreaWidget(ptr: Int64): Int64
foreign func nativeScrollAreaTakeWidget(ptr: Int64): Int64

foreign func nativeScrollAreaSetWidgetResizable(ptr: Int64, resizable: Bool): Unit
foreign func nativeScrollAreaWidgetResizable(ptr: Int64): Bool

foreign func nativeScrollAreaSizeHint(ptr: Int64): Int64
foreign func nativeScrollAreaFocusNextPrevChild(ptr: Int64, next: Bool): Bool

foreign func nativeScrollAreaSetAlignment(ptr: Int64, alignment: Int32): Unit
foreign func nativeScrollAreaAlignment(ptr: Int64): Int32

foreign func nativeScrollAreaEnsureVisible(ptr: Int64, x: Int32, y: Int32, xmargin: Int32, ymargin: Int32): Unit
foreign func nativeScrollAreaEnsureWidgetVisible(ptr: Int64, childWidgetPtr: Int64, xmargin: Int32, ymargin: Int32): Unit


public open class QScrollArea <: QFrame {

    public init(parent!: QWidget = QWidget(0)) {
        super(unsafe {
            nativeScrollAreaCreate(parent.ptr)
        })
    }

    public override func delete() {
        unsafe {
            nativeScrollAreaDelete(ptr)
        }
    }

    public func setWidget(widget: QWidget) {
        unsafe {
            nativeScrollAreaSetWidget(ptr, widget.ptr)
        }
    }

    public func widget(): QWidget {
        let result = unsafe {
            nativeScrollAreaWidget(ptr)
        }
        return QWidget(result)
    }

    public func takeWidget(): QWidget {
        let result = unsafe {
            nativeScrollAreaTakeWidget(ptr)
        }
        return QWidget(result)
    }

    public func setWidgetResizable(resizable: Bool) {
        unsafe {
            nativeScrollAreaSetWidgetResizable(ptr, resizable)
        }
    }

    public func widgetResizable(): Bool {
        let result = unsafe {
            nativeScrollAreaWidgetResizable(ptr)
        }
        return result
    }

    public open func sizeHint(): QSize {
        let result = unsafe {
            nativeScrollAreaSizeHint(ptr)
        }
        return QSize(result)
    }

    public func focusNextPrevChild(next: Bool): Bool {
        let result = unsafe {
            nativeScrollAreaFocusNextPrevChild(ptr, next)
        }
        return result
    }

    public func setAlignment(alignment: Int64) {
        unsafe {
            nativeScrollAreaSetAlignment(ptr, Int32(alignment))
        }
    }

    public func alignment(): Int64 {
        let result = unsafe {
            nativeScrollAreaAlignment(ptr)
        }
        return Int64(result)
    }

    public func ensureVisible(x: Int64, y: Int64, xmargin: Int64, ymargin: Int64) {
        unsafe {
            nativeScrollAreaEnsureVisible(ptr, Int32(x), Int32(y), Int32(xmargin), Int32(ymargin))
        }
    }

    public func ensureWidgetVisible(childWidget: QWidget, xmargin: Int64, ymargin: Int64) {
        unsafe {
            nativeScrollAreaEnsureWidgetVisible(ptr, childWidget.ptr, Int32(xmargin), Int32(ymargin))
        }
    }
}