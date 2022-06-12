package qt.gui

from std import ffi.c.CString

foreign func nativeKeyEventGetKey(ptr: Int64):Int32
foreign func nativeKeyEventGetCount(ptr: Int64):Int32
foreign func nativeKeyEventGetText(ptr: Int64):CString
foreign func nativeKeyEventIsAutoRepeat(ptr: Int64):Int32

public class QKeyEvent{
    let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public func key():Int32 {
        return unsafe {
            nativeKeyEventGetKey(ptr)
        }
    }

    public func count():Int32 {
        return unsafe {
            nativeKeyEventGetCount(ptr)
        }
    }

    public func text():String {
        return unsafe {
            nativeKeyEventGetText(ptr).toString()
        }
    }

    public func isAutoRepeat():Bool {
        return unsafe {
            nativeKeyEventIsAutoRepeat(ptr) == 1
        }
    }
}