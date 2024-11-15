// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
package cjqt
import cjqt.gui.*
import cjqt.core.*
import cjqt.widgets.*

main() {
    QApplication.create()
    newGridLayoutWithParentTest()
    setSpacingTest()
    setAlignmentTest()
    addWidgetTest()
    QApplication.delete()
    println("test OK!")
    return 0
}

func newGridLayoutWithParentTest() {
    let widget = QWidget()
    let layout = QGridLayout(widget)
    layout.delete()
    widget.delete()
}

func setSpacingTest() {
    let layout = QGridLayout()
    layout.setHorizontalSpacing(5)
    layout.setVerticalSpacing(5)
    layout.delete()
}

func setAlignmentTest() {
    let layout = QGridLayout()
    layout.setAlignment(Alignment.AlignCenter)
    layout.delete()
}

func addWidgetTest() {
    let layout = QGridLayout()
    let widget1 = QWidget()
    layout.addWidget(widget1)
    let widget2 = QWidget()
    layout.addWidget(widget2, 1, 2)
    let widget3 = QWidget()
    layout.addWidget(widget3, 1, 3, 1, 1)
    widget1.delete()
    widget2.delete()
    widget3.delete()
    layout.delete()
}
