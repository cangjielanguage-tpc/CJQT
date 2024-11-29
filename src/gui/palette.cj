/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package cjqt.gui

foreign func nativePaletteCreate(): Int64
foreign func nativePaletteCreateForColor(colorPtr: UInt32): Int64
foreign func nativePaletteCreateForPalette(palettePtr: Int64): Int64
foreign func nativePaletteSetColor(ptr: Int64, colorRole: Int32, argb: UInt32): Unit
foreign func nativePaletteDelete(ptr: Int64): Unit

/**
 * The class is QPalette
 * @author wathinst
 */
public class QPalette {
    /** let member ptr type is Int64 */
    public let ptr: Int64

    /**
     * The Function is init constructor
     *
     * @param color of QColor
     */
    public init(color: QColor) {
        ptr = unsafe {
            nativePaletteCreateForColor(color.ptr)
        }
    }

    /**
     * The Function is init constructor
     *
     * @param palette of QPalette
     */
    public init(palette: QPalette) {
        ptr = unsafe {
            nativePaletteCreateForPalette(palette.ptr)
        }
    }

    /**
     * The Function is init constructor
     *
     */
    public init() {
        ptr = unsafe {
            nativePaletteCreate()
        }
    }

    /**
     * The Function is setColor
     *
     * @param colorRole of ColorRole
     * @param color of QColor
     */
    public func setColor(colorRole: ColorRole, color: QColor) {
        unsafe {
            nativePaletteSetColor(ptr, colorRole.value(), color.ptr)
        }
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
}

public enum ColorRole {
    WindowText |
    Button |
    Light |
    Midlight |
    Dark |
    Mid |
    Text |
    BrightText |
    ButtonText |
    Base |
    Window |
    Shadow |
    Highlight |
    HighlightedText |
    Link |
    LinkVisited |
    AlternateBase |
    NoRole |
    ToolTipBase |
    ToolTipText |
    PlaceholderText |
    NColorRoles

    /**
     * The Function is value
     *
     * @return Type of Int32
     */
    public func value(): Int32 {
        return match (this) {
            case WindowText => 0
            case Button => 1
            case Light => 2
            case Midlight => 3
            case Dark => 4
            case _ => 0
        }
    }
}
