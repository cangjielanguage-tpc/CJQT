package qt.widgets

// from std import ffi.c.CString

foreign func nativeTextEditCreate(parentPtr: Int64): Int64
foreign func nativeTextEditAppend(ptr: Int64, text: CString): Unit
foreign func nativeTextEditSetFontFamily(ptr: Int64, fontFamily: CString): Unit
foreign func nativeTextEditSetPlainText(ptr: Int64, plainText: CString): Unit
foreign func nativeTextEditSetHtml(ptr: Int64, html: CString): Unit
foreign func nativeTextEditSetMarkdown(ptr: Int64, markdown: CString): Unit
foreign func nativeTextEditSetText(ptr: Int64, text: CString): Unit
foreign func nativeTextEditToPlainText(ptr: Int64): CString
foreign func nativeTextEditToHtml(ptr: Int64): CString
foreign func nativeTextEditToMarkdown(ptr: Int64): CString
foreign func nativeTextEditSetFontWeight(ptr: Int64, fontWeight: Int32): Unit
foreign func nativeTextEditSetFontUnderline(ptr: Int64, fontUnderline: Bool): Unit
foreign func nativeTextEditSetFontItalic(ptr: Int64, fontItalic: Bool): Unit
foreign func nativeTextEditSetCurrentFont(ptr: Int64, fontPtr: Int64): Unit
foreign func nativeTextEditSetTextColor(ptr: Int64, colorPtr: Int64): Unit
foreign func nativeTextEditSetTextBackgroundColor(ptr: Int64, colorPtr: Int64): Unit
foreign func nativeTextEditDelete(ptr: Int64): Unit

foreign func nativeTextEditCopy(ptr: Int64): Unit
foreign func nativeTextEditCut(ptr: Int64): Unit
foreign func nativeTextEditPaste(ptr: Int64): Unit
foreign func nativeTextEditUndo(ptr: Int64): Unit
foreign func nativeTextEditRedo(ptr: Int64): Unit

public class QTextEdit <: QWidget {
    public init() {
        super(
            unsafe {
                nativeTextEditCreate(0)
            }
        )
    }

    public init(parent: QWidget) {
        super(
            unsafe {
                nativeTextEditCreate(parent.ptr)
            }
        )
    }

    public func append(text: String) {
        unsafe {
            nativeTextEditAppend(ptr, CString(text))
        }
    }

    public func setFontFamily(fontFamily: String) {
        unsafe {
            nativeTextEditSetFontFamily(ptr, CString(fontFamily))
        }
    }

    public func setPlainText(plainText: String) {
        unsafe {
            nativeTextEditSetPlainText(ptr, CString(plainText))
        }
    }

    public func setHtml(html: String) {
        unsafe {
            nativeTextEditSetHtml(ptr, CString(html))
        }
    }

    public func setMarkdown(markdown: String) {
        unsafe {
            nativeTextEditSetMarkdown(ptr, CString(markdown))
        }
    }

    public func setText(text: String) {
        unsafe {
            nativeTextEditSetText(ptr, CString(text))
        }
    }

    public func toPlainText(): String {
        let result = unsafe {
            nativeTextEditToPlainText(ptr)
        }
        return result.toString()
    }

    public func toHtml(): String {
        let result = unsafe {
            nativeTextEditToHtml(ptr)
        }
        return result.toString()
    }

    public func toMarkdown(): String {
        let result = unsafe {
            nativeTextEditToMarkdown(ptr)
        }
        return result.toString()
    }

    public func setFontWeight(fontWeight: FontWeight) {
        unsafe {
            nativeTextEditSetFontWeight(ptr, fontWeight.value())
        }
    }

    public func setFontUnderline(fontUnderline: Bool) {
        unsafe {
            nativeTextEditSetFontUnderline(ptr, fontUnderline)
        }
    }

    public func setFontItalic(fontItalic: Bool) {
        unsafe {
            nativeTextEditSetFontItalic(ptr, fontItalic)
        }
    }

    public func setCurrentFont(font: QFont) {
        unsafe {
            nativeTextEditSetCurrentFont(ptr, font.ptr)
        }
    }

    public func setTextColor(color: QColor) {
        unsafe {
            nativeTextEditSetTextColor(ptr, color.ptr)
        }
    }

    public func setTextBackgroundColor(color: QColor) {
        unsafe {
            nativeTextEditSetTextBackgroundColor(ptr, color.ptr)
        }
    }

    public override func delete() {
        unsafe {
            nativeTextEditDelete(ptr)
        }
    }

    public func copy() {
        unsafe {
            nativeTextEditCopy(ptr)
        }
    }

    public func cut() {
        unsafe {
            nativeTextEditCut(ptr)
        }
    }

    public func paste() {
        unsafe {
            nativeTextEditPaste(ptr)
        }
    }

    public func undo() {
        unsafe {
            nativeTextEditUndo(ptr)
        }
    }

    public func redo() {
        unsafe {
            nativeTextEditRedo(ptr)
        }
    }
}
