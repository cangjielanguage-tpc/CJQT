// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
import cjqt.gui.*
import cjqt.core.*
import cjqt.widgets.*

main() {
    QApplication.create()
    newGroupBoxWithParentTest()
    setTitleTest()
    setAlignmentTest()
    setFlatTest()
    setCheckableTest()
    setCheckedTest()
    QApplication.delete()
    return 0
}

func newGroupBoxWithParentTest() {
    let widget = QWidget()
    let groupBox = QGroupBox(parent: widget)
    groupBox.delete()
    widget.delete()
}

func setTitleTest() {
    let groupBox = QGroupBox()
    groupBox.setTitle("groupbox")
    let result = groupBox.title()
    groupBox.delete()
}

func setAlignmentTest() {
    let groupBox = QGroupBox()
    groupBox.setAlignment(1)
    let result = groupBox.alignment()
    groupBox.delete()
}

func setFlatTest() {
    let groupBox = QGroupBox()
    groupBox.setFlat(true)
    let result = groupBox.isFlat()
    groupBox.delete()
}

func setCheckableTest() {
    let groupBox = QGroupBox()
    groupBox.setCheckable(true)
    let result = groupBox.isCheckable()
    groupBox.delete()
}

func setCheckedTest() {
    let groupBox = QGroupBox()
    groupBox.setChecked(true)
    let result = groupBox.isChecked()
    groupBox.delete()
}
