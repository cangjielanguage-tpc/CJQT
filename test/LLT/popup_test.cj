// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
package cjqt
import cjqt.gui.*
import cjqt.core.*
import cjqt.widgets.*
import cjqt.tools.*

main() {
    QApplication.create()
    let win = QWidget()
    win.setWindowFlag(WindowType.Popup.value(), true)
    win.setWindowFlag(WindowType.FramelessWindowHint.value(), true)
    win.setAttribute(WidgetAttribute.WA_TranslucentBackground, true)
    win.setFixedSize(100, 350)

    let panel = QWidget()
    panel.setParent(win)
    panel.setGeometry(10, 10, 80, 300)
    panel.setStyleSheet("QWidget { background-color: #FFFFFF; border-radius: 5px; border: 1px solid #D8D8D8; }")

    win.show()
    let visible = win.isVisible()
    win.delete()
    QApplication.delete()
    println("test OK! visible=${visible}")
    return 0
}
