package cjqt.core

foreign func nativeMimeDataCreate(): Int64
foreign func nativeMimeDataDelete(ptr: Int64): Unit
foreign func nativeMimeDataHasText(ptr: Int64): Bool
foreign func nativeMimeDataText(ptr: Int64): CString
foreign func nativeMimeDataSetText(ptr: Int64, text: CString): Unit
foreign func nativeMimeDataHasUrls(ptr: Int64): Bool
foreign func nativeMimeDataFormats(ptr: Int64): CString

public class QMimeData {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe {
            nativeMimeDataCreate()
        }
    }

    public func delete(): Unit {
        unsafe {
            nativeMimeDataDelete(ptr)
        }
    }

    public func hasText(): Bool {
        return unsafe {
            nativeMimeDataHasText(ptr)
        }
    }

    public func text(): String {
        return unsafe {
            nativeMimeDataText(ptr).toString()
        }
    }

    public func setText(text: String): Unit {
        unsafe {
            let t = LibC.mallocCString(text)
            nativeMimeDataSetText(ptr, t)
            LibC.free(t)
        }
    }

    public func hasUrls(): Bool {
        return unsafe {
            nativeMimeDataHasUrls(ptr)
        }
    }

    public func formats(): String {
        return unsafe {
            nativeMimeDataFormats(ptr).toString()
        }
    }
}
