package cjqt.gui

foreign func nativeClipboardText(): CString
foreign func nativeClipboardSetText(text: CString): Unit
foreign func nativeClipboardClear(): Unit

public class QClipboard {
    public static func text(): String {
        return unsafe {
            nativeClipboardText().toString()
        }
    }

    public static func setText(text: String): Unit {
        unsafe {
            let t = LibC.mallocCString(text)
            nativeClipboardSetText(t)
            LibC.free(t)
        }
    }

    public static func clear(): Unit {
        unsafe {
            nativeClipboardClear()
        }
    }
}
