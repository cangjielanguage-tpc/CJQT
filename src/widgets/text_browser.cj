package cjqt.widgets

foreign func nativeTextBrowserCreate(parentPtr: Int64): Int64
foreign func nativeTextBrowserDelete(ptr: Int64): Unit
foreign func nativeTextBrowserSetText(ptr: Int64, text: CString): Unit
foreign func nativeTextBrowserToPlainText(ptr: Int64): CString
foreign func nativeTextBrowserSetHtml(ptr: Int64, html: CString): Unit
foreign func nativeTextBrowserToHtml(ptr: Int64): CString

public class QTextBrowser <: QWidget {
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeTextBrowserCreate(parent.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeTextBrowserDelete(ptr)
        }
    }

    public func setText(text: String) {
        unsafe {
            let t = LibC.mallocCString(text)
            nativeTextBrowserSetText(ptr, t)
            LibC.free(t)
        }
    }

    public func toPlainText(): String {
        return unsafe { nativeTextBrowserToPlainText(ptr).toString() }
    }

    public func setHtml(html: String) {
        unsafe {
            let h = LibC.mallocCString(html)
            nativeTextBrowserSetHtml(ptr, h)
            LibC.free(h)
        }
    }

    public func toHtml(): String {
        return unsafe { nativeTextBrowserToHtml(ptr).toString() }
    }
}
