/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 */
package cjqt.widgets

import cjqt.gui.*
import cjqt.core.*

foreign func nativeTextEditCreate(parentPtr: Int64): Int64
foreign func nativeTextEditAppend(ptr: Int64, text: CString): Unit
foreign func nativeTextEditSetFontFamily(ptr: Int64, fontFamily: CString): Unit
foreign func nativeTextEditSetPlainText(ptr: Int64, plainText: CString): Unit
foreign func nativeTextEditSetHtml(ptr: Int64, html: CString): Unit
foreign func nativeTextEditSetMarkdown(ptr: Int64, markdown: CString): Unit
foreign func nativeTextEditSetText(ptr: Int64, text: CString): Unit
foreign func nativeTextEditToPlainText(ptr: Int64): CString
foreign func nativeTextEditToHtml(ptr: Int64): CString
foreign func nativeTextEditToMarkdown(ptr: Int64): CString
foreign func nativeTextEditSetFontWeight(ptr: Int64, fontWeight: Int32): Unit
foreign func nativeTextEditSetFontUnderline(ptr: Int64, fontUnderline: Bool): Unit
foreign func nativeTextEditSetFontItalic(ptr: Int64, fontItalic: Bool): Unit
foreign func nativeTextEditSetCurrentFont(ptr: Int64, fontPtr: Int64): Unit
foreign func nativeTextEditSetTextColor(ptr: Int64, colorPtr: UInt32): Unit
foreign func nativeTextEditSetTextBackgroundColor(ptr: Int64, colorPtr: UInt32): Unit
foreign func nativeTextEditDelete(ptr: Int64): Unit

foreign func nativeTextEditCopy(ptr: Int64): Unit
foreign func nativeTextEditCut(ptr: Int64): Unit
foreign func nativeTextEditPaste(ptr: Int64): Unit
foreign func nativeTextEditUndo(ptr: Int64): Unit
foreign func nativeTextEditRedo(ptr: Int64): Unit


foreign func nativeTextEditIsReadOnly(ptr: Int64): Bool
foreign func nativeTextEditSetReadOnly(ptr: Int64, b: Bool): Unit

/**
 * The class is QTextEdit inherited from QWidget
 * @author wathinst
 */
public class QTextEdit <: QWidget {
    /**
     * The Function is init constructor
     *
     */
    public init() {
        super(
            unsafe {
                nativeTextEditCreate(0)
            }
        )
    }
    
    public init(ptr:Int64){
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
                nativeTextEditCreate(parent.ptr)
            }
        )
    }

    /**
     * The Function is append
     *
     * @param text of String
     */
    public func append(text: String) {
        unsafe {
            let t=LibC.mallocCString(text)
            nativeTextEditAppend(ptr,t )
            LibC.free(t)
        }
    }

    /**
     * The Function is setFontFamily
     *
     * @param fontFamily of String
     */
    public func setFontFamily(fontFamily: String) {
        unsafe {
            let f=LibC.mallocCString(fontFamily)
            nativeTextEditSetFontFamily(ptr, f)
            LibC.free(f)
        }
    }

    /**
     * The Function is setPlainText
     *
     * @param plainText of String
     */
    public func setPlainText(plainText: String) {
        unsafe {
            let p=LibC.mallocCString(plainText)
            nativeTextEditSetPlainText(ptr,p )
            LibC.free(p)
        }
    }

    /**
     * The Function is setHtml
     *
     * @param html of String
     */
    public func setHtml(html: String) {
        unsafe {
            let h=LibC.mallocCString(html)
            nativeTextEditSetHtml(ptr,h)
            LibC.free(h)
        }
    }

    /**
     * The Function is setMarkdown
     *
     * @param markdown of String
     */
    public func setMarkdown(markdown: String) {
        unsafe {
            let m=LibC.mallocCString(markdown)
            nativeTextEditSetMarkdown(ptr,m )
            LibC.free(m)
        }
    }

    /**
     * The Function is setText
     *
     * @param text of String
     */
    public func setText(text: String) {
        unsafe {
            let t=LibC.mallocCString(text)
            nativeTextEditSetText(ptr, t)
            LibC.free(t)
        }
    }

    /**
     * The Function is toPlainText
     *
     * @return Type of String
     */
    public func toPlainText(): String {
        let result = unsafe {
            nativeTextEditToPlainText(ptr)
        }
        return result.toString()
    }

    /**
     * The Function is toHtml
     *
     * @return Type of String
     */
    public func toHtml(): String {
        let result = unsafe {
            nativeTextEditToHtml(ptr)
        }
        return result.toString()
    }

    /**
     * The Function is toMarkdown
     *
     * @return Type of String
     */
    public func toMarkdown(): String {
        let result = unsafe {
            nativeTextEditToMarkdown(ptr)
        }
        return result.toString()
    }

    /**
     * The Function is setFontWeight
     *
     * @param fontWeight of FontWeight
     */
    public func setFontWeight(fontWeight: FontWeight) {
        unsafe {
            nativeTextEditSetFontWeight(ptr, fontWeight.value())
        }
    }

    /**
     * The Function is setFontUnderline
     *
     * @param fontUnderline of Bool
     */
    public func setFontUnderline(fontUnderline: Bool) {
        unsafe {
            nativeTextEditSetFontUnderline(ptr, fontUnderline)
        }
    }

    /**
     * The Function is setFontItalic
     *
     * @param fontItalic of Bool
     */
    public func setFontItalic(fontItalic: Bool) {
        unsafe {
            nativeTextEditSetFontItalic(ptr, fontItalic)
        }
    }

    /**
     * The Function is setCurrentFont
     *
     * @param font of QFont
     */
    public func setCurrentFont(font: QFont) {
        unsafe {
            nativeTextEditSetCurrentFont(ptr, font.ptr)
        }
    }

    /**
     * The Function is setTextColor
     *
     * @param color of QColor
     */
    public func setTextColor(color: QColor) {
        unsafe {
            nativeTextEditSetTextColor(ptr, color.ptr)
        }
    }

    /**
     * The Function is setTextBackgroundColor
     *
     * @param color of QColor
     */
    public func setTextBackgroundColor(color: QColor) {
        unsafe {
            nativeTextEditSetTextBackgroundColor(ptr, color.ptr)
        }
    }

    /**
     * The Function is delete
     *
     */
    public override func delete() {
        unsafe {
            nativeTextEditDelete(ptr)
        }
    }

    /**
     * The Function is copy
     *
     */
    public func copy() {
        unsafe {
            nativeTextEditCopy(ptr)
        }
    }

    /**
     * The Function is cut
     *
     */
    public func cut() {
        unsafe {
            nativeTextEditCut(ptr)
        }
    }

    /**
     * The Function is paste
     *
     */
    public func paste() {
        unsafe {
            nativeTextEditPaste(ptr)
        }
    }

    /**
     * The Function is undo
     *
     */
    public func undo() {
        unsafe {
            nativeTextEditUndo(ptr)
        }
    }

    /**
     * The Function is redo
     *
     */
    public func redo() {
        unsafe {
            nativeTextEditRedo(ptr)
        }
    }
    public func setReadOnly(b: Bool): Unit {
        unsafe {
            nativeTextEditSetReadOnly(this.ptr, b)
        }
    }

    /**
     * The Function is isReadOnly
     *
     * @return Type of Bool
     */
    public func isReadOnly(): Bool {
        return unsafe {
            nativeTextEditIsReadOnly(this.ptr)
        }
    }
}
