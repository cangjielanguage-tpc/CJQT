/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package cjqt.widgets

import cjqt.core.*

// foreign C Functions
foreign func nativeFrameCreate(parentPtr: Int64, f: UInt32): Int64
foreign func nativeFrameDelete(ptr: Int64): Unit
foreign func nativeFrameFrameRect(ptr: Int64): QRect
foreign func nativeFrameFrameShadow(ptr: Int64): Int16
foreign func nativeFrameFrameShape(ptr: Int64): Int16
foreign func nativeFrameFrameStyle(ptr: Int64): Int32
foreign func nativeFrameFrameWidth(ptr: Int64): Int32
foreign func nativeFrameLineWidth(ptr: Int64): Int32
foreign func nativeFrameMidLineWidth(ptr: Int64): Int32
foreign func nativeFrameSetFrameRect(ptr: Int64, x: Int32,y:Int32,width:Int32,height:Int32): Unit
foreign func nativeFrameSetFrameShadow(ptr: Int64, shadow: Int16): Unit
foreign func nativeFrameSetFrameShape(ptr: Int64, shape: Int16): Unit
foreign func nativeFrameSetFrameStyle(ptr: Int64, style: Int32): Unit
foreign func nativeFrameSetLineWidth(ptr: Int64, width: Int32): Unit
foreign func nativeFrameSetMidLineWidth(ptr: Int64, width: Int32): Unit
foreign func nativeFrameSizeHint(ptr: Int64): QSize

/**
 * The enum is ActionPosition
 * @author helin
 */
public enum QFrameShadow {
    Plain | Raised | Sunken

    /**
     * The Function is value
     *
     * @return Type  is  Int16
     */
    public func value(): Int16 {
        match (this) {
            case Plain => 0x0010
            case Raised => 0x0020
            case Sunken => 0x0030
        }
    }

    /**
     * The Function is convert
     *
     * @param shadow of Int16
     *
     * @return Type  is  QFrameShadow
     */
    public static func convert(shadow: Int16): QFrameShadow {
        match (shadow) {
            case 0x0010 => Plain
            case 0x0020 => Raised
            case 0x0030 => Sunken
            case _ => Plain
        }
    }
}

/**
 * The enum is ActionPosition
 * @author helin
 */
public enum QFrameShape {
    NoFrame | Box | Panel | StyledPanel | HLine | VLine | WInPanel

    /**
     * The Function is value
     *
     * @return Type  is  Int16
     */
    public func value(): Int16 {
        match (this) {
            case NoFrame => 0x0000
            case Box => 0x0001
            case Panel => 0x0002
            case StyledPanel => 0x0006
            case HLine => 0x0004
            case VLine => 0x0005
            case WInPanel => 0x0003
        }
    }

    /**
     * The Function is convert
     *
     * @param shape of Int16
     *
     * @return Type  is  QFrameShape
     */
    public static func convert(shape: Int16): QFrameShape {
        match (shape) {
            case 0x0000 => NoFrame
            case 0x0001 => Box
            case 0x0002 => Panel
            case 0x0006 => StyledPanel
            case 0x0004 => HLine
            case 0x0005=> VLine
            case 0x0003 => WInPanel
            case _ => NoFrame
        }
    }
}

/**
 * The class is QFrame inherited by QWidget
 * @author helin
 */
public open class QFrame <: QWidget {
    /**
     * The Function is init constructor
     *
     */
    public init() {
        super(
            unsafe {
                nativeFrameCreate(0, WindowType.Widget.value())
            }
        )
    }

    /**
     * The Function is init constructor
     *
     * @param ptr of Int64
     */
    public init(ptr: Int64) {
        super(ptr)
    }

    /**
     * The Function is init constructor
     *
     * @param parent of QWidget
     */
    public init(parent: QWidget) {
        super(
            unsafe {
                nativeFrameCreate(parent.ptr, WindowType.Widget.value())
            }
        )
    }

    /**
     * The Function is init constructor
     *
     * @param parent of QWidget
     * @param f of Enum WindowType
     */
    public init(parent: QWidget, f: WindowType) {
        super(
            unsafe {
                nativeFrameCreate(parent.ptr, f.value())
            }
        )
    }

    /**
     * The Function is delete
     *
     */
    public open override func delete(): Unit {
        unsafe {
            nativeFrameDelete(this.ptr)
        }
    }

    /**
     * The Function is frameRect
     *
     * @return Type  of QRect
     */
    public func frameRect(): QRect {
        let rect= unsafe {
            nativeFrameFrameRect(this.ptr)
        }
        return rect
    }

    /**
     * The Function is frameShadow
     *
     * @return Type  of Enum QFrameShadow
     */
    public func frameShadow(): QFrameShadow {
        let shadow = unsafe {
            nativeFrameFrameShadow(this.ptr)
        }
        return QFrameShadow.convert(shadow)
    }

    /**
     * The Function is frameShape
     *
     * @return Type  of Enum QFrameShape
     */
    public func frameShape(): QFrameShape {
        let shape = unsafe {
            nativeFrameFrameShape(this.ptr)
        }
        return QFrameShape.convert(shape)
    }

    /**
     * The Function is frameStyle
     *
     * @return Type  of Int64
     */
    public func frameStyle(): Int64 {
        let style = unsafe {
            nativeFrameFrameStyle(this.ptr)
        }
        return Int64(style)
    }

    /**
     * The Function is frameWidth
     *
     * @return Type  of Int64
     */
    public func frameWidth(): Int64 {
        let width = unsafe {
            nativeFrameFrameWidth(this.ptr)
        }
        return Int64(width)
    }

    /**
     * The Function is lineWidth
     *
     * @return Type  of Int64
     */
    public func lineWidth(): Int64 {
        let width = unsafe {
            nativeFrameLineWidth(this.ptr)
        }
        return Int64(width)
    }

    /**
     * The Function is midLineWidth
     *
     * @return Type  of Int64
     */
    public func midLineWidth(): Int64 {
        let width = unsafe {
            nativeFrameMidLineWidth(this.ptr)
        }
        return Int64(width)
    }

    /**
     * The Function is setFrameRect
     *
     * @param rect of QRect
     */
    public func setFrameRect(rect: QRect): Unit {
        return unsafe { nativeFrameSetFrameRect(this.ptr, rect.x,rect.y,rect.width,rect.height) }
    }

    /**
     * The Function is setFrameShadow
     *
     * @param shadow of Enum QFrameShadow
     */
    public func setFrameShadow(shadow: QFrameShadow): Unit {
        return unsafe { nativeFrameSetFrameShadow(this.ptr, shadow.value()) }
    }

    /**
     * The Function is setFrameShape
     *
     * @param shape of Enum QFrameShape
     */
    public func setFrameShape(shape: QFrameShape): Unit {
        return unsafe { nativeFrameSetFrameShape(this.ptr, shape.value()) }
    }

    /**
     * The Function is setFrameStyle
     *
     * @param style of Int64
     */
    public func setFrameStyle(style: Int64): Unit {
        return unsafe { nativeFrameSetFrameStyle(this.ptr, Int32(style)) }
    }

    /**
     * The Function is setLineWidth
     *
     * @param width of Int64
     */
    public func setLineWidth(width: Int64): Unit {
        return unsafe { nativeFrameSetLineWidth(this.ptr, Int32(width)) }
    }

    /**
     * The Function is setMidLineWidth
     *
     * @param width of Int64
     */
    public func setMidLineWidth(width: Int64): Unit {
        return unsafe { nativeFrameSetMidLineWidth(this.ptr, Int32(width)) }
    }

    /**
     * The Function is sizeHint
     *
     * @return Type of QSize
     */
    public open func sizeHint(): QSize {
        let size = unsafe { nativeFrameSizeHint(this.ptr) }
        return size
    }
}
