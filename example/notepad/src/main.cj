import cjqt.qt.widgets.*
import cjqt.qt.gui.*

main() {
    QApplication.create()

    let win = NotepadWindow()
    win.show()

    QApplication.exec()

    win.delete()

    QApplication.delete()
}