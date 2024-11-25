// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
import cjqt.gui.*
import cjqt.core.*
import cjqt.widgets.*

main() {
    QApplication.create()
    newStatusBarWithParentTest()
    addWidgetTest()
    insertWidgetTest()
    addPermanentWidgetTest()
    insertPermanentWidgetTest()
    showMessageTest()
    QApplication.delete()
    return 0
}

func newStatusBarWithParentTest() {
    let widget = QWidget()
    let statusBar = QStatusBar(parent: widget)
    statusBar.delete()
    widget.delete()
}

func addWidgetTest() {
    let statusBar = QStatusBar()
    let widget = QWidget()
    statusBar.addWidget(widget)
    statusBar.removeWidget(widget)
    widget.delete()
    statusBar.delete()
}

func insertWidgetTest() {
    let statusBar = QStatusBar()
    let widget = QWidget()
    statusBar.insertWidget(0, widget)
    widget.delete()
    statusBar.delete()
}

func addPermanentWidgetTest() {
    let statusBar = QStatusBar()
    let widget = QWidget()
    statusBar.addPermanentWidget(widget)
    widget.delete()
    statusBar.delete()
}

func insertPermanentWidgetTest() {
    let statusBar = QStatusBar()
    let widget = QWidget()
    statusBar.insertPermanentWidget(0, widget)
    widget.delete()
    statusBar.delete()
}

func showMessageTest() {
    let statusBar = QStatusBar()
    statusBar.showMessage("message")
    let mesage = statusBar.currentMessage()
    statusBar.clearMessage()
    statusBar.delete()
}