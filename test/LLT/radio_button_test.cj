// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
from cjqt import qt.gui.*
from cjqt import qt.code.*
from cjqt import qt.widgets.*

main() {
    QApplication.create()
    newRadioButtonWithParentTest()
    setTextTest()
    setCheckedTest()
    QApplication.delete()
    return 0
}

func newRadioButtonWithParentTest() {
    let widget = QWidget()
    let button = QRadioButton(parent: widget)
    button.delete()
    widget.delete()
}

func setTextTest() {
    let button = QRadioButton(text: "button")
    let result = button.text()
    button.delete()
}

func setCheckedTest() {
    let button = QRadioButton()
    button.setChecked(true)
    let result = button.isChecked()
    button.delete()
}
