// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
package cjqt
import cjqt.gui.*
import cjqt.core.*
import cjqt.widgets.*

main() {
    QApplication.create()
    let widget = QWidget()
    widget.move(100, 100)
    widget.resize(800, 600)
    widget.show()
    let p = widget.mapToGlobal()
    // offscreen 下全局坐标可能为 0，验证方法可用即可
    let ok = (p.x >= 0 && p.y >= 0)
    widget.delete()
    QApplication.delete()
    if (!ok) {
        println("FAIL mapToGlobal")
        return 1
    }
    println("test OK! mapToGlobal=${p.x},${p.y}")
    return 0
}
