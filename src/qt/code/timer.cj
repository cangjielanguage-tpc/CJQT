package qt.code

// from std import ffi.c.CString

foreign func nativeTimerCreate(callback: CFunc<() -> Unit>, interval: Int32): Int64
foreign func nativeTimerStart(ptr: Int64): Unit
foreign func nativeTimerStop(ptr: Int64): Unit
foreign func nativeTimerDelete(ptr: Int64): Unit

public class QTimer {
    public let ptr: Int64

    static var timerCallback: () -> Unit = {}

    public init(interval: Int32, callback: () -> Unit) {
        QTimer.timerCallback = callback
        let cb: CFunc<() -> Unit> = {
            QTimer.timerCallback()
        }
        ptr = unsafe {
            nativeTimerCreate(cb, interval)
        }
    }

    public func start() {
        unsafe {
            nativeTimerStart(ptr)
        }
    }

    public func stop() {
        unsafe {
            nativeTimerStop(ptr)
        }
    }

    public func delete() {
        unsafe {
            nativeUrlDelete(ptr)
        }
    }
}