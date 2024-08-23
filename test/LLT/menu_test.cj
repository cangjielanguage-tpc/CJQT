// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
import cjqt.gui.*
import cjqt.core.*
import cjqt.widgets.*

main() {
    QApplication.create()
    newMenuWithParentTest()
    newMenuByPtrTest()
    setTitleTest()
    addActionTest()
    addActionTextTest()
    addActionIconTest()
    addSeparatorTest()
    QApplication.delete()
    return 0
}

func newMenuWithParentTest() {
    let widget = QWidget()
    let menu = QMenu(widget)
    menu.delete()
    widget.delete()
}

func newMenuByPtrTest() {
    let menu = QMenu()
    let menu1 = QMenu(menu.ptr)
    menu.delete()
}

func setTitleTest() {
    let menu = QMenu()
    menu.setTitle("action")
    menu.delete()
}

func addActionTest() {
    let menu = QMenu()
    let action = QAction()
    menu.addAction(action)
    action.delete()
    menu.delete()
}

func addActionTextTest() {
    let menu = QMenu()
    let action = menu.addAction("action")
    let action1 = menu.menuAction()
    action.delete()
    menu.delete()
}

func addActionIconTest() {
    let menu = QMenu()
    let icon = QIcon("doc/assets/logo.png")
    let action = menu.addAction(icon, "action")
    icon.delete()
    action.delete()
    menu.delete()
}

func addSeparatorTest() {
    let menu = QMenu()
    menu.addSeparator()
    menu.delete()
}
