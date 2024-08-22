// EXEC: cjc %import-path %L %l %f
// EXEC: ./main
import cjqt.qt.gui.*
import cjqt.qt.core.*
import cjqt.qt.widgets.*

main() {
    QApplication.create()
    QApplication.isCreate()
    let widget = QWidget()
    widget.hide()
    let timer = QTimer(500) {
        QApplication.quit()
    }
    timer.start()
    QApplication.exec()
    widget.delete()
    QApplication.delete()
    return 0
}
