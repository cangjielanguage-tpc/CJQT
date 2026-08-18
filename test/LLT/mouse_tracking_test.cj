// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
package cjqt
import cjqt.gui.*
import cjqt.core.*
import cjqt.widgets.*

main() {
    QApplication.create()
    let widget = QWidget()
    widget.setMouseTracking(true)
    let b = widget.underMouse()
    widget.show()
    widget.setMouseTracking(false)
    widget.delete()
    QApplication.delete()
    println("test OK! underMouse=${b}")
    return 0
}
