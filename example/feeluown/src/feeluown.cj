import cjqt.qt.widgets.*
import gui.*


main() {
    QApplication.create()

    let app = GuiApp()
    app.show()

    QApplication.exec()

    app.delete()

    QApplication.delete()
    return 0
}