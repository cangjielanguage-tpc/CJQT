package lineEdit
import cjqt.widgets.*
import cjqt.gui.*

main() {
    QApplication.create()

    let mainWindow = maniWindow()

    mainWindow.show()

    QApplication.exec()

    mainWindow.delete()

    QApplication.delete()
}
