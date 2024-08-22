// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
import cjqt.qt.gui.*
import cjqt.qt.core.*
import cjqt.qt.widgets.*

main() {
    QApplication.create()
    newToolBarWithParentTest()
    addActionTest()
    addActionByStrTest()
    addActionByStrAndIconTest()
    addSeparatorTest()
    insertSeparatorTest()
    AddWidgetTest()
    insertWidgetTest()
    QApplication.delete()
    return 0
}

func newToolBarWithParentTest() {
    let widget = QWidget()
    let toolBar = QToolBar(parent: widget)
    toolBar.delete()
    widget.delete()
}

func addActionTest() {
    let toolBar = QToolBar()
    let action = QAction()
    action.setText("action")
    toolBar.addAction(action)
    action.delete()
    toolBar.delete()
}

func addActionByStrTest() {
    let toolBar = QToolBar()
    let action = toolBar.addAction("action")
    action.delete()
    toolBar.delete()
}

func addActionByStrAndIconTest() {
    let toolBar = QToolBar()
    let icon = QIcon("doc/assets/logo.png")
    let action = toolBar.addAction(icon, "action")
    icon.delete()
    action.delete()
    toolBar.delete()
}

func addSeparatorTest() {
    let toolBar = QToolBar()
    toolBar.addSeparator()
    toolBar.delete()
}

func insertSeparatorTest() {
    let toolBar = QToolBar()
    let action = toolBar.addAction("action")
    toolBar.insertSeparator(action)
    action.delete()
    toolBar.delete()
}

func AddWidgetTest() {
    let toolBar = QToolBar()
    let widget = QWidget()
    toolBar.AddWidget(widget)
    widget.delete()
    toolBar.delete()
}

func insertWidgetTest() {
    let toolBar = QToolBar()
    let action = toolBar.addAction("action")
    let widget = QWidget()
    toolBar.insertWidget(action, widget)
    action.delete()
    widget.delete()
    toolBar.delete()
}
