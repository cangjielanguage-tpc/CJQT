import qt.*

main() {
    testQt()
    // testQml()
}

func testQt() {
    let app = QApplication()
    let win = QWidget()
    win.setWindowTitle("CJQT Demo")
    win.show()

    app.exec()

    win.delete()
    app.delete()
}

func testQml() {
    let app = QApplication()
    let engine = QQmlApplicationAngine()
    engine.loadUrl("./src/hello.qml")

    app.exec()

    engine.delete()
    app.delete()
}
