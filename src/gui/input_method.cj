package cjqt.gui

foreign func nativeInputMethodIsVisible(): Bool
foreign func nativeInputMethodSetVisible(visible: Bool): Unit
foreign func nativeInputMethodCursorRectangleX(): Int32
foreign func nativeInputMethodCursorRectangleY(): Int32

public class QInputMethod {
    public static func isVisible(): Bool {
        return unsafe { nativeInputMethodIsVisible() }
    }

    public static func setVisible(visible: Bool) {
        unsafe { nativeInputMethodSetVisible(visible) }
    }

    public static func cursorRectangleX(): Int64 {
        return Int64(unsafe { nativeInputMethodCursorRectangleX() })
    }

    public static func cursorRectangleY(): Int64 {
        return Int64(unsafe { nativeInputMethodCursorRectangleY() })
    }
}
