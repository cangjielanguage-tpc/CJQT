// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
import cjqt.gui.*
import cjqt.core.*
import cjqt.widgets.*

main() {
    QApplication.create()
    var widget = QWidget()
    initFrameTest(widget)
    initFrameOtherTest(widget)
    initEnum()
    widget.delete()
    QApplication.delete()
    return 0
}

func initFrameTest(widget: QWidget): Unit {
    var frame1 = QFrame(widget)
    frame1.setLineWidth(3)
    frame1.setMidLineWidth(3)
    frame1.setFrameShape(QFrameShape.Box)
    frame1.setFrameShadow(QFrameShadow.Raised)
    frame1.setStyleSheel("background-color:cyan")
    frame1.setFrameRect(QRect(0, 0, 40, 40))
    frame1.setFrameStyle(Int64(QFrameShadow.Raised.value()))
    frame1.frameShadow()
    frame1.frameShape()
    frame1.frameRect()
    frame1.frameStyle()
    frame1.frameWidth()
    frame1.lineWidth()
    frame1.midLineWidth()
    frame1.sizeHint()
    frame1.delete()
}
func initFrameOtherTest(widget: QWidget): Unit {
    var frame2 = QFrame()
    var frame3 = QFrame(0)
    var frame4 = QFrame(widget, WindowType.Widget)
    frame2.delete()

    frame3.delete()
    frame4.delete()
}
func initEnum(): Unit {
    var frame = QFrame()
    frame.setFrameShape(QFrameShape.Panel)
    frame.setFrameShape(QFrameShape.StyledPanel)
    frame.setFrameShape(QFrameShape.HLine)
    frame.setFrameShape(QFrameShape.VLine)
    frame.setFrameShape(QFrameShape.WInPanel)
    QFrameShape.convert(Int16(1))
    QFrameShape.convert(Int16(2))
    QFrameShape.convert(Int16(3))
    QFrameShape.convert(Int16(4))
    QFrameShape.convert(Int16(5))
    QFrameShape.convert(Int16(6))
    QFrameShape.convert(Int16(7))
    frame.setFrameShadow(QFrameShadow.Sunken)
    QFrameShadow.convert(Int16(1))
    QFrameShadow.convert(Int16(2))
    QFrameShadow.convert(Int16(3))
    QFrameShadow.convert(Int16(4))
    frame.delete()
}
