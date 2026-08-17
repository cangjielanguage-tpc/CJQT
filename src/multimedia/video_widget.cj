package cjqt.multimedia

import cjqt.widgets.*

foreign func nativeVideoWidgetCreate(parentPtr: Int64): Int64
foreign func nativeVideoWidgetDelete(ptr: Int64): Unit
foreign func nativeVideoWidgetSetFullScreen(ptr: Int64, b: Bool): Unit
foreign func nativeVideoWidgetIsFullScreen(ptr: Int64): Bool

public class QVideoWidget <: QWidget {
    public init(parent!: QWidget = QWidget(0)) {
        super(
            unsafe {
                nativeVideoWidgetCreate(parent.ptr)
            }
        )
    }

    public init(ptr: Int64) {
        super(ptr)
    }

    public override func delete() {
        unsafe {
            nativeVideoWidgetDelete(ptr)
        }
    }

    public func setFullScreen(fullScreen: Bool) {
        unsafe { nativeVideoWidgetSetFullScreen(ptr, fullScreen) }
    }

    public func isFullScreen(): Bool {
        return unsafe { nativeVideoWidgetIsFullScreen(ptr) }
    }
}
