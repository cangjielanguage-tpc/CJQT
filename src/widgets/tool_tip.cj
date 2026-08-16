package cjqt.widgets

foreign func nativeToolTipShowText(x: Int32, y: Int32, text: CString): Unit
foreign func nativeToolTipHideText(): Unit
foreign func nativeToolTipIsVisible(): Bool
foreign func nativeToolTipText(): CString

public class QToolTip {
    public static func showText(x: Int64, y: Int64, text: String) {
        unsafe {
            let t = LibC.mallocCString(text)
            nativeToolTipShowText(Int32(x), Int32(y), t)
            LibC.free(t)
        }
    }

    public static func hideText() {
        unsafe { nativeToolTipHideText() }
    }

    public static func isVisible(): Bool {
        return unsafe { nativeToolTipIsVisible() }
    }

    public static func text(): String {
        return unsafe { nativeToolTipText().toString() }
    }
}
