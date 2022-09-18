// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
from cjqt import qt.gui.*
from cjqt import qt.core.*
from cjqt import qt.widgets.*

main() {
    QApplication.create()
    newPushButtonWithParentTest()
    setTextTest()
    setStyleSheetTest()
    QApplication.delete()
    return 0
}

func newPushButtonWithParentTest() {
    let widget = QWidget()
    let button = QPushButton(widget)
    button.delete()
    widget.delete()
}

func setTextTest() {
    let button = QPushButton("button")
    button.delete()
}

func setStyleSheetTest() {
    let button = QPushButton()
    button.setStyleSheet("color: white;")
    button.delete()
}
