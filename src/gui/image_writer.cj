package cjqt.gui

foreign func nativeImageWriterCreate(path: CString): Int64
foreign func nativeImageWriterDelete(ptr: Int64): Unit
foreign func nativeImageWriterWrite(ptr: Int64, imagePtr: Int64): Bool
foreign func nativeImageWriterSetFormat(ptr: Int64, format: CString): Unit
foreign func nativeImageWriterFormat(ptr: Int64): CString
foreign func nativeImageWriterErrorString(ptr: Int64): CString
foreign func nativeImageWriterCanWrite(ptr: Int64): Bool

public class QImageWriter {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(path: String) {
        this.ptr = unsafe {
            let p = LibC.mallocCString(path)
            let r = nativeImageWriterCreate(p)
            LibC.free(p)
            r
        }
    }

    public func delete(): Unit {
        unsafe { nativeImageWriterDelete(ptr) }
    }

    public func write(image: QImage): Bool {
        return unsafe { nativeImageWriterWrite(ptr, image.ptr) }
    }

    public func setFormat(format: String) {
        unsafe {
            let f = LibC.mallocCString(format)
            nativeImageWriterSetFormat(ptr, f)
            LibC.free(f)
        }
    }

    public func format(): String {
        return unsafe { nativeImageWriterFormat(ptr).toString() }
    }

    public func errorString(): String {
        return unsafe { nativeImageWriterErrorString(ptr).toString() }
    }

    public func canWrite(): Bool {
        return unsafe { nativeImageWriterCanWrite(ptr) }
    }
}
