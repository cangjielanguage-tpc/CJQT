// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
from cjqt import qt.gui.*
from cjqt import qt.core.*
from cjqt import qt.widgets.*

main() {
    QApplication.create()
    newLabelWithParentTest()
    setTextTest()
    setStyleSheetTest()
    setFontColorTest()
    setFontSizeTest()
    QApplication.delete()
    return 0
}

func newLabelWithParentTest() {
    let widget = QWidget()
    let label = QLabel(widget)
    label.delete()
    widget.delete()
}

func setTextTest() {
    let label = QLabel("label")
    label.delete()
}

func setStyleSheetTest() {
    let label = QLabel()
    label.setStyleSheet("border: 2px solid red")
    label.delete()
}

func setFontColorTest() {
    let label = QLabel()
    label.setFontColor(QColor.Black)
    label.delete()
}

func setFontSizeTest() {
    let label = QLabel()
    label.setFontSize(24)
    label.delete()
}
