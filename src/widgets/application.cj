/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package cjqt.widgets

foreign func nativeApplicationInit(): Unit
foreign func nativeApplicationExec(): Bool
foreign func nativeApplicationIsCreate(): Bool
foreign func nativeApplicationQuit(): Unit
foreign func nativeApplicationDelete(): Unit
// foreign func nativeApplicationDesktop():Int64

/**
 * The class is QApplication
 * @author wathinst
 */
public class QApplication<:QGuiApplication {
    /**
     * The Function is create
     *
     */
    static public func create() {
        unsafe {
            nativeApplicationInit()
        }
    }

    /**
     * The Function is exec
     *
     * @return Type of Bool
     */
    static public func exec(): Bool {
        return unsafe {
            nativeApplicationExec()
        }
    }

    /**
     * The Function is isCreate
     *
     * @return Type of Bool
     */
    static public func isCreate(): Bool {
        return unsafe {
            nativeApplicationIsCreate()
        }
    }
    // static public func desktop(): QDesktopWidget {
    //     var ptr= unsafe {
    //         nativeApplicationDesktop()
    //     }
    //     return QDesktopWidget(ptr)
    // }


    /**
     * The Function is quit
     *
     */
    static public func quit() {
        unsafe {
            nativeApplicationQuit()
        }
    }

    /**
     * The Function is delete
     *
     */
    static public func delete() {
        unsafe {
            nativeApplicationDelete()
        }
    }
}
