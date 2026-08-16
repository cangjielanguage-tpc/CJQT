package cjqt.gui

foreign func nativeMoveEventCreate(x: Int32, y: Int32, ox: Int32, oy: Int32): Int64
foreign func nativeMoveEventDelete(ptr: Int64): Unit
foreign func nativeMoveEventX(ptr: Int64): Int32
foreign func nativeMoveEventY(ptr: Int64): Int32
foreign func nativeMoveEventOldX(ptr: Int64): Int32
foreign func nativeMoveEventOldY(ptr: Int64): Int32
foreign func nativeShowEventCreate(): Int64
foreign func nativeShowEventDelete(ptr: Int64): Unit
foreign func nativeCloseEventCreate(): Int64
foreign func nativeCloseEventDelete(ptr: Int64): Unit
foreign func nativeCloseEventIsAccepted(ptr: Int64): Bool
foreign func nativeHoverEventCreate(x: Int32, y: Int32): Int64
foreign func nativeHoverEventDelete(ptr: Int64): Unit
foreign func nativeHoverEventX(ptr: Int64): Int32
foreign func nativeHoverEventY(ptr: Int64): Int32

public class QMoveEvent <: QEvent {
    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe { nativeMoveEventDelete(ptr) }
    }

    public func x(): Int64 {
        return Int64(unsafe { nativeMoveEventX(ptr) })
    }

    public func y(): Int64 {
        return Int64(unsafe { nativeMoveEventY(ptr) })
    }

    public func oldX(): Int64 {
        return Int64(unsafe { nativeMoveEventOldX(ptr) })
    }

    public func oldY(): Int64 {
        return Int64(unsafe { nativeMoveEventOldY(ptr) })
    }
}

public class QShowEvent <: QEvent {
    public init(ptr: Int64) {
        super(ptr)
    }

    public init() {
        super(unsafe { nativeShowEventCreate() })
    }

    public override func delete() {
        unsafe { nativeShowEventDelete(ptr) }
    }
}

public class QCloseEvent <: QEvent {
    public init(ptr: Int64) {
        super(ptr)
    }

    public init() {
        super(unsafe { nativeCloseEventCreate() })
    }

    public override func delete() {
        unsafe { nativeCloseEventDelete(ptr) }
    }

}

public class QHoverEvent <: QEvent {
    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe { nativeHoverEventDelete(ptr) }
    }

    public func x(): Int64 {
        return Int64(unsafe { nativeHoverEventX(ptr) })
    }

    public func y(): Int64 {
        return Int64(unsafe { nativeHoverEventY(ptr) })
    }
}
