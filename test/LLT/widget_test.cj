// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
from cjqt import qt.gui.*
from cjqt import qt.code.*
from cjqt import qt.widgets.*

main() {
    QApplication.create()
    setFixedSizeTest()
    resizeTest()
    showTest()
    hideTest()
    showMinimizedTest()
    showMaximizedTest()
    showFullScreenTest()
    showNormalTest()
    closeTest()
    moveTest()
    setWindowTitleTest()
    setLayoutTest()
    setPaletteTest()
    setAutoFillBackgroundTest()
    setGeometryTest()
    setFontTest()
    repaintTest()
    QApplication.delete()
    return 0
}

// 设置固定大小
func setFixedSizeTest() {
    let widget = QWidget()
    widget.setFixedSize(200, 120)
    widget.delete()
}

// 重新设置大小
func resizeTest() {
    let widget = QWidget()
    widget.resize(100, 80)
    widget.delete()
}

func showTest(){
    let widget = QWidget()
    widget.show()
    widget.delete()
}

func hideTest(){
    let widget = QWidget()
    widget.hide()
    widget.delete()
}

func showMinimizedTest(){
    let widget = QWidget()
    widget.showMinimized()
    widget.delete()
}

func showMaximizedTest(){
    let widget = QWidget()
    widget.showMaximized()
    widget.delete()
}

func showFullScreenTest(){
    let widget = QWidget()
    widget.showFullScreen()
    widget.delete()
}

func showNormalTest(){
    let widget = QWidget()
    widget.showNormal()
    widget.delete()
}

func closeTest(){
    let widget = QWidget()
    widget.close()
    widget.delete()
}

func moveTest() {
    let widget = QWidget()
    widget.move(20, 20)
    widget.delete()
}

// 设置窗口标题
func setWindowTitleTest(){
    let widget = QWidget()
    widget.setWindowTitle("test")
    widget.delete()
}

func setLayoutTest() {
    let widget = QWidget()
    let layout = QBoxLayout()
    widget.setLayout(layout)
    layout.delete()
    widget.delete()
}

func setPaletteTest() {
    let widget = QWidget()
    let color = QColor(128,128,128,128)
    let palette = QPalette(color)
    widget.setPalette(palette)
    color.delete()
    palette.delete()
    widget.delete()
}

func setAutoFillBackgroundTest() {
    let widget = QWidget()
    widget.setAutoFillBackground(true)
    widget.delete()
}

func setGeometryTest() {
    let widget = QWidget()
    widget.setGeometry(20, 20, 20, 20)
    widget.delete()
}

func setFontTest() {
    let widget = QWidget()
    let font = QFont()
    widget.setFont(font)
    font.delete()
    widget.delete()
}

func repaintTest() {
    let widget = QWidget()
    widget.repaint()
    widget.delete()
}