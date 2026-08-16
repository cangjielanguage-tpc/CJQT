package cjqt.core

foreign func nativeThreadCreate(): Int64
foreign func nativeThreadDelete(ptr: Int64): Unit
foreign func nativeThreadStart(ptr: Int64): Unit
foreign func nativeThreadWait(ptr: Int64, msecs: Int32): Bool
foreign func nativeThreadIsRunning(ptr: Int64): Bool
foreign func nativeThreadIsFinished(ptr: Int64): Bool
foreign func nativeThreadQuit(ptr: Int64): Unit
foreign func nativeThreadSleep(secs: Int32): Unit
foreign func nativeThreadMsleep(msecs: Int32): Unit
foreign func nativeThreadCurrentThreadId(): Int64
foreign func nativeThreadIdealThreadCount(): Int32

public class QThread {
    public let ptr: Int64

    public init(ptr: Int64) {
        this.ptr = ptr
    }

    public init() {
        this.ptr = unsafe {
            nativeThreadCreate()
        }
    }

    public func delete(): Unit {
        unsafe {
            nativeThreadDelete(ptr)
        }
    }

    public func start(): Unit {
        unsafe {
            nativeThreadStart(ptr)
        }
    }

    public func wait(msecs!: Int64 = -1): Bool {
        return unsafe {
            nativeThreadWait(ptr, Int32(msecs))
        }
    }

    public func isRunning(): Bool {
        return unsafe {
            nativeThreadIsRunning(ptr)
        }
    }

    public func isFinished(): Bool {
        return unsafe {
            nativeThreadIsFinished(ptr)
        }
    }

    public func quit(): Unit {
        unsafe {
            nativeThreadQuit(ptr)
        }
    }

    public static func sleep(secs: Int64): Unit {
        unsafe {
            nativeThreadSleep(Int32(secs))
        }
    }

    public static func msleep(msecs: Int64): Unit {
        unsafe {
            nativeThreadMsleep(Int32(msecs))
        }
    }

    public static func currentThreadId(): Int64 {
        return unsafe {
            nativeThreadCurrentThreadId()
        }
    }

    public static func idealThreadCount(): Int64 {
        return Int64(unsafe {
            nativeThreadIdealThreadCount()
        })
    }
}
