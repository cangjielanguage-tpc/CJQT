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
foreign func nativeLabelSetText(ptr: Int64, text:CString): Unit
foreign func nativeLabelDelete(ptr: Int64): Unit

/**
 * The class is QLabel inherited from QWidget
 * @author wathinst
 */
public open class QLabel <: QWidget{

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
            nativeLabelCreateText(LibC.mallocCString(text),0)
        })
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
            nativeLabelCreateText(LibC.mallocCString(text),parent.ptr)
        })
    }

    /**
     * The Function is setText
     *
     * @param text of String
     */
    public open func setText(text:String) {
        unsafe {
            nativeLabelSetText(ptr, LibC.mallocCString(text))
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
    public func setFontSize(size :Int64){
        let font = QFont()
        font.setPointSize(size)
        setFont(font)
    }
}