/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package cjqt.gui

foreign func nativeFontCreate(fontPtr: Int64): Int64
foreign func nativeFontCreateFPWI(family:CString,pointSize:Int32,weight:Int32,italic:Bool): Int64
foreign func nativeFontSetPointSize(ptr: Int64, size: Int32): Unit
foreign func nativeFontSetPixelSize(ptr: Int64, size: Int32): Unit
foreign func nativeFontDelete(ptr: Int64): Unit

foreign func nativeFontSetFamily(ptr: Int64, family:CString): Unit
foreign func nativeFontSetWeight(ptr: Int64, weight:Int32): Unit
foreign func nativeFontSetItalic(ptr: Int64, enable:Bool): Unit


/**
 * The class is QFont
 * @author wathinst
 */
public class QFont {
    /** let member ptr type is Int64 */
    public let ptr: Int64

    /**
     * The Function is init constructor
     *
     */
    public init() {
        ptr = unsafe {
            nativeFontCreate(0)
        }
    }

    public init(family:String,pointSize: Int32,weight:Int32,italic:Bool) {        
        unsafe {
            let f=LibC.mallocCString(family);
            ptr = nativeFontCreateFPWI(f,pointSize,weight,italic)
            LibC.free(f)
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
     * The Function is init constructor
     *
     * @param font of QFont
     */
    public init(font: QFont) {
        ptr = unsafe {
            nativeFontCreate(font.ptr)
        }
    }

    /**
     * The Function is setPointSize
     *
     * @param size of Int64
     */
    public func setPointSize(size: Int32) {
        unsafe {
            nativeFontSetPointSize(ptr, size)
        }
    }

    /**
     * The Function is setPixelSize
     *
     * @param size of Int32
     */
    public func setPixelSize(size: Int32) {
        unsafe {
            nativeFontSetPixelSize(ptr, size)
        }
    }
    public func setFamily(family:String){
        unsafe {
            let f=LibC.mallocCString(family);
            nativeFontSetFamily(ptr, f)            
            LibC.free(f)
        }
    }
    public func setWeight(weight:Int32){
        unsafe {
            nativeFontSetWeight(ptr, weight)
        }
    }
    public func setItalic(enable:Bool){
        unsafe {
            nativeFontSetItalic(ptr, enable)
        }
    }

    /**
     * The Function is delete
     *
     */
    public func delete() {
        unsafe {
            nativeFontDelete(ptr)
        }
    }
}

public enum FontWeight {
    Thin | ExtraLight | Light | Normal | Medium | DemiBold | Bold | ExtraBold | Black

    /**
     * The Function is value
     *
     * @return Type of Int32
     */
    public func value(): Int32 {
        return match (this) {
            case Thin => 0
            case ExtraLight => 12
            case Light => 25
            case Normal => 50
            case Medium => 57
            case DemiBold => 63
            case Bold => 75
            case ExtraBold => 81
            case Black => 87
        }
    }
}
