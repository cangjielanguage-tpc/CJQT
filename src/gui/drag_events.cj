package cjqt.gui

import cjqt.core.*

foreign func nativeDropEventCreate(x: Int32, y: Int32, mimePtr: Int64): Int64
foreign func nativeDropEventDelete(ptr: Int64): Unit
foreign func nativeDropEventPosX(ptr: Int64): Int32
foreign func nativeDropEventPosY(ptr: Int64): Int32
foreign func nativeDropEventHasFormat(ptr: Int64, format: CString): Bool
foreign func nativeDropEventText(ptr: Int64): CString
foreign func nativeDragEnterEventCreate(x: Int32, y: Int32, mimePtr: Int64): Int64
foreign func nativeDragEnterEventDelete(ptr: Int64): Unit
foreign func nativeDragMoveEventCreate(x: Int32, y: Int32, mimePtr: Int64): Int64
foreign func nativeDragMoveEventDelete(ptr: Int64): Unit
foreign func nativeDragMoveEventAccept(ptr: Int64): Unit
foreign func nativeDragLeaveEventCreate(): Int64
foreign func nativeDragLeaveEventDelete(ptr: Int64): Unit

public open class QDropEvent <: QEvent {
    public init(ptr: Int64) {
        super(ptr)
    }

    public init(x: Int64, y: Int64, mimePtr: Int64) {
        super(unsafe {
            nativeDropEventCreate(Int32(x), Int32(y), mimePtr)
        })
    }

    public open override func delete() {
        unsafe { nativeDropEventDelete(ptr) }
    }

    public func posX(): Int64 {
        return Int64(unsafe { nativeDropEventPosX(ptr) })
    }

    public func posY(): Int64 {
        return Int64(unsafe { nativeDropEventPosY(ptr) })
    }

    public func hasFormat(format: String): Bool {
        return unsafe {
            let f = LibC.mallocCString(format)
            let r = nativeDropEventHasFormat(ptr, f)
            LibC.free(f)
            r
        }
    }

    public func text(): String {
        return unsafe { nativeDropEventText(ptr).toString() }
    }
}

public class QDragEnterEvent <: QDropEvent {
    public init(ptr: Int64) {
        super(ptr)
    }

    public init(x: Int64, y: Int64, mimePtr: Int64) {
        super(unsafe {
            nativeDragEnterEventCreate(Int32(x), Int32(y), mimePtr)
        })
    }

    public override func delete() {
        unsafe { nativeDragEnterEventDelete(ptr) }
    }
}

public class QDragMoveEvent <: QDropEvent {
    public init(ptr: Int64) {
        super(ptr)
    }

    public init(x: Int64, y: Int64, mimePtr: Int64) {
        super(unsafe {
            nativeDragMoveEventCreate(Int32(x), Int32(y), mimePtr)
        })
    }

    public override func delete() {
        unsafe { nativeDragMoveEventDelete(ptr) }
    }
}

public class QDragLeaveEvent <: QEvent {
    public init(ptr: Int64) {
        super(ptr)
    }

    public init() {
        super(unsafe { nativeDragLeaveEventCreate() })
    }

    public override func delete() {
        unsafe { nativeDragLeaveEventDelete(ptr) }
    }
}
