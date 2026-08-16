/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package cjqt.core

import cjqt.tools.*

foreign func nativeTimerCreate(callback: CFunc<(Int64) -> Unit>, interval: Int32): Int64
foreign func nativeTimerStart(ptr: Int64): Unit
foreign func nativeTimerStop(ptr: Int64): Unit
foreign func nativeTimerDelete(ptr: Int64): Unit

@C
func timerCallback(ptr: Int64): Unit {
    try {
        QCallbackMap.timer[ptr]()
    } catch (e: Exception) {
        println(e)
    }
}

/**
 * The class is QTimer
 * @author wathinst
 */
public class QTimer {
    /** let member ptr type is Int64 */
    public let ptr: Int64

    /* var member timerCallback type is () -> Unit */
    //static var timerCallback: () -> Unit = { => }

    public init() {
        ptr = 0
    }

    /**
     * The Function is init constructor
     *
     * @param interval of Int32
     * @param callback of ()->Unit
     */
    public init(interval: Int32, callback: () -> Unit) {
        ptr = unsafe {
            nativeTimerCreate(timerCallback, interval)
        }
        QCallbackMap.timer.add(ptr, callback)
    }

    /**
     * The Function is start
     *
     */
    public func start() {
        unsafe {
            if (ptr != 0) {
                nativeTimerStart(ptr)
            }
        }
    }

    /**
     * The Function is stop
     *
     */
    public func stop() {
        unsafe {
            if (ptr != 0) {
                nativeTimerStop(ptr)
            }
        }
    }

    /**
     * The Function is delete
     *
     */
    public func delete() {
        unsafe {
            if (ptr != 0) {
                nativeUrlDelete(ptr)
            }
        }
    }
}
