// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
import cjqt.qt.gui.*
import cjqt.qt.core.*
import cjqt.qt.widgets.*

main() {
    QApplication.create()
    newActionWithParentTest()
    setStatusTipTest()
    setTextTest()
    setIconTest()
    setCheckableTest()
    setCheckedTest()
    triggeredTest()
    QApplication.delete()
    return 0
}

func newActionWithParentTest() {
    let widget = QWidget()
    let action = QAction(widget)
    action.delete()
    widget.delete()
}

func setStatusTipTest() {
    let action = QAction()
    action.setStatusTip("action")
    action.delete()
}

func setTextTest() {
    let action = QAction()
    action.setText("action")
    let text = action.text()
    action.delete()
}

func setIconTest() {
    let action = QAction()
    let icon = QIcon("doc/assets/logo.png")
    action.setIcon(icon)
    let icon1 = action.icon()
    icon.delete()
    action.delete()
}

func setCheckableTest() {
    let action = QAction()
    action.setCheckable(true)
    let result = action.isCheckable()
    action.delete()
}

func setCheckedTest() {
    let action = QAction()
    action.setChecked(true)
    let result = action.isChecked()
    action.delete()
}

func triggeredTest() {
    let action = QAction()
    action.triggered.connect() {
        result => 
    }
    action.delete()
}
