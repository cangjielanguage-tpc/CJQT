package cjqt.gui

foreign func nativeImageReaderCreate(path: CString): Int64
foreign func nativeImageReaderDelete(ptr: Int64): Unit
foreign func nativeImageReaderRead(ptr: Int64): Int64
foreign func nativeImageReaderWidth(ptr: Int64): Int32
foreign func nativeImageReaderHeight(ptr: Int64): Int32
foreign func nativeImageReaderFormat(ptr: Int64): CString
foreign func nativeImageReaderCanRead(ptr: Int64): Bool
foreign func nativeImageReaderErrorString(ptr: Int64): CString
foreign func nativeImageReaderImageCount(ptr: Int64): Int32

public class QImageReader {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(path: String) {
        this.ptr = unsafe {
            let p = LibC.mallocCString(path)
            let r = nativeImageReaderCreate(p)
            LibC.free(p)
            r
        }
    }

    public func delete(): Unit {
        unsafe { nativeImageReaderDelete(ptr) }
    }

    public func read(): QImage {
        return QImage(unsafe { nativeImageReaderRead(ptr) })
    }

    public func width(): Int64 {
        return Int64(unsafe { nativeImageReaderWidth(ptr) })
    }

    public func height(): Int64 {
        return Int64(unsafe { nativeImageReaderHeight(ptr) })
    }

    public func format(): String {
        return unsafe { nativeImageReaderFormat(ptr).toString() }
    }

    public func canRead(): Bool {
        return unsafe { nativeImageReaderCanRead(ptr) }
    }

    public func errorString(): String {
        return unsafe { nativeImageReaderErrorString(ptr).toString() }
    }

    public func imageCount(): Int64 {
        return Int64(unsafe { nativeImageReaderImageCount(ptr) })
    }
}
