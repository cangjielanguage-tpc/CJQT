package cjqt.core

import std.unittest.*

@Test
public func testPointValue() {
    let p = QPoint(3, 5)
    @Assert(p.x == 3)
    @Assert(p.y == 5)
    let q = QPoint(-1, -2)
    @Assert(q.x == -1)
    @Assert(q.y == -2)
}

@Test
public func testPointFValue() {
    let p = QPointF(1.5, 2.5)
    @Assert(p.x == 1.5)
    @Assert(p.y == 2.5)
    @Assert(!p.isNull())
    let origin = QPointF(0.0, 0.0)
    @Assert(origin.isNull())
    @Assert(p.manhattanLength() == 4.0)
    let t = p.transposed()
    @Assert(t.x == 2.5)
    @Assert(t.y == 1.5)
    let ip = p.toPoint()
    @Assert(ip.x == 2)
    @Assert(ip.y == 2)
}

@Test
public func testSizeValue() {
    let s = QSize(100, 200)
    @Assert(s.width == 100)
    @Assert(s.height == 200)
    @Assert(!s.isEmpty())
    @Assert(s.isValid())
    let empty = QSize(0, 0)
    @Assert(empty.isNull())
    @Assert(empty.isEmpty())
    let neg = QSize(-1, 5)
    @Assert(!neg.isValid())
}

@Test
public func testSizeFValue() {
    let s = QSizeF(12.5, 7.5)
    @Assert(s.width == 12.5)
    @Assert(s.height == 7.5)
}

@Test
public func testRectValue() {
    let r = QRect(10, 20, 100, 50)
    @Assert(r.x == 10)
    @Assert(r.y == 20)
    @Assert(r.width == 100)
    @Assert(r.height == 50)
}

@Test
public func testRectFValue() {
    let r = QRectF(1.0, 2.0, 3.0, 4.0)
    @Assert(r.x == 1.0)
    @Assert(r.y == 2.0)
    @Assert(r.width == 3.0)
    @Assert(r.height == 4.0)
    let topLeft = QPointF(0.0, 0.0)
    let bottomRight = QPointF(10.0, 10.0)
    let r2 = QRectF(topLeft, bottomRight)
    @Assert(r2.width == 10.0)
    @Assert(r2.height == 10.0)
}

@Test
public func testLineF() {
    let line = QLineF(0.0, 0.0, 3.0, 4.0)
    line.delete()
    @Assert(true)
}

@Test
public func testUrl() {
    let url = QUrl("https://cangjie-lang.cn")
    @Assert(url.isValid())
    @Assert(url.toString().contains("cangjie-lang.cn"))
    url.delete()
}

@Test
public func testVariantInt() {
    let v = QVariant(42)
    @Assert(v.isValid())
    @Assert(v.toInt() == 42)
    v.delete()
}

@Test
public func testVariantBool() {
    let v = QVariant(true)
    @Assert(v.isValid())
    @Assert(v.toBool())
    v.delete()
}

@Test
public func testVariantString() {
    let v = QVariant("hello cjqt")
    @Assert(v.isValid())
    @Assert(v.toString() == "hello cjqt")
    v.delete()
}

@Test
public func testVariantSetValue() {
    let v = QVariant()
    v.setValue(Int64(99))
    @Assert(v.toInt() == 99)
    v.setValue("world")
    @Assert(v.toString() == "world")
    v.delete()
}

@Test
public func testStringList() {
    let list = QStringList()
    list.append("alpha")
    list.append("beta")
    list.delete()
    @Assert(true)
}

@Test
public func testTimer() {
    let timer = QTimer()
    timer.start()
    timer.stop()
    timer.delete()
    @Assert(true)
}

@Test
public func testModelIndex() {
    let index = QModelIndex()
    index.setIrow(2)
    index.setIcol(3)
    @Assert(index.row() == 2)
    @Assert(index.column() == 3)
    index.delete()
}

@Test
public func testEvent() {
    let event = QEvent(QEventType.None)
    @Assert(event.isAccepted())
    event.ignore()
    @Assert(!event.isAccepted())
    event.accept()
    @Assert(event.isAccepted())
}
