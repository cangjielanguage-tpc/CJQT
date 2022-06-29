import qt.widgets.*
import qt.gui.*
import example.tetris.*
import example.notepad.*

main() {
    // testQt()
    testTetris()
    // testNotepad()
}

func testQt() {
    QApplication.create()
    let win = QMainWindow()
    win.setWindowTitle("CJQT Example")
    win.resize(400, 300)

    let label = QLabel(win)
    label.setGeometry(120, 100, 200, 40)
    label.setText("Hello CJQT!")
    label.setFontSize(24)
    label.setFontColor(QColor.Red)

    let button = QPushButton(win)
    button.setGeometry(150, 180, 100, 24)
    button.setText("button")
    button.clicked.connect() {
        println("clicked")
    }

    win.show()

    QApplication.exec()

    win.delete()
    QApplication.delete()
}

func testTetris() {
    QApplication.create()

    let box = TetrisWindow()
    box.show()

    QApplication.exec()

    box.delete()

    QApplication.delete()
}

func testNotepad() {
    QApplication.create()

    let box = NotepadWindow()
    box.show()

    QApplication.exec()

    box.delete()

    QApplication.delete()
}
