package cjqt.gui

import cjqt.core.QMimeData

foreign func nativeDragCreate(widgetPtr: Int64): Int64
foreign func nativeDragDelete(ptr: Int64): Unit
foreign func nativeDragSetMimeData(ptr: Int64, mimePtr: Int64): Unit

public class QDrag {
    public let ptr: Int64

    public init(sourcePtr: Int64) {
        this.ptr = unsafe { nativeDragCreate(sourcePtr) }
    }

    public func delete(): Unit {
        unsafe { nativeDragDelete(ptr) }
    }

    public func setMimeData(mime: QMimeData) {
        unsafe {
            nativeDragSetMimeData(ptr, mime.ptr)
        }
    }
}
