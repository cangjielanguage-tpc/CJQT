package gui

from cjqt import qt.widgets.*
from cjqt import qt.gui.*

public class Ui <: QMainWindow {
    var mainLayout: QVBoxLayout //mainLayout

    var splitter: QSplitter 

    public init() {
        mainLayout = QVBoxLayout()

        splitter = QSplitter()
        splitter.setHandleWidth(0)

        let sidebar = LeftPanel()
        splitter.addWidget(sidebar)
        
        mainLayout.addWidget(splitter)

        let widget = QWidget(this)
        widget.setLayout(mainLayout)
        setCentralWidget(widget)

        resize(880, 600)
        setWindowTitle("FeelUOwn")
        setWindowIcon(QIcon("assets/icons/feeluown.png"))
    }
}
