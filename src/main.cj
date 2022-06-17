import qt.*
import qt.widgets.*
import qt.gui.*

main() {
    testQt()
    // testQml()
    // testTetris()
}

func testQt() {
    QApplication.create()
    let win = QWidget()
    win.setWindowTitle("CJQT Example")
    win.resize(400, 300)

    let label = QLabel(win)
    label.setGeometry(150, 150, 100, 24)
    label.setText("Hello CJQT!")

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
