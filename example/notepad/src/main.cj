import cjqt.widgets.*
import cjqt.gui.*

main() {
    QApplication.create()

    let win = NotepadWindow()
    win.show()

    QApplication.exec()

    win.delete()

    QApplication.delete()
}