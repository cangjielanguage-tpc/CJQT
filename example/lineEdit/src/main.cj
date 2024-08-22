import cjqt.qt.widgets.*
import cjqt.qt.gui.*

main() {
    QApplication.create()

    let mainWindow = maniWindow()

    mainWindow.show()

    QApplication.exec()

    mainWindow.delete()

    QApplication.delete()
}
