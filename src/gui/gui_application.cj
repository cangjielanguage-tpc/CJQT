/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package cjqt.gui

internal import std.collection.*

foreign func nativeGuiApplicationPrimaryScreen(): Int64

/**
 * The class is QApplication
 * @author libor
 */
public open class QGuiApplication{
    /**
     * The Function is create
     *
     */
    static public func primaryScreen():QScreen {
        // var screens=ArrayList<QScreen>()
        var ptr=unsafe {
            nativeGuiApplicationPrimaryScreen()
        }
        return QScreen(ptr);
    }
}
