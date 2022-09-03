from cjqt import qt.widgets.*
from cjqt import qt.gui.*

main() {
    QApplication.create()

    let mainWindow = maniWindow()

    mainWindow.show()

    QApplication.exec()

    mainWindow.delete()

    QApplication.delete()
}
