from cjqt import qt.widgets.*
from cjqt import qt.gui.*

main() {
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
