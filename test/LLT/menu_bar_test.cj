// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
from cjqt import qt.gui.*
from cjqt import qt.core.*
from cjqt import qt.widgets.*

main() {
    QApplication.create()
    newMenuBarWithParentTest()
    newMenuBarByPtrTest()
    addActionByStrTest()
    addActionTest()
    addMenuTest()
    addMenuByStrTest()
    addMenuWithIconTest()
    QApplication.delete()
    return 0
}

func newMenuBarWithParentTest() {
    let widget = QWidget()
    let menuBar = QMenuBar(widget)
    menuBar.delete()
    widget.delete()
}

func newMenuBarByPtrTest() {
    let menuBar = QMenuBar()
    let menuBar1 = QMenuBar(menuBar.ptr)
    menuBar.delete()
}

func addActionByStrTest() {
    let menuBar = QMenuBar()
    let action = menuBar.addAction("action")
    action.delete()
    menuBar.delete()
}

func addActionTest() {
    let menuBar = QMenuBar()
    let action = QAction()
    action.setText("action")
    menuBar.addAction(action)
    action.delete()
    menuBar.delete()
}

func addMenuTest() {
    let menuBar = QMenuBar()
    let menu = menuBar.addMenu("menu")
    menu.delete()
    menuBar.delete()
}

func addMenuByStrTest() {
    let menuBar = QMenuBar()
    let menu = QMenu()
    menu.setTitle("menu")
    menuBar.addMenu(menu)
    menu.delete()
    menuBar.delete()
}

func addMenuWithIconTest() {
    let menuBar = QMenuBar()
    let icon = QIcon("doc/assets/logo.png")
    let menu = menuBar.addMenu(icon, "menu")
    icon.delete()
    menu.delete()
    menuBar.delete()
}
