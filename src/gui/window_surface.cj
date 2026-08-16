package cjqt.gui

foreign func nativeWindowCreate(): Int64
foreign func nativeWindowDelete(ptr: Int64): Unit
foreign func nativeWindowSetTitle(ptr: Int64, title: CString): Unit
foreign func nativeWindowTitle(ptr: Int64): CString
foreign func nativeWindowShow(ptr: Int64): Unit
foreign func nativeWindowHide(ptr: Int64): Unit
foreign func nativeWindowIsVisible(ptr: Int64): Bool
foreign func nativeWindowWidth(ptr: Int64): Int32
foreign func nativeWindowHeight(ptr: Int64): Int32
foreign func nativeSurfaceFormatCreate(): Int64
foreign func nativeSurfaceFormatDelete(ptr: Int64): Unit
foreign func nativeSurfaceFormatSetRedBufferSize(ptr: Int64, size: Int32): Unit
foreign func nativeSurfaceFormatRedBufferSize(ptr: Int64): Int32
foreign func nativeSurfaceFormatSetDepthBufferSize(ptr: Int64, size: Int32): Unit
foreign func nativeSurfaceFormatDepthBufferSize(ptr: Int64): Int32
foreign func nativeSurfaceFormatSetSwapInterval(ptr: Int64, interval: Int32): Unit
foreign func nativeSurfaceFormatSwapInterval(ptr: Int64): Int32
foreign func nativeColorSpaceCreate(): Int64
foreign func nativeColorSpaceDelete(ptr: Int64): Unit
foreign func nativeColorSpaceIsValid(ptr: Int64): Bool
foreign func nativePictureCreate(): Int64
foreign func nativePictureDelete(ptr: Int64): Unit
foreign func nativePictureIsNull(ptr: Int64): Bool
foreign func nativePictureWidth(ptr: Int64): Int32
foreign func nativePictureHeight(ptr: Int64): Int32

public class QWindow {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativeWindowCreate() }
    }

    public func delete(): Unit {
        unsafe { nativeWindowDelete(ptr) }
    }

    public func setTitle(title: String) {
        unsafe {
            let t = LibC.mallocCString(title)
            nativeWindowSetTitle(ptr, t)
            LibC.free(t)
        }
    }

    public func title(): String {
        return unsafe { nativeWindowTitle(ptr).toString() }
    }

    public func show() {
        unsafe { nativeWindowShow(ptr) }
    }

    public func hide() {
        unsafe { nativeWindowHide(ptr) }
    }

    public func isVisible(): Bool {
        return unsafe { nativeWindowIsVisible(ptr) }
    }

    public func width(): Int64 {
        return Int64(unsafe { nativeWindowWidth(ptr) })
    }

    public func height(): Int64 {
        return Int64(unsafe { nativeWindowHeight(ptr) })
    }
}

public class QSurfaceFormat {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativeSurfaceFormatCreate() }
    }

    public func delete(): Unit {
        unsafe { nativeSurfaceFormatDelete(ptr) }
    }

    public func setRedBufferSize(size: Int64) {
        unsafe { nativeSurfaceFormatSetRedBufferSize(ptr, Int32(size)) }
    }

    public func redBufferSize(): Int64 {
        return Int64(unsafe { nativeSurfaceFormatRedBufferSize(ptr) })
    }

    public func setDepthBufferSize(size: Int64) {
        unsafe { nativeSurfaceFormatSetDepthBufferSize(ptr, Int32(size)) }
    }

    public func depthBufferSize(): Int64 {
        return Int64(unsafe { nativeSurfaceFormatDepthBufferSize(ptr) })
    }

    public func setSwapInterval(interval: Int64) {
        unsafe { nativeSurfaceFormatSetSwapInterval(ptr, Int32(interval)) }
    }

    public func swapInterval(): Int64 {
        return Int64(unsafe { nativeSurfaceFormatSwapInterval(ptr) })
    }
}

public class QColorSpace {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativeColorSpaceCreate() }
    }

    public func delete(): Unit {
        unsafe { nativeColorSpaceDelete(ptr) }
    }

    public func isValid(): Bool {
        return unsafe { nativeColorSpaceIsValid(ptr) }
    }
}

public class QPicture {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativePictureCreate() }
    }

    public func delete(): Unit {
        unsafe { nativePictureDelete(ptr) }
    }

    public func isNull(): Bool {
        return unsafe { nativePictureIsNull(ptr) }
    }

    public func width(): Int64 {
        return Int64(unsafe { nativePictureWidth(ptr) })
    }

    public func height(): Int64 {
        return Int64(unsafe { nativePictureHeight(ptr) })
    }
}
