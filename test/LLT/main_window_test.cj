// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
from cjqt import qt.gui.*
from cjqt import qt.core.*
from cjqt import qt.widgets.*

main() {
    QApplication.create()
    newMainWindowWithParentTest()
    setCentralWidgetTest()
    setMenuBarTest()
    addToolBarTest()
    QApplication.delete()
    return 0
}

func newMainWindowWithParentTest() {
    let widget = QWidget()
    let mainWindow = QMainWindow(widget)
    mainWindow.delete()
    widget.delete()
}

func setCentralWidgetTest() {
    let mainWindow = QMainWindow()
    let widget = QWidget()
    mainWindow.setCentralWidget(widget)
    widget.delete()
    mainWindow.delete()
}

func setMenuBarTest() {
    let mainWindow = QMainWindow()
    let menu = QMenuBar()
    mainWindow.setMenuBar(menu)
    let result = mainWindow.menuBar()
    menu.delete()
    mainWindow.delete()
}

func addToolBarTest() {
    let mainWindow = QMainWindow()
    let tool = QToolBar()
    mainWindow.addToolBar(tool)
    tool.delete()
    mainWindow.delete()
}
