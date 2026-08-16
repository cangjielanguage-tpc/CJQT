package cjqt.widgets

import cjqt.gui.*

foreign func nativeFontComboBoxCreate(parentPtr: Int64): Int64
foreign func nativeFontComboBoxDelete(ptr: Int64): Unit
foreign func nativeFontComboBoxCurrentFontFamily(ptr: Int64): CString
foreign func nativeFontComboBoxSetCurrentFont(ptr: Int64, fontPtr: Int64): Unit
foreign func nativeFontComboBoxCurrentFont(ptr: Int64): Int64

public class QFontComboBox <: QWidget {
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeFontComboBoxCreate(parent.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeFontComboBoxDelete(ptr)
        }
    }

    public func currentFontFamily(): String {
        return unsafe { nativeFontComboBoxCurrentFontFamily(ptr).toString() }
    }

    public func setCurrentFont(font: QFont) {
        unsafe { nativeFontComboBoxSetCurrentFont(ptr, font.ptr) }
    }

    public func currentFont(): QFont {
        return QFont(unsafe { nativeFontComboBoxCurrentFont(ptr) })
    }
}
