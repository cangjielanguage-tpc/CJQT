from cjqt import qt.widgets.*
from cjqt import qt.gui.*

main() {
    QApplication.create()

    //let box = NotepadWindow()
    //box.show()

    let win = QMainWindow()
    let menu = win.menuBar().addMenu("test")
    win.resize(400, 300)
    win.show()

    QApplication.exec()

    //win.delete()

    QApplication.delete()
}