package cjqt.widgets

import cjqt.gui.*

foreign func nativeColorDialogCreate(parentPtr: Int64): Int64
foreign func nativeColorDialogDelete(ptr: Int64): Unit
foreign func nativeColorDialogSetCurrentColor(ptr: Int64, rgba: UInt32): Unit
foreign func nativeColorDialogCurrentColor(ptr: Int64): UInt32
foreign func nativeColorDialogGetColor(rgba: UInt32): UInt32

public class QColorDialog <: QWidget {
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeColorDialogCreate(parent.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeColorDialogDelete(ptr)
        }
    }

    public func setCurrentColor(color: QColor) {
        unsafe {
            nativeColorDialogSetCurrentColor(ptr, color.rgba())
        }
    }

    public func currentColor(): QColor {
        let rgba = unsafe {
            nativeColorDialogCurrentColor(ptr)
        }
        return QColor(rgba)
    }

    public static func getColor(initial: QColor): QColor {
        let rgba = unsafe {
            nativeColorDialogGetColor(initial.rgba())
        }
        return QColor(rgba)
    }
}
