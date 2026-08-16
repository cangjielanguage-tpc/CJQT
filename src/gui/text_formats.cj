package cjqt.gui

foreign func nativeCharFormatCreate(): Int64
foreign func nativeCharFormatDelete(ptr: Int64): Unit
foreign func nativeCharFormatSetFontWeight(ptr: Int64, weight: Int32): Unit
foreign func nativeCharFormatFontWeight(ptr: Int64): Int32
foreign func nativeCharFormatSetFontItalic(ptr: Int64, b: Bool): Unit
foreign func nativeCharFormatFontItalic(ptr: Int64): Bool
foreign func nativeCharFormatSetFontUnderline(ptr: Int64, b: Bool): Unit
foreign func nativeCharFormatFontUnderline(ptr: Int64): Bool
foreign func nativeCharFormatSetFontPointSize(ptr: Int64, size: Float64): Unit
foreign func nativeCharFormatFontPointSize(ptr: Int64): Float64
foreign func nativeBlockFormatCreate(): Int64
foreign func nativeBlockFormatDelete(ptr: Int64): Unit
foreign func nativeBlockFormatSetAlignment(ptr: Int64, alignment: Int32): Unit
foreign func nativeBlockFormatAlignment(ptr: Int64): Int32
foreign func nativeBlockFormatSetTopMargin(ptr: Int64, margin: Float64): Unit
foreign func nativeBlockFormatTopMargin(ptr: Int64): Float64
foreign func nativeTextDocumentFragmentCreate(text: CString): Int64
foreign func nativeTextDocumentFragmentDelete(ptr: Int64): Unit
foreign func nativeTextDocumentFragmentToPlainText(ptr: Int64): CString
foreign func nativeTextDocumentFragmentToHtml(ptr: Int64): CString

public class QTextCharFormat <: QTextFormat {
    public init(ptr: Int64) {
        super(ptr)
    }

    public init() {
        super(unsafe { nativeCharFormatCreate() })
    }

    public override func delete() {
        unsafe { nativeCharFormatDelete(ptr) }
    }

    public func setFontWeight(weight: Int64) {
        unsafe { nativeCharFormatSetFontWeight(ptr, Int32(weight)) }
    }

    public func fontWeight(): Int64 {
        return Int64(unsafe { nativeCharFormatFontWeight(ptr) })
    }

    public func setFontItalic(b: Bool) {
        unsafe { nativeCharFormatSetFontItalic(ptr, b) }
    }

    public func fontItalic(): Bool {
        return unsafe { nativeCharFormatFontItalic(ptr) }
    }

    public func setFontUnderline(b: Bool) {
        unsafe { nativeCharFormatSetFontUnderline(ptr, b) }
    }

    public func fontUnderline(): Bool {
        return unsafe { nativeCharFormatFontUnderline(ptr) }
    }

    public func setFontPointSize(size: Float64) {
        unsafe { nativeCharFormatSetFontPointSize(ptr, size) }
    }

    public func fontPointSize(): Float64 {
        return unsafe { nativeCharFormatFontPointSize(ptr) }
    }
}

public class QTextBlockFormat <: QTextFormat {
    public init(ptr: Int64) {
        super(ptr)
    }

    public init() {
        super(unsafe { nativeBlockFormatCreate() })
    }

    public override func delete() {
        unsafe { nativeBlockFormatDelete(ptr) }
    }

    public func setAlignment(alignment: Int64) {
        unsafe { nativeBlockFormatSetAlignment(ptr, Int32(alignment)) }
    }

    public func alignment(): Int64 {
        return Int64(unsafe { nativeBlockFormatAlignment(ptr) })
    }

    public func setTopMargin(margin: Float64) {
        unsafe { nativeBlockFormatSetTopMargin(ptr, margin) }
    }

    public func topMargin(): Float64 {
        return unsafe { nativeBlockFormatTopMargin(ptr) }
    }
}

public class QTextDocumentFragment {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init(text: String) {
        this.ptr = unsafe {
            let t = LibC.mallocCString(text)
            let r = nativeTextDocumentFragmentCreate(t)
            LibC.free(t)
            r
        }
    }

    public func delete(): Unit {
        unsafe { nativeTextDocumentFragmentDelete(ptr) }
    }

    public func toPlainText(): String {
        return unsafe { nativeTextDocumentFragmentToPlainText(ptr).toString() }
    }

    public func toHtml(): String {
        return unsafe { nativeTextDocumentFragmentToHtml(ptr).toString() }
    }
}
