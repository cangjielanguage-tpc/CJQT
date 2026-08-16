package cjqt.gui

foreign func nativePdfWriterCreate(fileName: CString): Int64
foreign func nativePdfWriterDelete(ptr: Int64): Unit
foreign func nativePdfWriterSetTitle(ptr: Int64, title: CString): Unit
foreign func nativePdfWriterSetCreator(ptr: Int64, creator: CString): Unit
foreign func nativePdfWriterWidth(ptr: Int64): Int32
foreign func nativePdfWriterHeight(ptr: Int64): Int32

public class QPdfWriter {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(fileName: String) {
        this.ptr = unsafe {
            let f = LibC.mallocCString(fileName)
            let r = nativePdfWriterCreate(f)
            LibC.free(f)
            r
        }
    }

    public func delete(): Unit {
        unsafe { nativePdfWriterDelete(ptr) }
    }

    public func setTitle(title: String) {
        unsafe {
            let t = LibC.mallocCString(title)
            nativePdfWriterSetTitle(ptr, t)
            LibC.free(t)
        }
    }

    public func setCreator(creator: String) {
        unsafe {
            let c = LibC.mallocCString(creator)
            nativePdfWriterSetCreator(ptr, c)
            LibC.free(c)
        }
    }

    public func width(): Int64 {
        return Int64(unsafe { nativePdfWriterWidth(ptr) })
    }

    public func height(): Int64 {
        return Int64(unsafe { nativePdfWriterHeight(ptr) })
    }
}
