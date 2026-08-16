package cjqt.core

foreign func nativeEventLoopCreate(parentPtr: Int64): Int64
foreign func nativeEventLoopDelete(ptr: Int64): Unit
foreign func nativeEventLoopExec(ptr: Int64): Int32
foreign func nativeEventLoopExit(ptr: Int64, code: Int32): Unit
foreign func nativeEventLoopQuit(ptr: Int64): Unit
foreign func nativeEventLoopIsRunning(ptr: Int64): Bool
foreign func nativeEventLoopProcessEvents(ptr: Int64): Bool

public class QEventLoop {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe {
            nativeEventLoopCreate(0)
        }
    }

    public func delete(): Unit {
        unsafe {
            nativeEventLoopDelete(ptr)
        }
    }

    public func exec(): Int64 {
        return Int64(unsafe {
            nativeEventLoopExec(ptr)
        })
    }

    public func exit(code: Int64) {
        unsafe {
            nativeEventLoopExit(ptr, Int32(code))
        }
    }

    public func quit() {
        unsafe {
            nativeEventLoopQuit(ptr)
        }
    }

    public func isRunning(): Bool {
        return unsafe {
            nativeEventLoopIsRunning(ptr)
        }
    }

    public func processEvents(): Bool {
        return unsafe {
            nativeEventLoopProcessEvents(ptr)
        }
    }
}
