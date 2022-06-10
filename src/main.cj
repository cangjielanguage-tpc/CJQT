import qt.*

main() {
    let app = QApplication()
    let engine = QQmlApplicationAngine()
    engine.loadUrl("/home/wathinst/cjProject/qt/src/hello.qml")
    app.exec()
    engine.delete()
    app.delete()
}
