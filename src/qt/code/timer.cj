/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package qt.code

// from std import ffi.c.CString
foreign func nativeTimerCreate(callback: CFunc<() -> Unit>, interval: Int32): Int64
foreign func nativeTimerStart(ptr: Int64): Unit
foreign func nativeTimerStop(ptr: Int64): Unit
foreign func nativeTimerDelete(ptr: Int64): Unit

/**
 * The class is QTimer
 * @author wathinst
 */
public class QTimer {
    /** let member ptr type is Int64 */
    public let ptr: Int64

    /* var member timerCallback type is () -> Unit */
    static var timerCallback: () -> Unit = {}

    /**
     * The Function is init constructor
     *
     * @param interval of Int32
     * @param callback of ()->Unit
     */
    public init(interval: Int32, callback: () -> Unit) {
        QTimer.timerCallback = callback
        let cb: CFunc<() -> Unit> = {
            QTimer.timerCallback()
        }
        ptr = unsafe {
            nativeTimerCreate(cb, interval)
        }
    }

    /**
     * The Function is start
     *
     */
    public func start() {
        unsafe {
            nativeTimerStart(ptr)
        }
    }

    /**
     * The Function is stop
     *
     */
    public func stop() {
        unsafe {
            nativeTimerStop(ptr)
        }
    }

    /**
     * The Function is delete
     *
     */
    public func delete() {
        unsafe {
            nativeUrlDelete(ptr)
        }
    }
}
