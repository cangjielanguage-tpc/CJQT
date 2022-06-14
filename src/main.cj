import qt.*
import qt.widgets.*

main() {
    testQt()
    //testQml()
}

func testQt() {
    QApplication()
    let win = QMainWindow()
    win.setWindowTitle("CJQT Demo")
    win.resize(400, 500)
    //let tabel = QLabel(win)
    //tabel.setGeometry(25, 25, 200, 100)
    //tabel.setText("Hello CJQT!")

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
