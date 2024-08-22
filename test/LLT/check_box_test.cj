// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
import cjqt.qt.gui.*
import cjqt.qt.core.*
import cjqt.qt.widgets.*

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
