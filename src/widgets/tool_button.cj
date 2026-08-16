package cjqt.widgets

import cjqt.gui.*

foreign func nativeToolButtonCreate(parentPtr: Int64): Int64
foreign func nativeToolButtonDelete(ptr: Int64): Unit
foreign func nativeToolButtonSetText(ptr: Int64, text: CString): Unit
foreign func nativeToolButtonText(ptr: Int64): CString
foreign func nativeToolButtonSetIcon(ptr: Int64, iconPtr: Int64): Unit
foreign func nativeToolButtonSetAutoRaise(ptr: Int64, b: Bool): Unit
foreign func nativeToolButtonAutoRaise(ptr: Int64): Bool

public class QToolButton <: QWidget {
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeToolButtonCreate(parent.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeToolButtonDelete(ptr)
        }
    }

    public func setText(text: String) {
        unsafe {
            let t = LibC.mallocCString(text)
            nativeToolButtonSetText(ptr, t)
            LibC.free(t)
        }
    }

    public func text(): String {
        return unsafe {
            nativeToolButtonText(ptr).toString()
        }
    }

    public func setIcon(icon: QIcon) {
        unsafe {
            nativeToolButtonSetIcon(ptr, icon.ptr)
        }
    }

    public func setAutoRaise(b: Bool) {
        unsafe {
            nativeToolButtonSetAutoRaise(ptr, b)
        }
    }

    public func autoRaise(): Bool {
        return unsafe {
            nativeToolButtonAutoRaise(ptr)
        }
    }
}
