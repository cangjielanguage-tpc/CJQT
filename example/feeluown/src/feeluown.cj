package feeluown

import cjqt.widgets.*
internal import feeluown.gui.*

main() {
    QApplication.create()

    let app = GuiApp()
    app.show()

    QApplication.exec()

    app.delete()

    QApplication.delete()
    return 0
}