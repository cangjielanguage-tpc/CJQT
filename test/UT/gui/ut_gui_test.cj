package cjqt.gui

import cjqt.core.QVariant
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
