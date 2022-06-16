import qt.*
import qt.widgets.*
import qt.gui.*

main() {
    // testQt()
    //testQml()
    testTetris()
}

func testQt() {
    QApplication.create()
    let win = QWidget()
    win.setWindowTitle("CJQT Demo")
    win.resize(400, 500)

    win.setPaintEvent() {
        event =>
        let painter = QPainter(win)
        let pen = QPen(QColor.Gray, 4)
        painter.setPen(pen)
        painter.drawRect(20, 20, 100, 50)
        painter.delete()
    }

    win.show()

    QApplication.exec()

    win.delete()
    QApplication.delete()
}

func testQml() {
    QApplication.create()
    let engine = QQmlApplicationAngine()
    engine.loadUrl("./src/hello.qml")

    QApplication.exec()

    engine.delete()
    QApplication.delete()
}

func testTetris() {
    QApplication.create()
    
    let box = TetrisWindow()
    box.show()

    QApplication.exec()

    box.delete()

    QApplication.delete()
}
