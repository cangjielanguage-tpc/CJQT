from cjqt import qt.gui.*
from cjqt import qt.code.*
from cjqt import qt.widgets.*

public class NotepadWindow <: QMainWindow {
    public init() {
        setFixedSize(500, 400)
        setWindowTitle("Notepad")

        setPalette(QPalette(QColor.LightGray))
        setAutoFillBackground(true)

        let menuBar = QMenuBar()
        setMenuBar(menuBar)

        let menuFile = QMenu()
        menuFile.setTitle("File(&F)")

        let actionOpen = QAction()
        actionOpen.setText("Open(&O)")
        actionOpen.setStatusTip("Open an existing file")

        let actionSave = QAction()
        actionSave.setText("Save(&S)")
        menuFile.addAction(actionOpen)
        menuFile.addSeparator()
        menuFile.addAction(actionSave)

        menuBar.addAction(menuFile.menuAction())
    }
}
