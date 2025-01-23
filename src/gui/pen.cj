/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package cjqt.gui

import cjqt.core.PenStyle

foreign func nativePenCreate(): Int64
foreign func nativePenCreateArgb(argb: UInt32, thickness: Float64): Int64
foreign func nativePenCreateWithColor(argb: UInt32): Int64
foreign func nativePenCreateWithStyle(style: Int32): Int64
foreign func nativePenDelete(ptr: Int64): Unit
foreign func nativePenSetWidth(ptr: Int64, width: Int32): Unit
foreign func nativePenSetWidthF(ptr: Int64, width: Float64): Unit
foreign func nativePenSetColor(ptr: Int64, colorPtr: UInt32): Unit

foreign func nativePenColor(ptr:Int64):UInt32
/**
 * The class is QPen
 * @author wathinst
 */
public class QPen {
    /** let member ptr type is Int64 */
    public let ptr: Int64

    /**
     * The Function is init constructor
     *
     * @param color of QColor
     * @param thickness of Int32
     */
    public init(color: QColor, thickness: Float64) {
        ptr = unsafe {
            // if(color.ptr==0){
                nativePenCreateArgb(color.ptr, thickness)
            // }
            // else{
            //     nativePenCreate(color.ptr, thickness)
            // }
            
        }
    }

    /**
     * The Function is init constructor
     *
     * @param color of QColor
     */
    public init(color: QColor) {
        ptr = unsafe {
            nativePenCreateWithColor(color.ptr)
        }
    }
    
    public init() {
        ptr = unsafe {
            nativePenCreate()
        }
    }

    /**
     * The Function is init constructor
     *
     * @param style of enum PenStyle
     */
    public init(style: PenStyle) {
        ptr = unsafe {
            nativePenCreateWithStyle(style.value())
        }
    }

    /**
     * The Function is init constructor
     *
     * @param ptr of Int64
     */
    public init(ptr: Int64) {
        this.ptr = ptr
    }

    /**
     * The Function is delete
     *
     */
    public func delete() {
        unsafe {
            nativePenDelete(ptr)
        }
    }

    /**
     * The Function is setWidth
     *
     * @param width of Int64
     */
    public func setWidth(width: Int64): Unit {
        unsafe { nativePenSetWidth(this.ptr, Int32(width)) }
    }

    /**
     * The Function is setWidthF
     *
     * @param width of Float64
     */
    public func setWidthF(width: Float64): Unit {
        unsafe { nativePenSetWidthF(this.ptr, width) }
    }

    /**
     * The Function is setColor
     *
     * @param color of QColor
     */
    public func setColor(color: QColor): Unit {
        unsafe { nativePenSetColor(this.ptr, color.ptr) }
    }

    public func color():QColor{
        let color =unsafe{
            nativePenColor(ptr)
        }
        return QColor(color);
    }

    
}
