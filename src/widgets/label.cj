/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file QLabel
 * 
 */
package cjqt.widgets

import cjqt.gui.*
import cjqt.core.*

foreign func nativeLabelCreate(parentPtr: Int64): Int64
foreign func nativeLabelCreateText(text:CString,parentPtr: Int64): Int64
foreign func nativeLabelSetPixmapScaled(ptr: Int64, path: CString, w: Int32, h: Int32): Unit
foreign func nativeLabelSetText(ptr: Int64, text:CString): Unit
foreign func nativeLabelDelete(ptr: Int64): Unit

/**
 * The class is QLabel inherited from QWidget
 * @author wathinst
 */
public class QLabel <: QWidget{

    /**
     * The Function is init constructor
     *
     */
    public init() {
        super(unsafe {
            nativeLabelCreate( 0)
        })
    }

    /**
     * The Function is init constructor
     *
     * @param text of String
     */
    public init(text:String) {
        super(unsafe {
            nativeLabelCreate(0)
        })
        setText(text)
    }

    /**
     * The Function is init constructor
     *
     * @param parent of QWidget
     */
    public init(parent: QWidget) {
        super(unsafe {
            nativeLabelCreate(parent.ptr)
        })
    }


    /**
     * The Function is init constructor
     *
     * @param parent of QWidget
     */
    public init(ptr: Int64) {
        super(unsafe {
            nativeLabelCreate(ptr)
        })
    }

    /**
     * The Function is init constructor
     *
     * @param parent of QWidget
     */
    public init(text:String,parent: QWidget) {
        super(unsafe {
            nativeLabelCreate(parent.ptr)
        })        
        setText(text)
    }

    /**
     * The Function is setText
     *
     * @param text of String
     */
    public func setText(text:String) {
        unsafe {
            let t=LibC.mallocCString(text)
            nativeLabelSetText(ptr, t)
            LibC.free(t)
        }
    }

    /**
     * The Function is setPixmapScaled
     *
     * 加载图片并缩放到指定尺寸设置到 QLabel（铺满显示）
     *
     * @param path of String
     * @param w of Int32
     * @param h of Int32
     */
    public func setPixmapScaled(path: String, w: Int32, h: Int32) {
        unsafe {
            let p = LibC.mallocCString(path)
            nativeLabelSetPixmapScaled(ptr, p, w, h)
            LibC.free(p)
        }
    }

    /**
     * The Function is delete
     *
     */
    public override func delete() {
        unsafe {
            nativeLabelDelete(ptr)
        }
    }

    /**
     * The Function is setFontColor
     *
     * @param color of QColor
     */
    public func setFontColor(color :QColor){
        let palette = QPalette()
        palette.setColor(ColorRole.WindowText, color)
        setPalette(palette)
    }

    /**
     * The Function is setFontSize
     *
     * @param size of Int64
     */
    public func setFontSize(size :Int32){
        let font = QFont()
        font.setPixelSize(size)
        setFont(font)
    }
}