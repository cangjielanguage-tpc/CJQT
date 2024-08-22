// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
import cjqt.qt.gui.*
import cjqt.qt.core.*
import cjqt.qt.widgets.*

main() {
    QApplication.create()
    newTabBarWithParentTest()
    addTabTest()
    setTabTest()
    configTest()
    QApplication.delete()
    return 0
}

func newTabBarWithParentTest() {
    let widget = QWidget()
    let tabBar = QTabBar(parent: widget)
    tabBar.delete()
    widget.delete()
}

func addTabTest() {
    let tabBar = QTabBar()
    tabBar.addTab("tab")
    let icon = QIcon("doc/assets/logo.png")
    tabBar.addTab(icon, "tab")
    tabBar.insertTab(0, "tab")
    let icon1 = QIcon("doc/assets/logo.png")
    tabBar.insertTab(0, icon1, "tab")
    tabBar.moveTab(0, 2)
    tabBar.removeTab(0)
    tabBar.count()
    tabBar.currentIndex()
    tabBar.tabRect(0)
    tabBar.tabAt(QPoint(10, 10))
    icon.delete()
    icon1.delete()
    tabBar.delete()
}

func setTabTest() {
    let tabBar = QTabBar()
    tabBar.addTab("tab")
    tabBar.setTabEnabled(0, true)
    tabBar.isTabEnabled(0)
    tabBar.setTabText(0, "tab1")
    tabBar.tabText(0)
    tabBar.setTabTextColor(0, QColor.Black)
    tabBar.tabTextColor(0)
    let icon = QIcon("doc/assets/logo.png")
    tabBar.setTabIcon(0, icon)
    tabBar.tabIcon(0)
    tabBar.delete()
}

func configTest() {
    let tabBar = QTabBar()
    tabBar.setDrawBase(true)
    tabBar.drawBase()
    tabBar.setIconSize(QSize(10, 10))
    tabBar.iconSize()
    tabBar.setUsesScrollButtons(true)
    tabBar.usesScrollButtons()
    tabBar.setTabsClosable(true)
    tabBar.tabsClosable()
    tabBar.setExpanding(true)
    tabBar.expanding()
    tabBar.setMovable(true)
    tabBar.isMovable()
    tabBar.setDocumentMode(true)
    tabBar.documentMode()
    tabBar.setAutoHide(true)
    tabBar.autoHide()
    tabBar.setChangeCurrentOnDrag(true)
    tabBar.changeCurrentOnDrag()
    tabBar.delete()
}