from cjqt import qt.widgets.*
from cjqt import qt.gui.*

main() {
    QApplication.create()

    let box = NotepadWindow()
    box.show()

    QApplication.exec()

    box.delete()

    QApplication.delete()
}