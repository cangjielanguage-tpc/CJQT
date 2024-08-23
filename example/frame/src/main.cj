import cjqt.widgets.*
import cjqt.gui.*

main() {
    QApplication.create()

    let widget = QWidget()
    widget.setFixedSize(800, 800)
    widget.setWindowTitle("QFrame")
    var layout = QGridLayout()
    var frame1 = QFrame(widget)
    frame1.setLineWidth(3)
    frame1.setMidLineWidth(3)
    frame1.setFrameShape(QFrameShape.Box)
    frame1.setFrameShadow(QFrameShadow.Raised)
    frame1.setStyleSheel("background-color:cyan")
    var frame2 = QFrame(widget)
    frame2.setLineWidth(3)
    frame2.setMidLineWidth(3)
    frame2.setFrameShape(QFrameShape.Box)
    frame2.setFrameShadow(QFrameShadow.Raised)
    frame2.setStyleSheel("background-color:red")
    var frame3 = QFrame(widget)
    frame3.setLineWidth(3)
    frame3.setMidLineWidth(3)
    frame3.setFrameShape(QFrameShape.Box)
    frame3.setFrameShadow(QFrameShadow.Raised)
    frame3.setStyleSheel("background-color:green")
    var frame4 = QFrame(widget)
    frame4.setLineWidth(3)
    frame4.setMidLineWidth(3)
    frame4.setFrameShape(QFrameShape.Box)
    frame4.setFrameShadow(QFrameShadow.Raised)
    frame4.setStyleSheel("background-color:yellow")
    layout.addWidget(frame1, 0, 0, 40, 40)
    layout.addWidget(frame2, 0, 40, 40, 40)
    layout.addWidget(frame3, 40, 0, 40, 40)
    layout.addWidget(frame4, 40, 40, 40, 40)
    widget.setLayout(layout)
    widget.show()

    QApplication.exec()

    widget.delete()

    QApplication.delete()
}
