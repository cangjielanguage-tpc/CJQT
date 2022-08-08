/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file QLabel
 * 
 */
package qt.widgets

/*
 * The Function is nativeLabelCreate
 *
 * @param parentPtr of Int64
 *
 * @return Type of Int64
 */
foreign func nativeLabelCreate(parentPtr: Int64): Int64
/*
 * The Function is nativeLabelSetText
 *
 * @param ptr of Int64
 * @param text of CString
 *
 * @return Type of Unit
 */
foreign func nativeLabelSetText(ptr: Int64, text:CString): Unit
/*
 * The Function is nativeLabelSetStyleSheet
 *
 * @param ptr of Int64
 * @param style of CString
 *
 * @return Type of Unit
 */
foreign func nativeLabelSetStyleSheet(ptr: Int64, style:CString): Unit
/*
 * The Function is nativeLabelDelete
 *
 * @param ptr of Int64
 *
 * @return Type of Unit
 */
foreign func nativeLabelDelete(ptr: Int64): Unit

/**
 * The class is QLabel inherited from QWidget
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
     * The Function is setText
     *
     * @param text of String
     */
    public func setText(text:String) {
        unsafe {
            nativeLabelSetText(ptr, CString(text))
        }
    }

    /**
     * The Function is setStyleSheet
     *
     * @param style of String
     */
    public func setStyleSheet(style:String) {
        unsafe {
            nativeLabelSetStyleSheet(ptr, CString(style))
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