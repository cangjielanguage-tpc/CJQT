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

@Test
public func testComboBox() {
    QApplication.create()
    let combo = QComboBox()
    combo.addItem("apple")
    combo.addItem("banana")
    combo.addItem("cherry")
    @Assert(combo.count() == 3)
    @Assert(combo.currentIndex() == 0)
    @Assert(combo.currentText() == "apple")
    @Assert(combo.itemText(1) == "banana")
    combo.setCurrentIndex(2)
    @Assert(combo.currentText() == "cherry")
    combo.setEditable(true)
    @Assert(combo.isEditable())
    combo.removeItem(0)
    @Assert(combo.count() == 2)
    combo.delete()
    QApplication.delete()
}

@Test
public func testSlider() {
    QApplication.create()
    let slider = QSlider()
    slider.setRange(0, 100)
    @Assert(slider.minimum() == 0)
    @Assert(slider.maximum() == 100)
    slider.setValue(42)
    @Assert(slider.value() == 42)
    slider.setTickInterval(10)
    slider.setSingleStep(5)
    slider.delete()
    let v = QSlider(Orientation.Vertical)
    v.delete()
    QApplication.delete()
}

@Test
public func testProgressBar() {
    QApplication.create()
    let bar = QProgressBar()
    bar.setRange(0, 100)
    bar.setValue(60)
    @Assert(bar.value() == 60)
    @Assert(bar.minimum() == 0)
    @Assert(bar.maximum() == 100)
    bar.setFormat("%p%")
    @Assert(bar.text().contains("%"))
    bar.setTextVisible(false)
    @Assert(!bar.isTextVisible())
    bar.delete()
    QApplication.delete()
}

@Test
public func testSpinBox() {
    QApplication.create()
    let spin = QSpinBox()
    spin.setRange(0, 100)
    @Assert(spin.minimum() == 0)
    @Assert(spin.maximum() == 100)
    spin.setValue(25)
    @Assert(spin.value() == 25)
    spin.setPrefix("$")
    spin.setSuffix("元")
    @Assert(spin.text().contains("$"))
    spin.setSingleStep(5)
    spin.delete()
    QApplication.delete()
}

@Test
public func testStackedWidget() {
    QApplication.create()
    let stack = QStackedWidget()
    let p1 = QWidget()
    let p2 = QWidget()
    @Assert(stack.addWidget(p1) == 0)
    @Assert(stack.addWidget(p2) == 1)
    @Assert(stack.count() == 2)
    stack.setCurrentIndex(1)
    @Assert(stack.currentIndex() == 1)
    stack.setCurrentIndex(0)
    @Assert(stack.currentIndex() == 0)
    stack.delete()
    QApplication.delete()
}

@Test
public func testToolBox() {
    QApplication.create()
    let box = QToolBox()
    let p1 = QWidget()
    let p2 = QWidget()
    @Assert(box.addItem(p1, "tab1") == 0)
    @Assert(box.addItem(p2, "tab2") == 1)
    @Assert(box.count() == 2)
    @Assert(box.itemText(0) == "tab1")
    box.setItemText(1, "renamed")
    @Assert(box.itemText(1) == "renamed")
    box.setCurrentIndex(1)
    @Assert(box.currentIndex() == 1)
    box.delete()
    QApplication.delete()
}

@Test
public func testButtonGroup() {
    QApplication.create()
    let group = QButtonGroup()
    @Assert(group.isExclusive())
    let b1 = QCheckBox()
    let b2 = QCheckBox()
    group.addButton(b1, 1)
    group.addButton(b2, 2)
    b1.setChecked(true)
    @Assert(group.checkedId() == 1)
    group.setExclusive(false)
    @Assert(!group.isExclusive())
    b1.delete()
    b2.delete()
    group.delete()
    QApplication.delete()
}
