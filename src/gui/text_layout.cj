package cjqt.gui

foreign func nativeTextLayoutCreate(text: CString): Int64
foreign func nativeTextLayoutDelete(ptr: Int64): Unit
foreign func nativeTextLayoutText(ptr: Int64): CString
foreign func nativeTextLayoutSetFont(ptr: Int64, fontPtr: Int64): Unit
foreign func nativeTextLayoutSetText(ptr: Int64, text: CString): Unit

public class QTextLayout {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(text: String) {
        this.ptr = unsafe {
            let t = LibC.mallocCString(text)
            let r = nativeTextLayoutCreate(t)
            LibC.free(t)
            r
        }
    }

    public func delete(): Unit {
        unsafe { nativeTextLayoutDelete(ptr) }
    }

    public func text(): String {
        return unsafe { nativeTextLayoutText(ptr).toString() }
    }

    public func setFont(font: QFont) {
        unsafe { nativeTextLayoutSetFont(ptr, font.ptr) }
    }

    public func setText(text: String) {
        unsafe {
            let t = LibC.mallocCString(text)
            nativeTextLayoutSetText(ptr, t)
            LibC.free(t)
        }
    }
}
