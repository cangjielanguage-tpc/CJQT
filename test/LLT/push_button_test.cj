// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
import cjqt.gui.*
import cjqt.core.*
import cjqt.widgets.*

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
