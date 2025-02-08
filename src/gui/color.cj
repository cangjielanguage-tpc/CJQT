/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package cjqt.gui

foreign func nativeColorCreate(r: Int32, g: Int32, b: Int32, a: Int32): Int64
// foreign func nativeColorDelete(ptr: Int64): Unit

/**
 * The class is QColor
 * @author wathinst
 */
public class QColor {
    /** let member ptr type is UInt32 */
    // public var ptr: UInt32=0xFF000000
    //将ptr属性设置为argb

    public var ptr:UInt32= 0xFF000000 

    public var red:UInt32=0X00
    public var green:UInt32=0X00
    public var blue:UInt32=0X00
    public var alpha:UInt32=0XFF

    /** let member Black */
    public static let Black = QColor(0xFF000000)

    /** let member DarkGray */
    public static let DarkGray = QColor( 0xFF444444)

    /** let member Gray */
    public static let Gray = QColor( 0xFF888888)

    /** let member LightGray */
    public static let LightGray = QColor(0xFFCCCCCC)

    /** let member White */
    public static let White = QColor( 0xFFFFFFFF)

    /** let member Red */
    public static let Red = QColor( 0xFFFF0000)

    /** let member Green */
    public static let Green = QColor( 0xFF00FF00)

    /** let member Blue */
    public static let Blue = QColor(0xFF0000FF)

    /** let member Yellow */
    public static let Yellow = QColor(0xFFFFFF00)

    /** let member Cyan */
    public static let Cyan = QColor(0xFF00FFFF)

    /** let member Magenta */
    public static let Magenta = QColor( 0xFFFF00FF)

    /** let member Transparent */
    public static let Transparent = QColor(0x00000000)

    /**
     * The Function is init constructor
     *
     * @param argb of UInt32
     */
    public init(argb: UInt32 ) {
        // if (ptr != 0) {
        //     this.ptr = ptr
        // } else {
            alpha = (argb >> 24) & 0xFF
            red = (argb >> 16) & 0xFF
            green = (argb >> 8) & 0xFF
            blue = argb & 0xFF
            this.ptr=argb
            // ptr=argb
            // this.ptr = unsafe {
            //     nativeColorCreate(Int32(r), Int32(g), Int32(b), Int32(a))
            // }
        }
   // }

    /**
     * The Function is init constructor
     *
     * @param r of UInt8
     * @param g of UInt8
     * @param b of UInt8
     * @param a of UInt8
     */
    public init(r: UInt8, g: UInt8, b: UInt8, a!: UInt8 = 255) {
        red=UInt32(r)
        green=UInt32(g)
        blue=UInt32(b)
        alpha=UInt32(a)
        ptr= UInt32(a) << 24|UInt32(r) << 16 |UInt32(g )<< 8|UInt32(b)
        // ptr = unsafe {
        //     nativeColorCreate(Int32(r), Int32(g), Int32(b), Int32(a))
        // }
    }

    public func setRed(r:UInt32){
        red=r
    }
    
    public func setBlue(b:UInt32){
        blue=b
    }

    public func setGreen(g:UInt32){
        green=g
    }

   public func rgba():UInt32 {
    return ptr;
   }

    // public init(ptr: Int64) {
    //     this.ptr = ptr
    // }

    /**
     * The Function is delete
     *
     */
    // public func delete() {
    //     unsafe {
    //         nativeColorDelete(ptr)
    //     }
    // }
}
