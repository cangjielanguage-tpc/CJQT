import qt.*

main() {
    testQt()
    //testQml()
}

func testQt() {
    QApplication()
    let win = QMainWindow()
    win.setWindowTitle("CJQT Demo")
    win.resize(400, 500)

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
