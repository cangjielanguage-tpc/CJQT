package cjqt.gui

foreign func nativeTextDocumentCreate(): Int64
foreign func nativeTextDocumentCreateFromString(text: CString): Int64
foreign func nativeTextDocumentDelete(ptr: Int64): Unit
foreign func nativeTextDocumentToPlainText(ptr: Int64): CString
foreign func nativeTextDocumentToHtml(ptr: Int64): CString
foreign func nativeTextDocumentSetPlainText(ptr: Int64, text: CString): Unit
foreign func nativeTextDocumentSetHtml(ptr: Int64, html: CString): Unit
foreign func nativeTextDocumentIsModified(ptr: Int64): Bool
foreign func nativeTextDocumentSetModified(ptr: Int64, b: Bool): Unit
foreign func nativeTextDocumentCharacterCount(ptr: Int64): Int32
foreign func nativeTextDocumentBlockCount(ptr: Int64): Int32

public class QTextDocument {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe { nativeTextDocumentCreate() }
    }

    public init(text: String) {
        this.ptr = unsafe {
            let t = LibC.mallocCString(text)
            let r = nativeTextDocumentCreateFromString(t)
            LibC.free(t)
            r
        }
    }

    public func delete(): Unit {
        unsafe { nativeTextDocumentDelete(ptr) }
    }

    public func toPlainText(): String {
        return unsafe { nativeTextDocumentToPlainText(ptr).toString() }
    }

    public func toHtml(): String {
        return unsafe { nativeTextDocumentToHtml(ptr).toString() }
    }

    public func setPlainText(text: String) {
        unsafe {
            let t = LibC.mallocCString(text)
            nativeTextDocumentSetPlainText(ptr, t)
            LibC.free(t)
        }
    }

    public func setHtml(html: String) {
        unsafe {
            let h = LibC.mallocCString(html)
            nativeTextDocumentSetHtml(ptr, h)
            LibC.free(h)
        }
    }

    public func isModified(): Bool {
        return unsafe { nativeTextDocumentIsModified(ptr) }
    }

    public func setModified(b: Bool) {
        unsafe { nativeTextDocumentSetModified(ptr, b) }
    }

    public func characterCount(): Int64 {
        return Int64(unsafe { nativeTextDocumentCharacterCount(ptr) })
    }

    public func blockCount(): Int64 {
        return Int64(unsafe { nativeTextDocumentBlockCount(ptr) })
    }
}
