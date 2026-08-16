// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
package cjqt
import cjqt.gui.*
import cjqt.core.*
import cjqt.widgets.*

public class PainterWidget <: QWidget {

    public init() {

        setPaintEvent() {
            event =>            
            newPainterTest(this)
            setPenTest(this)
            setBrushTest(this)
            drawLineTest(this)
            drawRectTest(this)
        }
    }
}


main() {
    QApplication.create()
    let widget = PainterWidget()
    widget.show()
    QApplication.exec()
    QApplication.delete()
    println("test OK!")
    return 0
}
func newPainterTest(widget:QWidget) {
    
    let painter = QPainter(widget)

    painter.setPen(QPen(QColor.Black, 1.0))
    painter.setBrush(QBrush(QColor.LightGray))
    painter.drawRect(0, 0, 200, 300)
    painter.delete()
}


func setPenTest(widget:QWidget) {
    let painter = QPainter(widget)
    let pen = QPen(QColor.Black, 2.0)
    painter.setPen(pen)
    pen.delete()
    painter.delete()
}

func setBrushTest(widget:QWidget) {
    let painter = QPainter(widget)
    let brush = QBrush(QColor.Black)
    painter.setBrush(brush)
    brush.delete()
    painter.delete()
}

func drawLineTest(widget:QWidget) {
    let painter = QPainter(widget)
    painter.drawLine(0, 0, 10, 10)
    painter.delete()
}

func drawRectTest(widget:QWidget) {
    let painter = QPainter(widget)
    painter.drawRect(0, 0, 10, 10)
    painter.delete()
} 
