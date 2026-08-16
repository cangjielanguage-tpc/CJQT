package cjqt.widgets

import cjqt.gui.*
import cjqt.core.*
import std.unittest.*

@Test
public func testApplication() {
    QApplication.create()
    QApplication.delete()
    @Assert(true)
}

@Test
public func testWidgetBasics() {
    QApplication.create()
    let widget = QWidget()
    widget.setWindowTitle("unit test")
    @Assert(widget.windowTitle() == "unit test")
    widget.resize(320, 240)
    widget.move(10, 10)
    widget.setFixedSize(200, 120)
    widget.setToolTip("tip")
    @Assert(widget.toolTip() == "tip")
    widget.show()
    @Assert(widget.isVisible())
    widget.hide()
    @Assert(!widget.isVisible())
    widget.close()
    widget.delete()
    QApplication.delete()
}

@Test
public func testLabel() {
    QApplication.create()
    let label = QLabel("hello")
    label.setText("world")
    label.delete()
    QApplication.delete()
    @Assert(true)
}

@Test
public func testPushButton() {
    QApplication.create()
    let button = QPushButton()
    button.setText("click")
    button.delete()
    QApplication.delete()
    @Assert(true)
}

@Test
public func testCheckBox() {
    QApplication.create()
    let box = QCheckBox()
    @Assert(!box.isChecked())
    box.setChecked(true)
    @Assert(box.isChecked())
    box.setText("box")
    @Assert(box.text() == "box")
    box.delete()
    QApplication.delete()
}

@Test
public func testRadioButton() {
    QApplication.create()
    let radio = QRadioButton()
    radio.setChecked(true)
    @Assert(radio.isChecked())
    radio.setText("radio")
    @Assert(radio.text() == "radio")
    radio.delete()
    QApplication.delete()
}

@Test
public func testLineEdit() {
    QApplication.create()
    let edit = QLineEdit()
    edit.setText("cjqt")
    @Assert(edit.text() == "cjqt")
    edit.setPlaceholderText("placeholder")
    @Assert(edit.placeholderText() == "placeholder")
    edit.setReadOnly(true)
    @Assert(edit.isReadOnly())
    edit.setReadOnly(false)
    edit.clear()
    @Assert(edit.text() == "")
    edit.delete()
    QApplication.delete()
}

@Test
public func testTextEdit() {
    QApplication.create()
    let edit = QTextEdit()
    edit.setPlainText("hello")
    @Assert(edit.toPlainText() == "hello")
    edit.append(" world")
    @Assert(edit.toPlainText().contains("hello"))
    edit.setReadOnly(true)
    @Assert(edit.isReadOnly())
    edit.delete()
    QApplication.delete()
}

@Test
public func testGroupBox() {
    QApplication.create()
    let box = QGroupBox()
    box.setTitle("group")
    @Assert(box.title() == "group")
    box.setCheckable(true)
    @Assert(box.isCheckable())
    box.setChecked(true)
    @Assert(box.isChecked())
    box.delete()
    QApplication.delete()
}

@Test
public func testFrame() {
    QApplication.create()
    let frame = QFrame()
    frame.setFrameShape(QFrameShape.Box)
    frame.setLineWidth(2)
    @Assert(frame.lineWidth() == 2)
    frame.delete()
    QApplication.delete()
}

@Test
public func testMainWindow() {
    QApplication.create()
    let win = QMainWindow()
    let central = QWidget()
    win.setCentralWidget(central)
    win.setWindowTitle("main")
    @Assert(win.windowTitle() == "main")
    win.delete()
    QApplication.delete()
}

@Test
public func testMenuBar() {
    QApplication.create()
    let win = QMainWindow()
    let bar = win.menuBar()
    let fileMenu = bar.addMenu("文件")
    fileMenu.addAction("打开")
    fileMenu.addSeparator()
    win.delete()
    QApplication.delete()
    @Assert(true)
}

@Test
public func testStatusBar() {
    QApplication.create()
    let bar = QStatusBar()
    bar.showMessage("ready")
    @Assert(bar.currentMessage() == "ready")
    bar.clearMessage()
    @Assert(bar.currentMessage() == "")
    bar.delete()
    QApplication.delete()
}

@Test
public func testToolBar() {
    QApplication.create()
    let win = QMainWindow()
    let bar = QToolBar()
    win.addToolBar(bar)
    bar.addAction("action1")
    bar.addSeparator()
    win.delete()
    QApplication.delete()
    @Assert(true)
}

@Test
public func testTabWidget() {
    QApplication.create()
    let tabs = QTabWidget()
    let page1 = QWidget()
    let page2 = QWidget()
    tabs.addTab(page1, "one")
    tabs.addTab(page2, "two")
    @Assert(tabs.count() == 2)
    tabs.setTabText(0, "first")
    @Assert(tabs.tabText(0) == "first")
    @Assert(tabs.currentIndex() == 0)
    @Assert(tabs.currentWidget().ptr == page1.ptr)
    tabs.delete()
    QApplication.delete()
}

@Test
public func testTabBar() {
    QApplication.create()
    let bar = QTabBar()
    bar.addTab("one")
    bar.addTab("two")
    @Assert(bar.count() == 2)
    bar.setTabText(1, "second")
    @Assert(bar.tabText(1) == "second")
    bar.removeTab(0)
    @Assert(bar.count() == 1)
    bar.delete()
    QApplication.delete()
}

@Test
public func testScrollBar() {
    QApplication.create()
    let bar = QScrollBar()
    bar.delete()
    let hbar = QScrollBar(Orientation.Horizontal)
    hbar.delete()
    QApplication.delete()
    @Assert(true)
}

@Test
public func testScrollArea() {
    QApplication.create()
    let area = QScrollArea()
    let content = QWidget()
    area.setWidget(content)
    @Assert(area.widget().ptr == content.ptr)
    area.setWidgetResizable(true)
    @Assert(area.widgetResizable())
    area.takeWidget()
    area.delete()
    QApplication.delete()
}

@Test
public func testSplitter() {
    QApplication.create()
    let splitter = QSplitter()
    let w1 = QWidget()
    let w2 = QWidget()
    splitter.addWidget(w1)
    splitter.addWidget(w2)
    @Assert(splitter.count() == 2)
    @Assert(splitter.widget(0).ptr == w1.ptr)
    splitter.setHandleWidth(5)
    splitter.delete()
    QApplication.delete()
}

@Test
public func testLayouts() {
    QApplication.create()
    let widget = QWidget()
    let vbox = QVBoxLayout(parent: widget)
    let hbox = QHBoxLayout()
    let b1 = QPushButton()
    let b2 = QPushButton()
    vbox.addWidget(b1)
    vbox.addLayout(hbox)
    hbox.addWidget(b2)
    vbox.addStretch(0)
    vbox.addSpacing(4)
    widget.delete()
    QApplication.delete()
    @Assert(true)
}

@Test
public func testGridLayout() {
    QApplication.create()
    let widget = QWidget()
    let grid = QGridLayout()
    let b1 = QPushButton()
    let b2 = QPushButton()
    grid.addWidget(b1, 0, 0)
    grid.addWidget(b2, 1, 1)
    grid.setHorizontalSpacing(6)
    grid.setVerticalSpacing(6)
    widget.setLayout(grid)
    widget.delete()
    QApplication.delete()
    @Assert(true)
}

@Test
public func testGraphicsSceneAndItems() {
    QApplication.create()
    let scene = QGraphicsScene()
    scene.setSceneRect(0.0, 0.0, 100.0, 100.0)
    let rect = scene.sceneRect()
    @Assert(rect.width == 100.0)
    let line = QGraphicsLineItem()
    line.setLine(0.0, 0.0, 10.0, 10.0)
    scene.addItem(line)
    scene.delete()
    QApplication.delete()
    @Assert(true)
}

@Test
public func testGraphicsView() {
    QApplication.create()
    let scene = QGraphicsScene()
    let view = QGraphicsView()
    view.setScene(scene)
    @Assert(view.scene().ptr == scene.ptr)
    view.setSceneRect(0.0, 0.0, 100.0, 100.0)
    view.delete()
    scene.delete()
    QApplication.delete()
}

@Test
public func testPainterOnPixmap() {
    QApplication.create()
    let pixmap = QPixmap(200, 200)
    let painter = QPainter(pixmap)
    painter.setPen(QPen(QColor.Black, 1.0))
    painter.setBrush(QBrush(QColor.White))
    painter.drawLine(0, 0, 100, 100)
    painter.drawRect(10, 10, 50, 50)
    painter.save()
    painter.restore()
    painter.delete()
    pixmap.delete()
    QApplication.delete()
    @Assert(true)
}

@Test
public func testPixmap() {
    QApplication.create()
    let dummy = QWidget()
    dummy.delete()
    let pixmap = QPixmap(100, 80)
    @Assert(pixmap.getWidth() == 100)
    @Assert(pixmap.getHeight() == 80)
    pixmap.fill(QColor.White)
    pixmap.delete()
    QApplication.delete()
}

@Test
public func testAction() {
    QApplication.create()
    let action = QAction()
    action.setText("save")
    @Assert(action.text() == "save")
    action.setCheckable(true)
    action.setChecked(true)
    @Assert(action.isChecked())
    action.delete()
    QApplication.delete()
}
