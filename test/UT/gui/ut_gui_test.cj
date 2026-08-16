package cjqt.gui

import cjqt.core.*
import cjqt.widgets.*
import std.unittest.*

@Test
public func testColorValue() {
    let white = QColor.White
    @Assert(white.rgba() == 0xffffffff)
    let red = QColor(255, 0, 0)
    @Assert(red.rgba() == 0xffff0000)
    let green = QColor(0, 255, 0)
    @Assert(green.rgba() == 0xff00ff00)
    let blue = QColor(0, 0, 255)
    @Assert(blue.rgba() == 0xff0000ff)
}

@Test
public func testFont() {
    let font = QFont()
    font.setFamily("Sans Serif")
    font.setPointSize(12)
    font.setWeight(75)
    font.setItalic(true)
    font.delete()
    @Assert(true)
}

@Test
public func testFontWithArgs() {
    let font = QFont("Serif", 10, 400, false)
    font.delete()
    @Assert(true)
}

@Test
public func testIcon() {
    let icon = QIcon()
    @Assert(icon.isNull())
    icon.delete()
}

@Test
public func testPalette() {
    let color = QColor(128, 128, 128)
    let palette = QPalette(color)
    palette.delete()
    @Assert(true)
}

@Test
public func testPen() {
    let pen = QPen(QColor.Black, 2.0)
    pen.setWidth(3)
    pen.setWidthF(3.5)
    pen.setColor(QColor.Red)
    let c = pen.color()
    @Assert(c.rgba() == QColor.Red.rgba())
    pen.delete()
}

@Test
public func testBrush() {
    let brush = QBrush(QColor.Green)
    let c = brush.color()
    @Assert(c.rgba() == QColor.Green.rgba())
    brush.setColor(QColor.Blue)
    brush.delete()
}

@Test
public func testStandardItem() {
    let item = QStandardItem()
    item.delete()
    @Assert(true)
}

@Test
public func testStandardItemModel() {
    let model = QStandardItemModel(3, 2)
    let item = QStandardItem()
    model.setItem(0, 0, item)
    model.removeRow(0)
    model.delete()
    @Assert(true)
}

@Test
public func testDoubleValidator() {
    let validator = QDoubleValidator()
    validator.setRange(0.0, 100.0, 2)
    @Assert(validator.bottom() == 0.0)
    @Assert(validator.top() == 100.0)
    validator.setDecimals(2)
    @Assert(validator.decimals() == 2)
    validator.delete()
}

@Test
public func testGradient() {
    let linear = QLinearGradient(0.0, 0.0, 100.0, 100.0)
    linear.setColorAt(0.0, QColor.White)
    linear.setColorAt(1.0, QColor.Black)
    let radial = QRadialGradient(50.0, 50.0, 30.0)
    radial.setColorAt(0.0, QColor.Red)
    let conical = QConicalGradient(50.0, 50.0, 0.0)
    conical.setColorAt(0.0, QColor.Blue)
    @Assert(true)
}

@Test
public func testVariantFromGui() {
    let v = QVariant("gui test")
    @Assert(v.toString() == "gui test")
    v.delete()
}

@Test
public func testQImage() {
    QApplication.create()
    let image = QImage(100, 80, QImageFormat.Format_RGB32)
    @Assert(!image.isNull())
    @Assert(image.width() == 100)
    @Assert(image.height() == 80)
    image.fill(QColor.White)
    image.setPixelColor(10, 10, QColor(255, 0, 0))
    let c = image.pixelColor(10, 10)
    @Assert(c.rgba() == QColor(255, 0, 0).rgba())
    @Assert(image.save("/tmp/cjqt_ut_image.png"))
    let loaded = QImage("/tmp/cjqt_ut_image.png")
    @Assert(!loaded.isNull())
    @Assert(loaded.width() == 100)
    loaded.delete()
    image.delete()
}

@Test
public func testQPainterPath() {
    let path = QPainterPath()
    @Assert(path.isEmpty())
    path.moveTo(0.0, 0.0)
    path.lineTo(10.0, 0.0)
    path.lineTo(10.0, 10.0)
    path.closeSubpath()
    @Assert(!path.isEmpty())
    @Assert(path.contains(5.0, 5.0))
    @Assert(!path.contains(20.0, 20.0))
    @Assert(path.elementCount() >= 4)
    path.delete()
}

@Test
public func testQFontMetrics() {
    QApplication.create()
    let dummy = QWidget()
    dummy.delete()
    let font = QFont()
    font.setPointSize(12)
    let metrics = QFontMetrics(font)
    @Assert(metrics.height() > 0)
    @Assert(metrics.ascent() > 0)
    @Assert(metrics.width("hello") > 0)
    metrics.delete()
    font.delete()
}

@Test
public func testQIntValidator() {
    let validator = QIntValidator(0, 100)
    @Assert(validator.bottom() == 0)
    @Assert(validator.top() == 100)
    @Assert(validator.validate("50").value() == QValidatorState.Acceptable.value())
    @Assert(validator.validate("150").value() == QValidatorState.Intermediate.value())
    @Assert(validator.validate("abc").value() == QValidatorState.Invalid.value())
    validator.setRange(-10, 10)
    @Assert(validator.bottom() == -10)
    validator.delete()
}

@Test
public func testQKeySequence() {
    let seq = QKeySequence("Ctrl+C")
    @Assert(!seq.isEmpty())
    @Assert(seq.count() == 1)
    @Assert(seq.toString().contains("Ctrl"))
    seq.delete()
}

@Test
public func testQCursor() {
    QApplication.create()
    let dummy = QWidget()
    dummy.delete()
    let cursor = QCursor()
    @Assert(cursor.shape().value() == CursorShape.ArrowCursor.value())
    let hand = QCursor(CursorShape.PointingHandCursor)
    @Assert(hand.shape().value() == CursorShape.PointingHandCursor.value())
    hand.delete()
    cursor.delete()
}

@Test
public func testQFontDatabase() {
    QApplication.create()
    let dummy = QWidget()
    dummy.delete()
    let families = QFontDatabase.families()
    @Assert(families.count() > 0)
    families.delete()
}

@Test
public func testQFontInfo() {
    QApplication.create()
    let dummy = QWidget()
    dummy.delete()
    let font = QFont()
    font.setPointSize(14)
    let info = QFontInfo(font)
    @Assert(info.pointSize() > 0)
    @Assert(info.family().size > 0)
    info.delete()
    font.delete()
}

@Test
public func testQPixmapCache() {
    QApplication.create()
    let dummy = QWidget()
    dummy.delete()
    @Assert(QPixmapCache.cacheLimit() > 0)
    QPixmapCache.setCacheLimit(2048)
    @Assert(QPixmapCache.cacheLimit() == 2048)
    let pixmap = QPixmap(32, 32)
    @Assert(QPixmapCache.insert("test_key", pixmap))
    QPixmapCache.remove("test_key")
    QPixmapCache.clear()
    pixmap.delete()
    QPixmapCache.setCacheLimit(1024)
}

@Test
public func testQMovie() {
    QApplication.create()
    let movie = QMovie()
    @Assert(!movie.isRunning())
    movie.delete()
}

@Test
public func testQTextDocument() {
    let doc = QTextDocument()
    doc.setPlainText("hello rich text")
    @Assert(doc.toPlainText() == "hello rich text")
    @Assert(doc.characterCount() > 10)
    doc.setHtml("<b>bold</b>")
    @Assert(doc.toPlainText() == "bold")
    doc.setModified(true)
    @Assert(doc.isModified())
    doc.delete()
}

@Test
public func testQTextCursor() {
    let doc = QTextDocument()
    let cursor = QTextCursor(doc)
    cursor.insertText("abc")
    @Assert(cursor.position() == 3)
    cursor.setPosition(1)
    cursor.insertText("X")
    @Assert(doc.toPlainText() == "aXbc")
    cursor.selectAll()
    @Assert(cursor.hasSelection())
    cursor.delete()
    doc.delete()
}

@Test
public func testQRegularExpressionValidator() {
    let validator = QRegularExpressionValidator("^\\d{3}$")
    @Assert(validator.validate("123").value() == QValidatorState.Acceptable.value())
    @Assert(validator.validate("12a").value() == QValidatorState.Invalid.value())
    validator.delete()
}

@Test
public func testResizeEvent() {
    let event = QResizeEvent(QSize(100, 80), QSize(50, 40))
    @Assert(event.width() == 100)
    @Assert(event.height() == 80)
    let old = event.oldSize()
    @Assert(old.width == 50)
    event.delete()
}

@Test
public func testShowCloseEvent() {
    let show = QShowEvent()
    show.delete()
    let close = QCloseEvent()
    @Assert(close.isAccepted())
    close.delete()
}

@Test
public func testQDrag() {
    QApplication.create()
    let dummy = QWidget()
    let drag = QDrag(dummy.ptr)
    let mime = QMimeData()
    mime.setText("drag data")
    drag.setMimeData(mime)
    drag.delete()
    dummy.delete()
}
