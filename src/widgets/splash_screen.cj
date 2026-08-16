package cjqt.widgets

import cjqt.gui.*

foreign func nativeSplashScreenCreate(pixmapPtr: Int64): Int64
foreign func nativeSplashScreenDelete(ptr: Int64): Unit
foreign func nativeSplashScreenShow(ptr: Int64): Unit
foreign func nativeSplashScreenShowMessage(ptr: Int64, message: CString): Unit
foreign func nativeSplashScreenClearMessage(ptr: Int64): Unit
foreign func nativeSplashScreenFinish(ptr: Int64, widgetPtr: Int64): Unit

public class QSplashScreen <: QWidget {
    public init(pixmap: QPixmap, parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeSplashScreenCreate(pixmap.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeSplashScreenDelete(ptr)
        }
    }

    public func showMessage(message: String) {
        unsafe {
            let m = LibC.mallocCString(message)
            nativeSplashScreenShowMessage(ptr, m)
            LibC.free(m)
        }
    }

    public func clearMessage() {
        unsafe {
            nativeSplashScreenClearMessage(ptr)
        }
    }

    public func finish(widget: QWidget) {
        unsafe {
            nativeSplashScreenFinish(ptr, widget.ptr)
        }
    }
}
