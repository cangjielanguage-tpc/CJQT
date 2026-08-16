package cjqt.gui

foreign func nativeStaticTextCreate(): Int64
foreign func nativeStaticTextCreateFromText(text: CString): Int64
foreign func nativeStaticTextDelete(ptr: Int64): Unit
foreign func nativeStaticTextSetText(ptr: Int64, text: CString): Unit
foreign func nativeStaticTextText(ptr: Int64): CString
foreign func nativeStaticTextWidth(ptr: Int64): Float64
foreign func nativeStaticTextHeight(ptr: Int64): Float64

public class QStaticText {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativeStaticTextCreate() }
    }

    public init(text: String) {
        this.ptr = unsafe {
            let t = LibC.mallocCString(text)
            let r = nativeStaticTextCreateFromText(t)
            LibC.free(t)
            r
        }
    }

    public func delete(): Unit {
        unsafe { nativeStaticTextDelete(ptr) }
    }

    public func setText(text: String) {
        unsafe {
            let t = LibC.mallocCString(text)
            nativeStaticTextSetText(ptr, t)
            LibC.free(t)
        }
    }

    public func text(): String {
        return unsafe { nativeStaticTextText(ptr).toString() }
    }

    public func width(): Float64 {
        return unsafe { nativeStaticTextWidth(ptr) }
    }

    public func height(): Float64 {
        return unsafe { nativeStaticTextHeight(ptr) }
    }
}
