/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package qt.gui

foreign func nativeColorCreate(r: Int32, g: Int32, b: Int32, a: Int32): Int64
foreign func nativeColorDelete(ptr: Int64): Unit

/**
 * The class is QColor
 * @author wathinst
 */
public class QColor {
    /** let member ptr type is Int64 */
    public let ptr: Int64

    /** let member Black */
    public static let Black = QColor(0xFF000000)
    /** let member DarkGray */
    public static let DarkGray = QColor(0xFF444444)
    /** let member Gray */
    public static let Gray = QColor(0xFF888888)
    /** let member LightGray */
    public static let LightGray = QColor(0xFFCCCCCC)
    /** let member White */
    public static let White = QColor(0xFFFFFFFF)
    /** let member Red */
    public static let Red = QColor(0xFFFF0000)
    /** let member Green */
    public static let Green = QColor(0xFF00FF00)
    /** let member Blue */
    public static let Blue = QColor(0xFF0000FF)
    /** let member Yellow */
    public static let Yellow = QColor(0xFFFFFF00)
    /** let member Cyan */
    public static let Cyan = QColor(0xFF00FFFF)
    /** let member Magenta */
    public static let Magenta = QColor(0xFFFF00FF)
    /** let member Transparent */
    public static let Transparent = QColor(0x00000000)

    /**
     * The Function is init constructor
     *
     * @param argb of UInt32
     */
    public init(argb: UInt32) {
        let a = (argb >> 24) & 0xFF
        let r = (argb >> 16) & 0xFF
        let g = (argb >> 8) & 0xFF
        let b = argb & 0xFF
        ptr = unsafe {
            nativeColorCreate(Int32(r), Int32(g), Int32(b), Int32(a))
        }
    }

    /**
     * The Function is init constructor
     *
     * @param r of UInt8
     * @param g of UInt8
     * @param b of UInt8
     * @param a of UInt8
     */
    public init(r: UInt8, g: UInt8, b: UInt8, a!: UInt8=255) {
        ptr = unsafe {
            nativeColorCreate(Int32(r), Int32(g), Int32(b), Int32(a))
        }
    }

    /**
     * The Function is delete
     *
     */
    public func delete() {
        unsafe {
            nativeColorDelete(ptr)
        }
    }
}
