// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
import cjqt.qt.gui.*
import cjqt.qt.core.*
import cjqt.qt.widgets.*

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
