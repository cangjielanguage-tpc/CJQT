import qt.*
import qt.widgets.*
import qt.gui.*

main() {
    testQt()
    //testQml()
}

func testQt() {
    QApplication()
    let win = QWidget()
    win.setWindowTitle("CJQT Demo")
    win.resize(400, 500)

    win.setPaintEvent() {
        event => 
        let painter = QPainter(win)
        let pen = QPen(QColor(100, 0, 0, 100), 5)
        painter.setPen(pen)
        painter.drawRect(20, 20, 100, 50)
    }

    win.show()

    QApplication.exec()

    win.delete()
    QApplication.delete()
}

func testQml() {
    QApplication()
    let engine = QQmlApplicationAngine()
    engine.loadUrl("./src/hello.qml")

    QApplication.exec()

    engine.delete()
    QApplication.delete()
}
