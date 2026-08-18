// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
package cjqt
import cjqt.gui.*
import cjqt.core.*
import cjqt.widgets.*

// 模拟 QQMusicWindow 的手动最大化/还原逻辑（无边框窗口规避 showMaximized bug）
class FakeMaxWindow <: QWidget {
    var maximized = false
    var normalWidth: Int64 = 0
    var normalHeight: Int64 = 0

    public init() {
        resize(1044, 704)
    }

    public func maximizeToScreen() {
        normalWidth = Int64(width())
        normalHeight = height()
        let screen = QApplication.primaryScreen()
        let geo = screen.geometry()
        resize(Int64(geo.width), Int64(geo.height))
        maximized = true
    }

    public func restoreNormal() {
        resize(normalWidth, normalHeight)
        maximized = false
    }

    public func isMax(): Bool {
        return maximized
    }

    public func curWidth(): Int64 {
        return Int64(width())
    }

    public func curHeight(): Int64 {
        return height()
    }
}

main() {
    QApplication.create()
    let win = FakeMaxWindow()
    win.show()
    let w0 = win.curWidth()
    let h0 = win.curHeight()
    win.maximizeToScreen()
    if (!win.isMax()) {
        println("FAIL: not maximized")
        return 1
    }
    let screen = QApplication.primaryScreen()
    let geo = screen.geometry()
    if (win.curWidth() != Int64(geo.width) || win.curHeight() != Int64(geo.height)) {
        println("FAIL: size mismatch ${win.curWidth()}x${win.curHeight()} vs ${geo.width}x${geo.height}")
        return 1
    }
    win.restoreNormal()
    if (win.isMax()) {
        println("FAIL: still maximized")
        return 1
    }
    if (win.curWidth() != w0 || win.curHeight() != h0) {
        println("FAIL: restore mismatch ${win.curWidth()}x${win.curHeight()} vs ${w0}x${h0}")
        return 1
    }
    win.delete()
    QApplication.delete()
    println("test OK!")
    return 0
}
