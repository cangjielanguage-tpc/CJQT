// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
from cjqt import qt.gui.*
from cjqt import qt.code.*
from cjqt import qt.widgets.*

main() {
    QApplication.create()
    let widgets = QWidget()
    let timer = QTimer(500) {
        QApplication.quit()
    }
    timer.start()
    widgets.resize(100, 80)
    widgets.setWindowTitle("test")
    widgets.show()
    QApplication.exec()
    widgets.delete()
    QApplication.delete()
    return 0
}
