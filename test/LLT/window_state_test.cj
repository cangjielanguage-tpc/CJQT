// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
package cjqt
import cjqt.gui.*
import cjqt.core.*
import cjqt.widgets.*

main() {
    QApplication.create()
    let widget = QWidget()
    widget.setWindowTitle("test")
    widget.setWindowFlag(WindowType.FramelessWindowHint.value(), true)
    widget.setMinimumWidth(800)
    widget.setMinimumHeight(600)
    widget.resize(800, 600)
    widget.show()
    widget.showMaximized()
    widget.showNormal()
    widget.showMinimized()
    widget.showNormal()
    widget.hide()
    widget.delete()
    QApplication.delete()
    println("test OK!")
    return 0
}
