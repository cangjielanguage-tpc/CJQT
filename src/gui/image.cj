package cjqt.gui

import cjqt.core.*

foreign func nativeImageCreate(width: Int32, height: Int32, format: Int32): Int64
foreign func nativeImageCreateFromFile(path: CString): Int64
foreign func nativeImageDelete(ptr: Int64): Unit
foreign func nativeImageWidth(ptr: Int64): Int32
foreign func nativeImageHeight(ptr: Int64): Int32
foreign func nativeImageIsNull(ptr: Int64): Bool
foreign func nativeImageFill(ptr: Int64, rgba: UInt32): Unit
foreign func nativeImageLoad(ptr: Int64, path: CString): Bool
foreign func nativeImageSave(ptr: Int64, path: CString): Bool
foreign func nativeImagePixelColor(ptr: Int64, x: Int32, y: Int32): UInt32
foreign func nativeImageSetPixelColor(ptr: Int64, x: Int32, y: Int32, rgba: UInt32): Bool

public enum QImageFormat {
    | Format_Invalid
    | Format_RGB32
    | Format_ARGB32
    | Format_ARGB32_Premultiplied
    | Format_RGB16
    | Format_Grayscale8

    public func value(): Int32 {
        return match (this) {
            case Format_Invalid => 0
            case Format_RGB32 => 4
            case Format_ARGB32 => 5
            case Format_ARGB32_Premultiplied => 6
            case Format_RGB16 => 7
            case Format_Grayscale8 => 24
        }
    }
}

public class QImage {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(width: Int64, height: Int64, format: QImageFormat) {
        this.ptr = unsafe {
            nativeImageCreate(Int32(width), Int32(height), format.value())
        }
    }

    public init(path: String) {
        this.ptr = unsafe {
            let p = LibC.mallocCString(path)
            let r = nativeImageCreateFromFile(p)
            LibC.free(p)
            r
        }
    }

    public func delete(): Unit {
        unsafe {
            nativeImageDelete(ptr)
        }
    }

    public func width(): Int64 {
        return Int64(unsafe { nativeImageWidth(ptr) })
    }

    public func height(): Int64 {
        return Int64(unsafe { nativeImageHeight(ptr) })
    }

    public func isNull(): Bool {
        return unsafe { nativeImageIsNull(ptr) }
    }

    public func fill(color: QColor): Unit {
        unsafe {
            nativeImageFill(ptr, color.rgba())
        }
    }

    public func load(path: String): Bool {
        return unsafe {
            let p = LibC.mallocCString(path)
            let r = nativeImageLoad(ptr, p)
            LibC.free(p)
            r
        }
    }

    public func save(path: String): Bool {
        return unsafe {
            let p = LibC.mallocCString(path)
            let r = nativeImageSave(ptr, p)
            LibC.free(p)
            r
        }
    }

    public func pixelColor(x: Int64, y: Int64): QColor {
        let rgba = unsafe {
            nativeImagePixelColor(ptr, Int32(x), Int32(y))
        }
        return QColor(rgba)
    }

    public func setPixelColor(x: Int64, y: Int64, color: QColor): Bool {
        return unsafe {
            nativeImageSetPixelColor(ptr, Int32(x), Int32(y), color.rgba())
        }
    }
}
