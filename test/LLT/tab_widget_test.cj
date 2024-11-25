// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
import cjqt.gui.*
import cjqt.core.*
import cjqt.widgets.*

main() {
    QApplication.create()
    newTabWidgetWithParentTest()
    addTabTest()
    setTabTest()
    configTest()
    QApplication.delete()
    return 0
}

func newTabWidgetWithParentTest() {
    let widget = QWidget()
    let tabWidget = QTabWidget(parent: widget)
    tabWidget.delete()
    widget.delete()
}

func addTabTest() {
    let tabWidget = QTabWidget()
    let widget1 = QWidget()
    tabWidget.addTab(widget1, "tab")
    let widget2 = QWidget()
    let icon = QIcon("doc/assets/logo.png")
    tabWidget.addTab(widget2, icon, "tab")
    let widget3 = QWidget()
    tabWidget.insertTab(0, widget3, "tab")
    let widget4 = QWidget()
    let icon1 = QIcon("doc/assets/logo.png")
    tabWidget.insertTab(0, widget4, icon1, "tab")
    tabWidget.indexOf(widget4)
    tabWidget.removeTab(0)
    tabWidget.count()
    tabWidget.currentIndex()
    tabWidget.currentWidget()
    tabWidget.widget(0)
    icon.delete()
    icon1.delete()
    widget1.delete()
    widget2.delete()
    widget3.delete()
    widget4.delete()
    tabWidget.delete()
}

func setTabTest() {
    let tabWidget = QTabWidget()
    let widget = QWidget()
    tabWidget.addTab(widget, "tab")
    tabWidget.setTabEnabled(0, true)
    tabWidget.isTabEnabled(0)
    tabWidget.setTabText(0, "tab1")
    tabWidget.tabText(0)
    let icon = QIcon("doc/assets/logo.png")
    tabWidget.setTabIcon(0, icon)
    tabWidget.tabIcon(0)
    widget.delete()
    tabWidget.delete()
}

func configTest() {
    let tabWidget = QTabWidget()
    tabWidget.setIconSize(QSize(10, 10))
    tabWidget.iconSize()
    tabWidget.setUsesScrollButtons(true)
    tabWidget.usesScrollButtons()
    tabWidget.setTabsClosable(true)
    tabWidget.tabsClosable()
    tabWidget.setMovable(true)
    tabWidget.isMovable()
    tabWidget.setDocumentMode(true)
    tabWidget.documentMode()
    tabWidget.setTabBarAutoHide(true)
    tabWidget.tabBarAutoHide()
    tabWidget.tabBar()
    tabWidget.clear()
    tabWidget.delete()
}