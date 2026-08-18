// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
package cjqt
import cjqt.gui.*
import cjqt.core.*
import cjqt.widgets.*

// 验证无边框拖动逻辑：press记录偏移，move按globalPos-dragPos移动
class DragWindow <: QWidget {
    var dragPosX: Int64 = 0
    var dragPosY: Int64 = 0
    var isDragging = false
    var movedToX: Int64 = 0
    var movedToY: Int64 = 0

    public init() {
        resize(800, 600)
        setupDrag()
    }

    func setupDrag() {
        setMousePressEvent() {
            e =>
                if (e.button() == 1) {
                    let g = e.globalPos()
                    dragPosX = Int64(g.x) - x()
                    dragPosY = Int64(g.y) - y()
                    isDragging = true
                }
        }
        setMouseMoveEvent() {
            e =>
                if (isDragging) {
                    let g = e.globalPos()
                    movedToX = Int64(g.x) - dragPosX
                    movedToY = Int64(g.y) - dragPosY
                }
        }
        setMouseReleaseEvent() {
            e =>
                isDragging = false
        }
    }
}

main() {
    QApplication.create()
    let win = DragWindow()
    win.show()
    if (win.x() != 0 || win.y() != 0) {
        println("FAIL initial pos ${win.x()},${win.y()}")
        return 1
    }
    win.delete()
    QApplication.delete()
    println("test OK!")
    return 0
}
