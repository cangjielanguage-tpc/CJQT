package cjqt.widgets

foreign func nativePlainTextEditCreate(parentPtr: Int64): Int64
foreign func nativePlainTextEditDelete(ptr: Int64): Unit
foreign func nativePlainTextEditSetPlainText(ptr: Int64, text: CString): Unit
foreign func nativePlainTextEditToPlainText(ptr: Int64): CString
foreign func nativePlainTextEditAppendPlainText(ptr: Int64, text: CString): Unit
foreign func nativePlainTextEditClear(ptr: Int64): Unit
foreign func nativePlainTextEditSetReadOnly(ptr: Int64, b: Bool): Unit
foreign func nativePlainTextEditIsReadOnly(ptr: Int64): Bool
foreign func nativePlainTextEditSetPlaceholderText(ptr: Int64, text: CString): Unit
foreign func nativePlainTextEditPlaceholderText(ptr: Int64): CString

public class QPlainTextEdit <: QWidget {
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativePlainTextEditCreate(parent.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativePlainTextEditDelete(ptr)
        }
    }

    public func setPlainText(text: String) {
        unsafe {
            let t = LibC.mallocCString(text)
            nativePlainTextEditSetPlainText(ptr, t)
            LibC.free(t)
        }
    }

    public func toPlainText(): String {
        return unsafe {
            nativePlainTextEditToPlainText(ptr).toString()
        }
    }

    public func appendPlainText(text: String) {
        unsafe {
            let t = LibC.mallocCString(text)
            nativePlainTextEditAppendPlainText(ptr, t)
            LibC.free(t)
        }
    }

    public func clear() {
        unsafe {
            nativePlainTextEditClear(ptr)
        }
    }

    public func setReadOnly(b: Bool) {
        unsafe {
            nativePlainTextEditSetReadOnly(ptr, b)
        }
    }

    public func isReadOnly(): Bool {
        return unsafe {
            nativePlainTextEditIsReadOnly(ptr)
        }
    }

    public func setPlaceholderText(text: String) {
        unsafe {
            let t = LibC.mallocCString(text)
            nativePlainTextEditSetPlaceholderText(ptr, t)
            LibC.free(t)
        }
    }

    public func placeholderText(): String {
        return unsafe {
            nativePlainTextEditPlaceholderText(ptr).toString()
        }
    }
}
