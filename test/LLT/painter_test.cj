// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
from cjqt import qt.gui.*
from cjqt import qt.core.*
from cjqt import qt.widgets.*

main() {
    QApplication.create()

    //newPainterWithWidgetTest()
    //setPenTest()
    //setBrushTest()
    //drawLineTest()
    //drawRectTest()
    QApplication.delete()
    return 0
}
/* func newPainterWithWidgetTest() {
    let widget = QWidget()
    let painter = QPainter(widget)
    painter.delete()
    widget.delete()
}

func setPenTest() {
    let painter = QPainter()
    let pen = QPen(QColor.Black, 2)
    painter.setPen(pen)
    pen.delete()
    painter.delete()
}

func setBrushTest() {
    let painter = QPainter()
    let brush = QBrush(QColor.Black)
    painter.setBrush(brush)
    brush.delete()
    painter.delete()
}

func drawLineTest() {
    let painter = QPainter()
    painter.drawLine(0, 0, 10, 10)
    painter.delete()
}

func drawRectTest() {
    let painter = QPainter()
    painter.drawRect(0, 0, 10, 10)
    painter.delete()
} */
