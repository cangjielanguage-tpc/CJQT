package qt.widgets

from std import ffi.c.CString

foreign func nativeLabelCreate(appPtr: Int64, parentPtr: Int64): Int64
foreign func nativeLabelSetText(ptr: Int64, text:CString): Unit
foreign func nativeLabelSetStyleSheet(ptr: Int64, style:CString): Unit
foreign func nativeLabelDelete(ptr: Int64): Unit

public class QLabel <: QWidget{

    public init() {
        super(unsafe {
            nativeLabelCreate(QApplication.ptr, 0)
        })
    }

    public init(text:String) {
        super(unsafe {
            nativeLabelCreate(QApplication.ptr, 0)
        })
        setText(text)
    }

    public init(parent: QWidget) {
        super(unsafe {
            nativeLabelCreate(QApplication.ptr, parent.ptr)
        })
    }

    public func setText(text:String) {
        unsafe {
            nativeLabelSetText(ptr, CString(text))
        }
    }

    public func setStyleSheet(style:String) {
        unsafe {
            nativeLabelSetStyleSheet(ptr, CString(style))
        }
    }

    public override func delete() {
        unsafe {
            nativeLabelDelete(ptr)
        }
    }

    public func setFontColor(color :QColor){
        let palette = QPalette()
        palette.setColor(ColorRole.WindowText, color)
        setPalette(palette)
    }

    public func setFontSize(size :Int64){
        let font = QFont()
        font.setPointSize(size)
        setFont(font)
    }
}