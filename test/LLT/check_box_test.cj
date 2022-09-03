// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
from cjqt import qt.gui.*
from cjqt import qt.code.*
from cjqt import qt.widgets.*

main() {
    QApplication.create()
    newCheckBoxWithParentTest()
    setTextTest()
    setCheckedTest()
    QApplication.delete()
    return 0
}

func newCheckBoxWithParentTest() {
    let widget = QWidget()
    let checkbox = QCheckBox(parent: widget)
    checkbox.delete()
    widget.delete()
}

func setTextTest() {
    let checkbox = QCheckBox(text: "checkbox")
    let result = checkbox.text()
    checkbox.delete()
}

func setCheckedTest() {
    let checkbox = QCheckBox()
    checkbox.setChecked(true)
    let result = checkbox.isChecked()
    checkbox.delete()
}
