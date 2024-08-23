// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
import cjqt.gui.*
import cjqt.core.*
import cjqt.widgets.*

main() {
    QApplication.create()
    newLayoutTest()
    newBoxLayoutWithParentTest()
    newBoxLayoutByPtrTest()
    addWidgetTest()
    newVBoxLayoutTest()
    newHBoxLayoutTest()
    QApplication.delete()
    return 0
}

func newLayoutTest(){
    let layout = QLayout(0)
    layout.delete()
}

func newBoxLayoutWithParentTest() {
    let widget = QWidget()
    let layout = QBoxLayout(parent: widget)
    layout.delete()
    widget.delete()
}

func newBoxLayoutByPtrTest() {
    let layout = QBoxLayout()
    let layout1 = QBoxLayout(layout.ptr)
    layout.delete()
}

func addWidgetTest(){
    let widget = QWidget()
    let layout = QBoxLayout()
    layout.addWidget(widget)
    layout.delete()
}

func newVBoxLayoutTest() {
    let widget = QWidget()
    let layout = QVBoxLayout(parent: widget)
    layout.delete()
    widget.delete()
}

func newHBoxLayoutTest() {
    let widget = QWidget()
    let layout = QHBoxLayout(parent: widget)
    layout.delete()
    widget.delete()
}