from cjqt import qt.widgets.*
import gui.*

main() {
    QApplication.create()

    let ui = Ui()
    ui.show()

    QApplication.exec()

    ui.delete()

    QApplication.delete()
    return 0
}